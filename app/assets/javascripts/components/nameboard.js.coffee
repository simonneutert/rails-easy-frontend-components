window.CoffeeComponent or= {}
CoffeeComponent.Nameboard = class Nameboard
  constructor: (@data, @target) ->
    elem = document.querySelector(@target)
    elem.innerHTML = "<ul>"
    for name in @data
      elem.innerHTML += "<li>Hello #{name}!</li>"
    elem.innerHTML += "</ul>"
