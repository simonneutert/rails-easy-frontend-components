# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

new CoffeeComponent.Document().ready ->
  do -> # each component instantiation in a self executing function
    renderNameboard = '.coffeecomponent-nameboard'
    element = document.querySelector(renderNameboard)
    return unless element?
    url = element.dataset.url
    new CoffeeComponent.AsyncJsonGet url, (data) ->
      new CoffeeComponent.Nameboard(data, renderNameboard)
