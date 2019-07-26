module React.Stylesheet.Internal.Consumer where

import Prelude (($))
import Effect.Unsafe (unsafePerformEffect)

import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol)

import React as React
import Stylesheet (CSSRuleSet, Stylesheet, addStyle)

import React.Stylesheet.Internal.Types

-- | Internal function that creates a Purescript React class which allows
-- | consumption of the Radox store via React Context
styleConsumer
  :: forall props label localState
   . IsSymbol label
  => React.Context (Maybe (Stylesheet label))
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


