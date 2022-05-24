hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
  -- hs.alert.show("Hello World!")
  hs.notify.new({ title = "FFFF", informativeText = "Hello World" }):send()
end)



--- Hyper!!
-- Hyper = hs.loadSpoon('Hyper', false)
Hyper = dofile("Spoons/Hyper.spoon/init.lua")
App = hs.application

Hyper:bindHotKeys({ hyperKey = { {}, 'F18' } })

Hyper:bind({}, 'r', function()
  hs.reload()
end)

Hyper:bind({}, 't', function()
  hs.alert.show("Launching Alacritty")
  os.execute("open -nF /Applications/Alacritty.app")
end)


function yabai(args)
  hs.task.new("/opt/homebrew/bin/yabai", nil, function(ud, ...)
    print("stream", hs.inspect(table.pack(...)))
    return true
  end, args):start()
end

local fastKeyStroke = function(modifiers, character)
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

hs.fnutils.each({
  -- Movement
  { key = 'n', mod = {}, direction = 'left' },
  { key = 'e', mod = {}, direction = 'down' },
  { key = 'u', mod = {}, direction = 'up' },
  { key = 'i', mod = {}, direction = 'right' },
  { key = 'n', mod = { 'option' }, direction = 'left' },
  { key = 'e', mod = { 'option' }, direction = 'down' },
  { key = 'u', mod = { 'option' }, direction = 'up' },
  { key = 'i', mod = { 'option' }, direction = 'right' },
  { key = 'n', mod = { 'cmd' }, direction = 'left' }, -- beginning of line
  { key = 'i', mod = { 'cmd' }, direction = 'right' }, -- end of line
}, function(hotkey)
  Hyper:bind(hotkey.mod, hotkey.key,
    function()
      fastKeyStroke(hotkey.mod, hotkey.direction)
    end,
    nil,
    function()
    fastKeyStroke(hotkey.mod, hotkey.direction)
  end
  )
end
)



Meh = dofile("Spoons/Hyper.spoon/init.lua")
Meh:bindHotKeys({ hyperKey = { {}, 'F19' } })

Meh:bind({}, 'r', function()
  hs.alert.show("Meh")
end)

hs.fnutils.each({
  -- Yabai Focus Movement
  { key = 'n', mod = { "command" }, fn = function() yabai({ "-m", "window", "--swap", "west" }) end },
  { key = 'e', mod = { "command" }, fn = function() yabai({ "-m", "window", "--swap", "south" }) end },
  { key = 'i', mod = { "command" }, fn = function() yabai({ "-m", "window", "--swap", "north" }) end },
  { key = 'o', mod = { "command" }, fn = function() yabai({ "-m", "window", "--swap", "east" }) end },

  { key = 'n', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "west" }) end },
  { key = 'e', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "south" }) end },
  { key = 'i', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "north" }) end },
  { key = 'o', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "east" }) end },
  { key = "return", mod = {}, fn = function() yabai({ "-m", "window", "--focus", "mouse" }) end },

  { key = "space", mod = {}, fn = function() yabai({ "-m", "window", "--toggle", "float" }) end },

  { key = "f", mod = {}, fn = function() yabai({ "-m", "window", "--toggle", "zoom-fullscreen" }) end },

  { key = '1', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "1" }) end },
  { key = '2', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "2" }) end },
  { key = '3', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "3" }) end },
  { key = '4', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "4" }) end },
  { key = '5', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "5" }) end },
  { key = '6', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "6" }) end },
  { key = '7', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "7" }) end },

  { key = 'l', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "next" }) end },
  { key = 'h', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "prev" }) end },

  { key = '1', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "1" }) end },
  { key = '2', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "2" }) end },
  { key = '3', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "3" }) end },
  { key = '4', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "4" }) end },
  { key = '5', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "5" }) end },
  { key = '6', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "6" }) end },
  { key = '7', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "7" }) end },
}, function(hotkey)
  Meh:bind(hotkey.mod, hotkey.key, hotkey.fn)
end)
