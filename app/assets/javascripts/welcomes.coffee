# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

new CoffeeComponent.Document().ready ->
  renderNameboard = '.coffeecomponent-nameboard'
  return unless document.querySelectorAll(renderNameboard).length > 0
  element = document.querySelectorAll(renderNameboard)[0]
  url = element.dataset.url
  new CoffeeComponent.AsyncJsonGet url, (data) ->
    new CoffeeComponent.Nameboard(data, renderNameboard)
