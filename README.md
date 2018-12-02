# No Frontend Framework, yet Async Components ;-)

Let's build an async json loaded component (Ajax), without using jQuery at all, which is used to render a chart.

[Code on GitHub](https://github.com/simonneutert/rails-easy-frontend-components)

### What you will learn
1. build reusable components
2. split data, rendering and logic (without using a Framework)

### Prerequisites
* I will use Coffeescript, but any other JS will do ;-)
* the app is called __CoffeeComponent__
* the namespace class in html is `coffeecomponent-component-name`
* the rails route path that responds with JSON is `api_names_path`

Simply think of a namespace and add it as a class to your class, in our case this would be the class `coffeecomponent-component-name`. `-component-name` building the scope.

## Add component div-wrapper to your HTML5 view

In your rails view, where you want to display data, add this div:

``` erb
<!-- in app/views/welcome/index.html.erb -->
<div class="coffeecomponent-nameboard" data-url="<%= api_names_path %>">
  <!-- Content get rendered here -->
</div>
```

### implement a jQuery independet `$(document).ready()`

``` coffeescript
window.CoffeeComponent or= {}
CoffeeComponent.Document = class Document
  ready: (fn = null) ->
    if document.attachEvent?
      if document.readyState is "complete" or document.readyState is not "loading"
        fn() if fn?
    else
      document.addEventListener 'DOMContentLoaded', ->
        fn() if fn?

```

### implement a jQuery independet Ajax Json Getter

``` coffeescript
# app/assets/javascript/lib/async_json_get.js.coffee
# again, wrap in namespace properly
window.CoffeeComponent or= {}
CoffeeComponent.AsyncJsonGet = class AsyncJsonGet
  constructor: (@url, @fn = null) ->
    @request = new XMLHttpRequest()
    @request.open('GET', @url, true)
    @request.onload = =>
      if @request.status >= 200 and @request.status < 400
        # Success!
        data = JSON.parse(@request.responseText)
        if @fn? then @fn(data) else data
      else
        # reached server, but it returned an error
    @request.onerror = ->
      # error
    @request.send()
```

### write the component itself

``` coffeescript
window.CoffeeComponent or= {}
CoffeeComponent.Nameboard = class Nameboard
  constructor: (@data, @target) ->
    elem = document.querySelector(@target)
    elem.innerHTML = "<ul>"
    for name in @data
      elem.innerHTML += "<li>Hello #{name}!</li>"
    elem.innerHTML += "</ul>"
```

### hook up your component in its controller's js asset file

``` coffeescript
# app/assets/javascript/welcomes.js.coffee
new CoffeeComponent.Document().ready ->
  do -> # each component instantiation in a self executing function
    renderNameboard = '.coffeecomponent-nameboard'
    element = document.querySelector(renderNameboard)
    return unless element?
    url = element.dataset.url
    new CoffeeComponent.AsyncJsonGet url, (data) ->
      new CoffeeComponent.Nameboard(data, renderNameboard)
```

## Homework

* scope styles in a similar manner
* implement a callback for error ajax requests
* write a useful component :-P
