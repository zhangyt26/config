local application = require "hs.application"
local fnutils = require "hs.fnutils"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local mjomatic = require "hs.mjomatic"
local window = require "hs.window"

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDHEIGHT = 12 
grid.GRIDWIDTH = 12

local mash = {"ctrl", "alt"}
local mashshift = {"ctrl", "alt", "shift"}

--
-- Window management
--

--Move windows
hotkey.bind(mashshift, 'DOWN', grid.pushWindowDown)
hotkey.bind(mashshift, 'UP', grid.pushWindowUp)
hotkey.bind(mashshift, 'LEFT', grid.pushWindowLeft)
hotkey.bind(mashshift, 'RIGHT', grid.pushWindowRight)

--resize windows
hotkey.bind(mash, 'UP', grid.resizeWindowShorter)
hotkey.bind(mash, 'DOWN', grid.resizeWindowTaller)
hotkey.bind(mash, 'RIGHT', grid.resizeWindowWider)
hotkey.bind(mash, 'LEFT', grid.resizeWindowThinner)

hotkey.bind(mash, 'N', grid.pushWindowNextScreen)
hotkey.bind(mash, 'P', grid.pushWindowPrevScreen)

hotkey.bind(mashshift, 'M', grid.maximizeWindow)

--
-- /Window management
--


--
-- Monitor and reload config when required
--
function reload_config(files)
  hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
--
-- /Monitor and reload config when required
--
