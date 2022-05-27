logger = hs.logger.new("init", "verbose")

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
  -- hs.alert.show("Hello World!")
  hs.notify.new({ title = "FFFF", informativeText = "Hello World" }):send()
end)



--- Hyper!!
-- Hyper = hs.loadSpoon('Hyper', false)
Meh = dofile("Spoons/Hyper.spoon/init.lua")
App = hs.application

Meh:bindHotKeys({ hyperKey = { {}, 'F19' } })

Meh:bind({}, 'r', function()
  hs.reload()
end)

Meh:bind({}, 't', function()
  app = App.frontmostApplication()
  if app:name() == 'Finder' then
    local script = [[
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
    ]]
    ok, output, _ = hs.osascript.applescript(script)
    logger.i(ok, output)

    if ok then
      hs.alert.show("Launching Alacritty with " .. output)
      os.execute("open -nF /Applications/Alacritty.app --args --working-directory " .. output)
    end
  else
    hs.alert.show("Launching Alacritty")
    os.execute("open -nF /Applications/Alacritty.app")
  end
end)


function yabai(args)
  hs.task.new("/opt/homebrew/bin/yabai", nil, function(t, ...)
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
  { key = 'i', mod = {}, direction = 'up' },
  { key = 'o', mod = {}, direction = 'right' },
  { key = 'n', mod = { 'option' }, direction = 'left' },
  { key = 'e', mod = { 'option' }, direction = 'down' },
  { key = 'i', mod = { 'option' }, direction = 'up' },
  { key = 'o', mod = { 'option' }, direction = 'right' },
  { key = 'n', mod = { 'cmd' }, direction = 'left' }, -- beginning of line
  { key = 'o', mod = { 'cmd' }, direction = 'right' }, -- end of line
}, function(hotkey)
  Meh:bind(hotkey.mod, hotkey.key,
    function()
      fastKeyStroke(hotkey.mod, hotkey.direction)
    end, nil, function()
    fastKeyStroke(hotkey.mod, hotkey.direction)
  end)
end)



Hyper = dofile("Spoons/Hyper.spoon/init.lua")
Hyper:bindHotKeys({ hyperKey = { {}, 'F18' } })

hs.fnutils.each({
  -- focus movement
  { key = 'n', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "west" }) end },
  { key = 'e', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "south" }) end },
  { key = 'i', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "north" }) end },
  { key = 'o', mod = {}, fn = function() yabai({ "-m", "window", "--focus", "east" }) end },

  -- swap window
  { key = 'n', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--swap", "west" }) end },
  { key = 'e', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--swap", "south" }) end },
  { key = 'i', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--swap", "north" }) end },
  { key = 'o', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--swap", "east" }) end },
  { key = "return", mod = {}, fn = function() yabai({ "-m", "window", "--focus", "mouse" }) end },

  -- rotate window tree
  { key = 'r', mod = {}, fn = function() yabai({ "-m", "space", "--rotate", "90" }) end },

  -- toggle float window
  { key = "space", mod = {}, fn = function() yabai({ "-m", "window", "--toggle", "float" }) end },

  -- toggle fullscreen
  { key = "f", mod = {}, fn = function() yabai({ "-m", "window", "--toggle", "zoom-fullscreen" }) end },

  -- switch to space
  { key = '1', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "1" }) end },
  { key = '2', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "2" }) end },
  { key = '3', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "3" }) end },
  { key = '4', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "4" }) end },
  { key = '5', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "5" }) end },
  { key = '6', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "6" }) end },
  { key = '7', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "7" }) end },
  { key = '8', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "8" }) end },
  { key = '9', mod = {}, fn = function() yabai({ "-m", "space", "--focus", "9" }) end },

  -- move window to space
  { key = '1', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "1" }) end },
  { key = '2', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "2" }) end },
  { key = '3', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "3" }) end },
  { key = '4', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "4" }) end },
  { key = '5', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "5" }) end },
  { key = '6', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "6" }) end },
  { key = '7', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "7" }) end },
  { key = '8', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "8" }) end },
  { key = '9', mod = { "shift" }, fn = function() yabai({ "-m", "window", "--space", "9" }) end },

  -- space creation/deletion
  { key = "return", mod = { "shift" }, fn = function()
    -- create space, move window and follow focus
    local script = [[
      /opt/homebrew/bin/yabai -m space --create && \
      index="$(/opt/homebrew/bin/yabai -m query --spaces --display | /opt/homebrew/bin/jq 'map(select(."is-native-fullscreen" == false))[-1].index')" && \
      /opt/homebrew/bin/yabai -m window --space "${index}" && \
      /opt/homebrew/bin/yabai -m space --focus "${index}"
]]
    hs.task.new("/bin/bash", nil, function(t, ...)
      print("stream", hs.inspect(table.pack(...)))
      return true
    end, { "-l", "-c", script }):start()
  end },
  { key = "return", mod = {}, fn = function()
    -- create space in background
    local script = [[
      /opt/homebrew/bin/yabai -m space --create && \
      /opt/homebrew/bin/spacebar -m config spaces on
]]
    hs.task.new("/bin/bash", nil, function(t, ...)
      print("stream", hs.inspect(table.pack(...)))
      return true
    end, { "-l", "-c", script }):start()
  end },
  { key = "delete", mod = { "shift" }, fn = function()
    -- delete space, if the space is empty
    local script = [[
      cnt=$(/opt/homebrew/bin/yabai -m query --windows --space | /opt/homebrew/bin/jq length) && \
      if [ $cnt -eq 0 ]; then
        /opt/homebrew/bin/yabai -m space --destroy
      fi
]]
    hs.task.new("/bin/bash", nil, function(t, ...)
      print("stream", hs.inspect(table.pack(...)))
      return true
    end, { "-l", "-c", script }):start()
  end },

}, function(hotkey)
  Hyper:bind(hotkey.mod, hotkey.key, hotkey.fn)
