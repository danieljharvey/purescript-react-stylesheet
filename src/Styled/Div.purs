module React.Stylesheet.Styled.Div where

import React.Stylesheet.Internal.Types

import Data.Array (intercalate)
import Prelude (map, ($))
import React as React
import React.DOM as RDom
import React.DOM.Props as Props
import Stylesheet (CSSRuleSet, CSSSelector(..))

construct
  :: forall props 
   . StyleConsumer 
  -> (Array Props.Props -> Array React.ReactElement -> React.ReactElement) 
  -> CSSRuleSet props
  -> props
  -> Array React.ReactElement 
  -> React.ReactElement
construct styleConsumer element cssRule props children
  = styleConsumer props {} cssRule renderDiv
  where 
     renderDiv { classNames }
        = element [ Props.className (toClassNames classNames) ]
                      children

constructNoChildren
  :: forall props 
   . StyleConsumer 
  -> (Array Props.Props -> React.ReactElement) 
  -> CSSRuleSet props
  -> props
  -> React.ReactElement
constructNoChildren styleConsumer element cssRule props 
  = styleConsumer props {} cssRule renderDiv
  where 
     renderDiv { classNames }
        = element [ Props.className (toClassNames classNames) ]

noChildren 
  :: forall t24 
   . StyleConsumer 
  -> { br :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , col :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , embed :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , hr :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , img :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , input :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , keygen :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , link :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , menuitem :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , meta :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , param :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , source :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , track :: CSSRuleSet t24 -> t24 -> React.ReactElement
     , wbr :: CSSRuleSet t24 -> t24 -> React.ReactElement
     }
noChildren styleContext
  = let construct' = constructNoChildren styleContext
 in { br:           construct' RDom.br
    , col:          construct' RDom.col
    , embed:        construct' RDom.embed
    , hr:           construct' RDom.hr
    , img:          construct' RDom.img
    , input:        construct' RDom.input
    , keygen:       construct' RDom.keygen
    , link:         construct' RDom.link
    , menuitem:     construct' RDom.menuitem
    , meta:         construct' RDom.meta
    , param:        construct' RDom.param
    , source:       construct' RDom.source
    , track:        construct' RDom.track
    , wbr:          construct' RDom.wbr 
    }

withChildren 
  :: forall t39 
   . StyleConsumer 
  -> { _data :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , a :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , abbr :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , address :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , article :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , aside :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , audio :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , b :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , bdi :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , bdo :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , big :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , blockquote :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , body :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , button :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , canvas :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , caption :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , cite :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , code :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , colgroup :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , datalist :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , dd :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , del :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , details :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , dfn :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , dialog :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , div :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , dl :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , dt :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , em :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , fieldset :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , figcaption :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , figure :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , footer :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , form :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , h1 :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , h2 :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , h3 :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , h4 :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , h5 :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , h6 :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , head :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , header :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , html :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , i :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , iframe :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , ins :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , kbd :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , label :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , legend :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , li :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , main :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , map :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , mark :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , menu :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , meter :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , nav :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , noscript :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , object :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , ol :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , optgroup :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , option :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , output :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , p :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , picture :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , pre :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , progress :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , q :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , rp :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , rt :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , ruby :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , s :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , samp :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , script :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , section :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , select :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , small :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , span :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , strong :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , style :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , sub :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , summary :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , sup :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , table :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , tbody :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , td :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , textarea :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , tfoot :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , th :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , thead :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , time :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , title :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , tr :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , u :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , ul :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , var :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     , video :: CSSRuleSet t39 -> t39 -> Array React.ReactElement -> React.ReactElement
     }
withChildren styleContext
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
    , body:         construct' RDom.body
    , button:       construct' RDom.button
    , canvas:       construct' RDom.canvas
    , caption:      construct' RDom.caption
    , cite:         construct' RDom.cite
    , code:         construct' RDom.code
    , colgroup:     construct' RDom.colgroup
    , _data:        construct' RDom._data
    , datalist:     construct' RDom.datalist
    , dd:           construct' RDom.dd
    , del:          construct' RDom.del
    , details:      construct' RDom.details
    , dfn:          construct' RDom.dfn
    , dialog:       construct' RDom.dialog
    , div:          construct' RDom.div
    , dl:           construct' RDom.dl
    , dt:           construct' RDom.dt
    , em:           construct' RDom.em
    , fieldset:     construct' RDom.fieldset
    , figcaption:   construct' RDom.figcaption
    , figure:       construct' RDom.figure
    , footer:       construct' RDom.footer
    , form:         construct' RDom.form
    , h1:           construct' RDom.h1
    , h2:           construct' RDom.h2
    , h3:           construct' RDom.h3
    , h4:           construct' RDom.h4
    , h5:           construct' RDom.h5
    , h6:           construct' RDom.h6
    , head:         construct' RDom.head
    , header:       construct' RDom.header
    , html:         construct' RDom.html
    , i:            construct' RDom.i
    , iframe:       construct' RDom.iframe
    , ins:          construct' RDom.ins
    , kbd:          construct' RDom.kbd
    , label:        construct' RDom.label
    , legend:       construct' RDom.legend
    , li:           construct' RDom.li
    , main:         construct' RDom.main
    , map:          construct' RDom.map
    , mark:         construct' RDom.mark
    , menu:         construct' RDom.menu
    , meter:        construct' RDom.meter
    , nav:          construct' RDom.nav
    , noscript:     construct' RDom.noscript
    , object:       construct' RDom.object
    , ol:           construct' RDom.ol
    , optgroup:     construct' RDom.optgroup
    , option:       construct' RDom.option
    , output:       construct' RDom.output
    , p:            construct' RDom.p
    , picture:      construct' RDom.picture
    , pre:          construct' RDom.pre
    , progress:     construct' RDom.progress
    , q:            construct' RDom.q
    , rp:           construct' RDom.rp
    , rt:           construct' RDom.rt
    , ruby:         construct' RDom.ruby
    , s:            construct' RDom.s
    , samp:         construct' RDom.samp
    , script:       construct' RDom.script
    , section:      construct' RDom.section
    , select:       construct' RDom.select
    , small:        construct' RDom.small
    , span:         construct' RDom.span
    , strong:       construct' RDom.strong
    , style:        construct' RDom.style
    , sub:          construct' RDom.sub
    , summary:      construct' RDom.summary
    , sup:          construct' RDom.sup
    , table:        construct' RDom.table
    , tbody:        construct' RDom.tbody
    , td:           construct' RDom.td
    , textarea:     construct' RDom.textarea
    , tfoot:        construct' RDom.tfoot
    , th:           construct' RDom.th
    , thead:        construct' RDom.thead
    , time:         construct' RDom.time
    , title:        construct' RDom.title
    , tr:           construct' RDom.tr
    , u:            construct' RDom.u
    , ul:           construct' RDom.ul
    , var:          construct' RDom.var
    , video:        construct' RDom.video
    }

toClassNames :: Array CSSSelector -> String
toClassNames as
  = intercalate " " $ map unwrap as
  where
    unwrap (CSSClassSelector s) = s
