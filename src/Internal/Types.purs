module React.Stylesheet.Internal.Types where

import React as React
import React.DOM.Props as Props
import Stylesheet

type StyleRenderMethod props localState 
  = (
      { props      :: props
      , localState :: localState
      , classNames :: Array CSSSelector
      } -> React.ReactElement
    ) 

type StyleProvider
  = React.ReactClass
      { children :: Array React.ReactElement }

type StyleConsumer
  = forall props localState
  . props
 -> localState
 -> CSSRuleSet props
 -> StyleRenderMethod props localState 
 -> React.ReactElement

type StyleContext
  = { provider :: StyleProvider
    , consumer :: StyleConsumer 
    , elements :: StyledElements
    }

type StyledNoChildren styleProps
   = CSSRuleSet styleProps 
  -> styleProps 
  -> Array Props.Props 
  -> React.ReactElement

type StyledWithChildren styleProps
   = CSSRuleSet styleProps 
  -> styleProps 
  -> Array Props.Props 
  -> Array React.ReactElement
  -> React.ReactElement

type StyledElements
  = forall styleProps
  .  { br       :: StyledNoChildren styleProps
     , col      :: StyledNoChildren styleProps
     , embed    :: StyledNoChildren styleProps
     , hr       :: StyledNoChildren styleProps
     , img      :: StyledNoChildren styleProps
     , input    :: StyledNoChildren styleProps
     , keygen   :: StyledNoChildren styleProps 
     , link     :: StyledNoChildren styleProps
     , menuitem :: StyledNoChildren styleProps
     , meta     :: StyledNoChildren styleProps
     , param    :: StyledNoChildren styleProps
     , source   :: StyledNoChildren styleProps
     , track    :: StyledNoChildren styleProps
     , wbr      :: StyledNoChildren styleProps
     , _data      :: StyledWithChildren styleProps 
     , a          :: StyledWithChildren styleProps 
     , abbr       :: StyledWithChildren styleProps
     , address    :: StyledWithChildren styleProps
     , article    :: StyledWithChildren styleProps
     , aside      :: StyledWithChildren styleProps
     , audio      :: StyledWithChildren styleProps
     , b          :: StyledWithChildren styleProps
     , bdi        :: StyledWithChildren styleProps
     , bdo        :: StyledWithChildren styleProps
     , big        :: StyledWithChildren styleProps
     , blockquote :: StyledWithChildren styleProps
     , body       :: StyledWithChildren styleProps
     , button     :: StyledWithChildren styleProps
     , canvas     :: StyledWithChildren styleProps
     , caption    :: StyledWithChildren styleProps
     , cite       :: StyledWithChildren styleProps
     , code       :: StyledWithChildren styleProps
     , colgroup   :: StyledWithChildren styleProps
     , datalist   :: StyledWithChildren styleProps
     , dd         :: StyledWithChildren styleProps
     , del        :: StyledWithChildren styleProps
     , details    :: StyledWithChildren styleProps
     , dfn        :: StyledWithChildren styleProps
     , dialog     :: StyledWithChildren styleProps
     , div        :: StyledWithChildren styleProps
     , dl         :: StyledWithChildren styleProps
     , dt         :: StyledWithChildren styleProps
     , em         :: StyledWithChildren styleProps
     , fieldset   :: StyledWithChildren styleProps
     , figcaption :: StyledWithChildren styleProps
     , figure     :: StyledWithChildren styleProps
     , footer     :: StyledWithChildren styleProps
     , form       :: StyledWithChildren styleProps
     , h1         :: StyledWithChildren styleProps
     , h2         :: StyledWithChildren styleProps
     , h3         :: StyledWithChildren styleProps
     , h4         :: StyledWithChildren styleProps
     , h5         :: StyledWithChildren styleProps
     , h6         :: StyledWithChildren styleProps
     , head       :: StyledWithChildren styleProps
     , header     :: StyledWithChildren styleProps
     , html       :: StyledWithChildren styleProps
     , i          :: StyledWithChildren styleProps
     , iframe     :: StyledWithChildren styleProps
     , ins        :: StyledWithChildren styleProps
     , kbd        :: StyledWithChildren styleProps
     , label      :: StyledWithChildren styleProps
     , legend     :: StyledWithChildren styleProps
     , li         :: StyledWithChildren styleProps
     , main       :: StyledWithChildren styleProps
     , map        :: StyledWithChildren styleProps
     , mark       :: StyledWithChildren styleProps
     , menu       :: StyledWithChildren styleProps
     , meter      :: StyledWithChildren styleProps
     , nav        :: StyledWithChildren styleProps
     , noscript   :: StyledWithChildren styleProps
     , object     :: StyledWithChildren styleProps
     , ol         :: StyledWithChildren styleProps
     , optgroup   :: StyledWithChildren styleProps
     , option     :: StyledWithChildren styleProps
     , output     :: StyledWithChildren styleProps
     , p          :: StyledWithChildren styleProps
     , picture    :: StyledWithChildren styleProps
     , pre        :: StyledWithChildren styleProps
     , progress   :: StyledWithChildren styleProps
     , q          :: StyledWithChildren styleProps
     , rp         :: StyledWithChildren styleProps
     , rt         :: StyledWithChildren styleProps
     , ruby       :: StyledWithChildren styleProps
     , s          :: StyledWithChildren styleProps
     , samp       :: StyledWithChildren styleProps
     , script     :: StyledWithChildren styleProps
     , section    :: StyledWithChildren styleProps
     , select     :: StyledWithChildren styleProps
     , small      :: StyledWithChildren styleProps
     , span       :: StyledWithChildren styleProps
     , strong     :: StyledWithChildren styleProps
     , style      :: StyledWithChildren styleProps
     , sub        :: StyledWithChildren styleProps
     , summary    :: StyledWithChildren styleProps
     , sup        :: StyledWithChildren styleProps
     , table      :: StyledWithChildren styleProps
     , tbody      :: StyledWithChildren styleProps
     , td         :: StyledWithChildren styleProps
     , textarea   :: StyledWithChildren styleProps
     , tfoot      :: StyledWithChildren styleProps
     , th         :: StyledWithChildren styleProps
     , thead      :: StyledWithChildren styleProps
     , time       :: StyledWithChildren styleProps
     , title      :: StyledWithChildren styleProps
     , tr         :: StyledWithChildren styleProps
     , u          :: StyledWithChildren styleProps
     , ul         :: StyledWithChildren styleProps
     , var        :: StyledWithChildren styleProps
     , video      :: StyledWithChildren styleProps
     }

