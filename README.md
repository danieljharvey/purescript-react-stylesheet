# purescript-react-stylesheet

Utilities to use [Purescript Stylesheet](https://github.com/danieljharvey/purescript-stylesheet) with [Purescript React](https://github.com/purescript-contrib/purescript-react). Demo app [here](https://github.com/danieljharvey/purescript-stylesheet-example).

Purescript Stylesheet is a Virtual Stylesheet that allows you to dynamically add styles to a CSS Stylesheet. This library provides components that provide and consume a Virtual Stylesheet via React Context.

### What?

Purescript Stylesheet allows you to create styles for your app that change depending on state. You provide functions from `props` to `CSS` and Stylesheet takes care of plopping them into a real stylesheet in your browser and making things look nice.

### Like Styled Components?

Yeah, that kind of thing. The ideas in this library aren't really new, I just wanted something like this in Purescript.

### How do I use it then?

Good question.

We'll start by creating a `StyleContext`.

```haskell
import React.Stylesheet

styleContext :: StyleContext
styleContext 
  = createStyleContext (SProxy :: SProxy "hey-nice-styles-buddy")
```

This contains three things - 

1. Provider - a React class that provides the Stylesheet superpowers via React Context.
2. Consumer - a React class that can be used to consume the Stylesheet superpowers
3. Elements - a big pile of pre-wrapped DOM elements that will probably be the most useful part.

We need to put the `Provider` at the tree of our app.

```haskell
mainClass :: React.ReactClass { }
mainClass = React.component "Main" component
  where
  component this =
    pure { state: {
            { todos: []
            }
         , render: pure 
            $ React.createLeafElement styleContext.provider
              { children: [ render ] }
         }
    where
    render state = ...
```

In this example the `render` function then takes care of the rest of your app.

### What now?

Let's make an element with styles!

We define styles with a `CSSRuleSet`. It takes a type that defines the props it can receive. Here is one that takes no props (which we represent with `unit`).

```haskell
containerStyle :: CSSRuleSet Unit
containerStyle
  = str """
      margin: 20px;
      padding: 20px;
      border-radius: 10px;
      display: flex;
      flex-direction: row;
      justify-content: center;
    """
```

We are using Purescript's triple quote thing to smash a big lump of stupid CSS into a `CSSRuleSet`. Now let's give them to an element...

```haskell
container :: Array Props -> Array ReactElement -> ReactElement
container 
  = styleContext.elements.div containerStyles unit
```

We've taken the `div` element from our `StyleContext`, and added these styles to it. Now we can use this `container` element in our app:

```haskell
render = container [] [ text "I am some text in an attractive looking box" ]
```

### Good stuff.

Now, what about something smarter? Let's have something with props.

```haskell
data TrafficLights
  = Red
  | Yellow
  | Green

trafficStyle :: CSSRuleSet TrafficLights
trafficStyle
  = str """
      border: none; 
      border-radius: 20px;
      width: 40px;
      height: 40px;
      """
  <> fun (\light -> case light of
            Red -> "background-color: red;"
            Yellow -> "background-color: yellow;"
            Green -> "background-color: green;") 

trafficLight :: TrafficLights -> ReactElement
trafficLight colour 
  = styleContext.elements.div trafficStyle colour [] {}
```

We have have a colour-changing traffic light!

### Working example:

The full working example is [here](https://github.com/danieljharvey/purescript-stylesheet-example).

### Why just Purescript React? Why not [insert thing]?

If this doesn't turn out to be an utter disaster, I would like to port it for use in React Basic and Halogen. If you are good at those things and want to help, by all means get in touch.

### Why plain text CSS and not something more type-safe?

Three reasons:

1. Lazyness
2. Easy to paste existing CSS in for ease of adoption
3. Lazyness

### Docs?

Yes, on [Pursuit](https://pursuit.purescript.org/packages/purescript-react-stylesheet/0.0.2)111