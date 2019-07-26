module React.Stylesheet.Internal.Types where

import React as React
import PursUI

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


