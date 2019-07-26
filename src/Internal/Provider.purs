module React.Stylesheet.Internal.Provider where

import Prelude (bind, pure, ($))
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol)
import React as React
import Stylesheet

-- | Internal function for creating a Purescript React class that providers the
-- | Radox store through React Context
styleProvider 
  :: forall label
   . IsSymbol label
  => React.Context (Maybe (Stylesheet label))
  -> React.ReactClass { children :: Array React.ReactElement }
styleProvider context 
  = React.pureComponent "Provider" component
  where
    component this = do
        (stylesheet :: Stylesheet label) <- createBlankStylesheet
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



