module React.Stylesheet.Styled.Div where

import Prelude (map, ($))
import Data.Array (intercalate)
import React.DOM.Props as Props
import React as React
import React.DOM as RDom

import React.Stylesheet.Internal.StyleContext
import React.Stylesheet.Internal.Types

import Stylesheet (CSSRuleSet, CSSSelector(..))

construct
  :: forall props label
   . StyleContext label
  -> (Array Props.Props -> Array React.ReactElement -> React.ReactElement) 
  -> CSSRuleSet props
  -> props
  -> Array React.ReactElement 
  -> React.ReactElement
construct styleContext element cssRule props children
  = styleContext.consumer props {} cssRule renderDiv
  where 
     renderDiv { classNames }
        = RDom.div [ Props.className (toClassNames classNames) ]
                      children

things styleContext
  = let construct' = construct styleContext
 in { a:            construct' RDom.a
    , abbr:         construct' RDom.abbr
    , address:      construct' RDom.address
    , article:      construct' RDom.article
    , aside:        construct' RDom.aside
    , audio:        construct' RDom.audio
    , b:            construct' RDom.b
    , bdi:          construct' RDom.bdi
    , bdo:          construct' RDom.bdo
    , big:          construct' RDom.big
    , blockquote:   construct' RDom.blockquote
    , div:          construct' RDom.div
    }

toClassNames :: Array CSSSelector -> String
toClassNames as
  = intercalate " " $ map unwrap as
  where
    unwrap (CSSClassSelector s) = s
