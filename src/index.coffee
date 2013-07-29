eyebrowse = require("eyebrowse")




class EyebrowseBrowser

  name: "Eyebrowse"


  DEFAULT_CMD: 
    linux: eyebrowse.path
    darwin: eyebrowse.path
    win32: eyebrowse.path

  ENV_CMD: "EYEBROWSE_BIN"


  ###`
  ###

  constructor: (baseBrowserDecorator, name, @args) ->
    baseBrowserDecorator @

    console.log name, args
    @browserName = name.split("eyebrowse:").join("").replace(":", "@")

    #@_getCommand = @constructor.prototype._getCommand
    @_getOptions = @constructor.prototype._getOptions

  ###
  ###

  _start: (url) ->
    console.log arguments

  ###
  ###

  _getCommand: () ->
    console.log arguments

  ###
  ###

  _getOptions: (url) ->
    ["start", @browserName, url]

  ###
  ###

  @$inject: ["baseBrowserDecorator", "name", "args"]


try 
  browsers = require process.cwd() + "/.browsers"
catch e
  browsers = [
    "Chrome:Latest",
    "Safari:Latest",
    "Opera:Latest",
    "Firefox:Latest",
    "IE:Latest"
  ]

for cmd in browsers
  exports["launcher:eyebrowse:#{cmd}"] = ["type", EyebrowseBrowser]

