module App.Components.Styled.Div (div) where

import Prelude (map, ($))
import Data.Array (intercalate)
import React.DOM.Props as Props
import React as React
import React.DOM as RDom

import StyleProvider

import PursUI (CSSRuleSet, CSSSelector(..))

construct
  :: forall props
   . (Array Props.Props -> Array React.ReactElement -> React.ReactElement) 
  -> CSSRuleSet props
  -> props
  -> Array React.ReactElement 
  -> React.ReactElement
construct element cssRule props children
  = styleContext.consumer props {} cssRule renderDiv
  where 
     renderDiv { classNames }
        = RDom.div [ Props.className (toClassNames classNames) ]
                      children

div 
  :: forall props
   . CSSRuleSet props 
  -> props 
  -> Array React.ReactElement 
  -> React.ReactElement
div = construct RDom.div

toClassNames :: Array CSSSelector -> String
toClassNames as
  = intercalate " " $ map unwrap as
  where
    unwrap (CSSClassSelector s) = s
