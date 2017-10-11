require "windowedge"

hs.loadSpoon('ClipShow')
hs.loadSpoon('ModalMgr')

-- init grid
hs.grid.MARGINX 	= 0
hs.grid.MARGINY 	= 0
hs.grid.GRIDWIDTH 	= 16
hs.grid.GRIDHEIGHT 	= 16

-- hotkey mash
local mash       = {"ctrl", "alt"}
local mash_app 	 = {"cmd", "alt", "ctrl"}
local mash_shift = {"ctrl", "alt", "shift"}

--------------------------------------------------------------------------------
appCuts = {
  i = 'iterm',
  c = 'Google chrome',
  s = 'Spotify'
}

-- Launch applications
for key, app in pairs(appCuts) do
  hs.hotkey.bind(mash_app, key, function () hs.application.launchOrFocus(app) end)
end

-- maximize window
hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

-- multi monitor
hs.hotkey.bind(mash, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'P', hs.grid.pushWindowPrevScreen)

-- move windows
hs.hotkey.bind(mash_shift, 'LEFT', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash_shift, 'DOWN', hs.grid.pushWindowDown)
hs.hotkey.bind(mash_shift, 'UP', hs.grid.pushWindowUp)
hs.hotkey.bind(mash_shift, 'RIGHT', hs.grid.pushWindowRight)

-- resize windows
hs.hotkey.bind(mash, 'LEFT', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'UP', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, 'DOWN', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, 'RIGHT', hs.grid.resizeWindowWider)

-- Window Hints
function hintSelected(window)
  window.focus()
end
hs.hotkey.bind(mash, '.', function() hs.hints.windowHints(nil, hintSelected) end)

-- windowedge key binding
hs.hotkey.bind(mash, "L", function() movewin("left") end)
hs.hotkey.bind(mash, "R", function() movewin("right") end)

-- Monitor and reload config when required
function reload_config(files)
  hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
