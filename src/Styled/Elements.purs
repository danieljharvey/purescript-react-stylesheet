module React.Stylesheet.Styled.Elements where

import Prelude (map, ($), (<>))
import Data.Array (intercalate)
import React as React
import React.DOM as RDom
import React.DOM.Props as Props

import React.Stylesheet.Internal.Types
import Stylesheet (CSSRuleSet, CSSSelector(..))

construct
  :: forall styleProps 
   . StyleConsumer 
  -> (Array Props.Props -> Array React.ReactElement -> React.ReactElement) 
  -> CSSRuleSet styleProps
  -> styleProps
  -> Array Props.Props
  -> Array React.ReactElement 
  -> React.ReactElement
construct styleConsumer element cssRule styleProps props children
  = styleConsumer styleProps {} cssRule renderDiv
  where
     allProps names
      = props <> [ Props.className (toClassNames names) ] 

     renderDiv { classNames }
       = element (allProps classNames) children

constructNoChildren
  :: forall styleProps 
   . StyleConsumer 
  -> (Array Props.Props -> React.ReactElement) 
  -> CSSRuleSet styleProps
  -> styleProps
  -> Array Props.Props
  -> React.ReactElement
constructNoChildren styleConsumer element cssRule styleProps props 
  = styleConsumer styleProps {} cssRule renderDiv
  where 
     allProps names
      = props <> [ Props.className (toClassNames names) ] 

     renderDiv { classNames }
       = element (allProps classNames) 

createStyledElements 
  :: StyleConsumer 
  -> StyledElements
createStyledElements styleContext
  = let constructNo' = constructNoChildren styleContext
        construct' = construct styleContext
 in { br:           constructNo' RDom.br
    , col:          constructNo' RDom.col
    , embed:        constructNo' RDom.embed
    , hr:           constructNo' RDom.hr
    , img:          constructNo' RDom.img
    , input:        constructNo' RDom.input
    , keygen:       constructNo' RDom.keygen
    , link:         constructNo' RDom.link
    , menuitem:     constructNo' RDom.menuitem
    , meta:         constructNo' RDom.meta
    , param:        constructNo' RDom.param
    , source:       constructNo' RDom.source
    , track:        constructNo' RDom.track
    , wbr:          constructNo' RDom.wbr
    , a:            construct' RDom.a
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
