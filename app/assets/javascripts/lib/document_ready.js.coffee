window.CoffeeComponent or= {}
CoffeeComponent.Document = class Document
  ready: (fn = null) ->
    if document.attachEvent?
      if document.readyState is "complete" or document.readyState is not "loading"
        fn() if fn?
    else
      document.addEventListener 'DOMContentLoaded', ->
        fn() if fn?
