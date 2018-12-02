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
