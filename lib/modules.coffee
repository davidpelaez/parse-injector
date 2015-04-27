Parse = require('parse').Parse


# as a temporary replacement for Parse's promises use Q
Q = require 'q'
_ = require 'underscore'
Modules =
  # load a single module and return it's promise
  load: (mod)->
    mPromise = require "../modules/#{mod}.coffee"
    console.log "#{mod} depends on: #{mPromise.dependencies}"
    dependencies = {}
    depPromises = _.map mPromise.dependencies, (dep)=>
      depPromise = @load dep
      depPromise.then (d)=>
        loadedDependencies[dep] = d
      depPromise
    Q.allSettled(depPromises).then (results)->
      console.log "ALL SETTLED #{JSON.stringify results}"


  
  # set the dependencies for a module and pass it's definition
  # as the core function
  define: (deps, core)->


module.exports = Modules