-- ## Set window
hs.hotkey.bind({}, "F15", function()
    local window = hs.window.focusedWindow()
    local bundleId = currentBundleID()
    if bundleId == "com.apple.QuickTimePlayerX" then
        window:setFrame(hs.geometry.rect(1082.0,109.0,502.0,890.0), 0)
    elseif bundleId == "net.arena.Guild-Wars-2" then
        window:setFrame(hs.geometry.rect(277.0,100.0,1366.0,790.0), 0)
    end
end)

-- ## Normal Home/End keys behavior
currentBundleID = function()
    return hs.application.frontmostApplication():bundleID() 
end

shouldReplace = function()
    return currentBundleID() ~= "com.googlecode.iterm2" 
end

hs.hotkey.bind({}, "F19", function()
    if shouldReplace() then
        hs.eventtap.keyStroke({"ctrl"}, "a")
    else
        hs.eventtap.event.newKeyEvent({}, "home", true):post()
        hs.eventtap.event.newKeyEvent({}, "home", false):post()
    end
end)

hs.hotkey.bind({"shift"}, "F19", function()
    if shouldReplace() then
        hs.eventtap.keyStroke({"ctrl", "shift"}, "a")
    else
        hs.eventtap.event.newKeyEvent({"shift"}, "home", true):post()
        hs.eventtap.event.newKeyEvent({"shift"}, "home", false):post()
    end
end)

hs.hotkey.bind({}, "F20", function()
    if shouldReplace() then
        hs.eventtap.keyStroke({"ctrl"}, "e")
    else
        hs.eventtap.event.newKeyEvent({}, "end", true):post()
        hs.eventtap.event.newKeyEvent({}, "end", false):post()
    end
end)

hs.hotkey.bind({"shift"}, "F20", function()
    if shouldReplace() then
        hs.eventtap.keyStroke({"ctrl", "shift"}, "e")
    else
        hs.eventtap.event.newKeyEvent({"shift"}, "end", true):post()
        hs.eventtap.event.newKeyEvent({"shift"}, "end", false):post()
    end
end)

-- ## Ctrl-Shift-Backspace to lock screen
hs.hotkey.bind({"ctrl", "shift"}, "delete", function()
    os.execute("pmset displaysleepnow")
end)

-- ## Window Tiling
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "s", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w
    windowFrame.h = screenFrame.h
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "w", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w
    windowFrame.h = screenFrame.h / 2
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "x", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y + (screenFrame.h / 2)
    windowFrame.w = screenFrame.w
    windowFrame.h = screenFrame.h / 2
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "a", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w / 2
    windowFrame.h = screenFrame.h
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "d", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x + (screenFrame.w / 2)
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w / 2
    windowFrame.h = screenFrame.h
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "q", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w / 2
    windowFrame.h = screenFrame.h / 2
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "e", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x + (screenFrame.w / 2)
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w / 2
    windowFrame.h = screenFrame.h / 2
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "z", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y + (screenFrame.h / 2)
    windowFrame.w = screenFrame.w / 2
    windowFrame.h = screenFrame.h / 2
    window:setFrame(windowFrame, 0)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "c", function()
    local window = hs.window.focusedWindow()
    local screenFrame = window:screen():frame()
    local windowFrame = window:frame()
    windowFrame.x = screenFrame.x + (screenFrame.w / 2)
    windowFrame.y = screenFrame.y + (screenFrame.h / 2)
    windowFrame.w = screenFrame.w / 2
    windowFrame.h = screenFrame.h / 2
    window:setFrame(windowFrame, 0)
end)

