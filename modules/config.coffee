Q = require 'q'
config = Q.defer()
config.dependencies = []
config.promise.then (dependencies)->
  console.log "RESOLVED the config module core"
  (-> "I'm the result of calling the core of the config module")
module.exports = config