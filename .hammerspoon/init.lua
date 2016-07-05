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
-- toggle push window to edge and restore to screen
--

-- somewhere to store the original position of moved windows
local origWindowPos = {}

-- cleanup the original position when window restored or closed
local function cleanupWindowPos(_,_,_,id)
  origWindowPos[id] = nil
end

-- function to move a window to edge or back
local function movewin(direction)
  local win = hs.window.focusedWindow()
  local res = hs.screen.mainScreen():frame()
  local id = win:id()

  if not origWindowPos[id] then
    -- move the window to edge if no original position is stored in
    -- origWindowPos for this window id
    local f = win:frame()
    origWindowPos[id] = win:frame()

    -- add a watcher so we can clean the origWindowPos if window is closed
    local watcher = win:newWatcher(cleanupWindowPos, id)
    watcher:start({hs.uielement.watcher.elementDestroyed})
    f.y = 0
    f.h = res.h
    f.w = res.w / 2
 
    if direction == "left" then f.x = 0 end
    if direction == "right" then f.x = res.w - f.w end
    win:setFrame(f)
  else
    -- restore the window if there is a value for origWindowPos
    win:setFrame(origWindowPos[id])
    -- and clear the origWindowPos value
    cleanupWindowPos(_,_,_,id)
  end
end

hs.hotkey.bind(mash, "L", function() movewin("left") end)
hs.hotkey.bind(mash, "R", function() movewin("right") end)
--
-- /toggle push window to edge and restore to screen
--

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
