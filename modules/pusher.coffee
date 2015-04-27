module.exports =
  dependencies: ['config']
  core: (deps)->
    c = deps.config()
    unless c == "I'm the result of calling the core of the config module"
      throw "CONFIG WAS NOT CORRECTLY LOADED, c = #{JSON.stringify(c)}"
