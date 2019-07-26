module React.Stylesheet.Internal.StyleContext where

import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, SProxy)
import React as React
import PursUI (PursUI)
import React.Stylesheet.Internal.Types
import React.Stylesheet.Internal.Provider (styleProvider)
import React.Stylesheet.Internal.Consumer (styleConsumer)

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