end)

-- switch to next/prev space
toNextSpace = hs.hotkey.bind({ "ctrl" }, "right", nil, function()
  hs.task.new("/bin/bash", nil, function(t, ...)
    print("stream", hs.inspect(table.pack(...)))
    return true
  end, { "-l", "-c", "/opt/homebrew/bin/yabai -m space --focus next || /opt/homebrew/bin/yabai -m space --focus first" }):start()
end)

toPrevSpace = hs.hotkey.bind({ "ctrl" }, "left", nil, function()
  hs.task.new("/bin/bash", nil, function(t, ...)
    print("stream", hs.inspect(table.pack(...)))
    return true
  end, { "-l", "-c", "/opt/homebrew/bin/yabai -m space --focus prev || /opt/homebrew/bin/yabai -m space --focus last" }):start()
end)

-- TODO: refactor into spoon
cmdIgnoreApp = {
  { name = 'Finder', keep = true },
  { name = 'Google Chrome' },
  { name = 'Hammerspoon', keep = true },
  { name = 'Telegram' },
  { name = 'Messages' }
}

function cmdHasIgnore(app)
  for _, obj in ipairs(cmdIgnoreApp) do
    if obj.name then
      if app:name() == obj.name then
        return true, obj
      end
    elseif obj.id then
      if app:bundleID() == obj.id then
        return true, obj
      end
    end
  end
  return false, nil
end

cmdQDelay = 0.5

cmdQTimer = nil
cmdQAlert = nil

function cmdQCleanup()
  hs.alert.closeSpecific(cmdQAlert)
  cmdQTimer = nil
  cmdQAlert = nil
end

function stopCmdQ()
  if cmdQTimer then
    cmdQTimer:stop()
    cmdQCleanup()
    hs.alert("Quit Canceled", 0.5)
  end
end

function startCmdQ()
  local app = hs.application.frontmostApplication()
  local ignore, obj = cmdHasIgnore(app)
  if ignore then
    logger.i(ignore, obj)
    if obj.keep then return end
    -- hs.eventtap.event.newKeyEvent({ "cmd" }, "q", false):post(app)
    app:kill()
    -- fastKeyStroke({ "cmd" }, "q")
    return
  end
  cmdQTimer = hs.timer.doAfter(cmdQDelay, function() app:kill(); cmdQCleanup() end)
  cmdQAlert = hs.alert("Hold to Quit " .. app:name(), true)
end

cmdQ = hs.hotkey.bind({ "cmd" }, "q", startCmdQ, stopCmdQ)
