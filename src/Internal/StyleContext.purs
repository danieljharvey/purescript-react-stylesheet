module React.Stylesheet.Internal.StyleContext where

import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, SProxy)
import React as React
import Stylesheet (Stylesheet)
import React.Stylesheet.Internal.Types (StyleConsumer, StyleContext)
import React.Stylesheet.Internal.Provider (styleProvider)
import React.Stylesheet.Internal.Consumer (styleConsumer)
import React.Stylesheet.Styled.Elements

-- | Takes a CombinedReducer and a default state, and returns both a root-level
-- | provider and connect component for using the Radox store
createStyleContext
  :: forall label 
   . IsSymbol label
  => SProxy label
  -> StyleContext 
createStyleContext label =
  let myContext = React.createContext (Nothing :: Maybe (Stylesheet label))
      (myConsumer :: StyleConsumer) = styleConsumer myContext
  in  { provider : styleProvider myContext
      , consumer : myConsumer
      , elements: createStyledElements myConsumer
      }

