local m = hs.hotkey.modal.new({}, nil)

function m:setMods(mods)
  m.mods = mods
end

--- Hyper:bindHotKeys(table) -> hs.hotkey.modal
--- Method
--- Expects a config table in the form of {"hyperKey" = {mods, key}}.
---
--- Returns:
---  * self
function m:bindHotKeys(mapping)
  local mods, key = table.unpack(mapping["hyperKey"])
  hs.hotkey.bind(mods, key, function() m:enter() end, function() m:exit() end)

  return self
end

--- Hyper:bindPassThrough(key, bundleId) -> hs.hotkey.modal
--- Method
--- Ensures the bundleId's application is running, then sends the "hyper-chord"
--- (⌘+⌥+⌃+⇧) plus whatever you set as `key`.
---
--- Returns:
---  * self
function m:bindPassThrough(key, app)
  m:bind({}, key, nil, function()
    if hs.application.get(app) then
      hs.eventtap.keyStroke({ 'cmd', 'alt', 'shift', 'ctrl' }, key)
    else
      hs.application.launchOrFocusByBundleID(app)
      hs.timer.waitWhile(
        function()
          return not hs.application.get(app):isFrontmost()
        end,
        function()
        hs.eventtap.keyStroke({ 'cmd', 'alt', 'shift', 'ctrl' }, key)
      end
      )
    end
  end)

  return self
end

return m
