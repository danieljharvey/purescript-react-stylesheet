module React.Stylesheet.Internal.Types where

import React as React
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
    , noChildren :: NoChildren 
    , withChildren :: WithChildren 
    }

type NoChildren 
  = forall props
  .  { br :: CSSRuleSet props -> props -> React.ReactElement
     , col :: CSSRuleSet props -> props -> React.ReactElement
     , embed :: CSSRuleSet props -> props -> React.ReactElement
     , hr :: CSSRuleSet props -> props -> React.ReactElement
     , img :: CSSRuleSet props -> props -> React.ReactElement
     , input :: CSSRuleSet props -> props -> React.ReactElement
     , keygen :: CSSRuleSet props -> props -> React.ReactElement
     , link :: CSSRuleSet props -> props -> React.ReactElement
     , menuitem :: CSSRuleSet props -> props -> React.ReactElement
     , meta :: CSSRuleSet props -> props -> React.ReactElement
     , param :: CSSRuleSet props -> props -> React.ReactElement
     , source :: CSSRuleSet props -> props -> React.ReactElement
     , track :: CSSRuleSet props -> props -> React.ReactElement
     , wbr :: CSSRuleSet props -> props -> React.ReactElement
     }

type WithChildren
    = forall props
    . { _data :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , a :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , abbr :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , address :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , article :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , aside :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , audio :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , b :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , bdi :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , bdo :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , big :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , blockquote :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , body :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , button :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , canvas :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , caption :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , cite :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , code :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , colgroup :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , datalist :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , dd :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , del :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , details :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , dfn :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , dialog :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , div :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , dl :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , dt :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , em :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , fieldset :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , figcaption :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , figure :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , footer :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , form :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , h1 :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , h2 :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , h3 :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , h4 :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , h5 :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , h6 :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , head :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , header :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , html :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , i :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , iframe :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , ins :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , kbd :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , label :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , legend :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , li :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , main :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , map :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , mark :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , menu :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , meter :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , nav :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , noscript :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , object :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , ol :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , optgroup :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , option :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , output :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , p :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , picture :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , pre :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , progress :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , q :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , rp :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , rt :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , ruby :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , s :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , samp :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , script :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , section :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , select :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , small :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , span :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , strong :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , style :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , sub :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , summary :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , sup :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , table :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , tbody :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , td :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , textarea :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , tfoot :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , th :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , thead :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , time :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , title :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , tr :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , u :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , ul :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , var :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      , video :: CSSRuleSet props -> props -> Array React.ReactElement -> React.ReactElement
      }
