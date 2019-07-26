module StyleProvider where

import Prelude (bind, pure, ($))
import Effect.Unsafe (unsafePerformEffect)

import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, SProxy(..))

import React as React
import PursUI

styleContext :: StyleContext "horse" 
styleContext = createStyleContext (SProxy :: SProxy "horse")

type StyleRenderMethod props localState 
  = (
      { props      :: props
      , localState :: localState
      , classNames :: Array CSSSelector
      } -> React.ReactElement
    ) 

type StyleContext (label :: Symbol)
  = { provider :: React.ReactClass { children :: Array React.ReactElement }
    , consumer :: (forall props localState
                . props
               -> localState
               -> CSSRuleSet props
               -> StyleRenderMethod props localState 
               -> React.ReactElement)
    }

-- | Takes a CombinedReducer and a default state, and returns both a root-level
-- | provider and connect component for using the Radox store
createStyleContext
  :: forall label
   . IsSymbol label
  => SProxy label
  -> StyleContext label
createStyleContext label =
  let myContext = React.createContext (Nothing :: Maybe (PursUI label))
  in  { provider : styleProvider myContext
      , consumer : styleConsumer myContext
      }

-- | Internal function for creating a Purescript React class that providers the
-- | Radox store through React Context
styleProvider 
  :: forall label
   . IsSymbol label
  => React.Context (Maybe (PursUI label))
  -> React.ReactClass { children :: Array React.ReactElement }
styleProvider context 
  = React.pureComponent "Provider" component
  where
    component this = do
        (stylesheet :: PursUI label) <- createBlankStyleSheet
        pure $ { state  : { }
               , render : render' this stylesheet
               }

    render' this stylesheet = do
        props <- React.getProps this
        state <- React.getState this
        pure $ 
            React.createElement 
              context.provider 
              { value: Just stylesheet 
              }
              props.children


-- | Internal function that creates a Purescript React class which allows
-- | consumption of the Radox store via React Context
styleConsumer
  :: forall props label localState
   . IsSymbol label
  => React.Context (Maybe (PursUI label))
  -> props
  -> localState
  -> CSSRuleSet props
  -> StyleRenderMethod props localState 
  -> React.ReactElement
styleConsumer context props localState cssRules renderer = do
  let render stylesheet 
        = let classNames = case stylesheet of
                Just stylesheet' 
                  -> unsafePerformEffect $ addStyle stylesheet' cssRules props
                _ -> []
          in renderer { props: props
                      , localState: localState
                      , classNames: classNames
                      }
  React.createLeafElement context.consumer
          { children: render }


