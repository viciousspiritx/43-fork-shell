-- Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/

local blur_layers = {
    "quickshell",
    "bar-settings",
    "powermenu",
    "todo",
    "notifications",
    "wheel",
    "mediaosd",
    "mediaosd-settings",
    "settings",
    "rofi",
}

for _, ns in ipairs(blur_layers) do
    hl.layer_rule({
        name = "blur-" .. ns,
        match = { namespace = ns },
        blur = true,
        blur_popups = true,
        ignore_alpha = 0.2,
    })
end

-- Przywrócona globalna reguła krycia z override dla wszystkich okien
hl.window_rule({
    match = { class = ".*" },
    opacity = "0.7 override",
})

-- Pełne krycie dla okien w trybie fullscreen
hl.window_rule({
    match = { class = ".*", fullscreen = true },
    opacity = "1.0 1.0 override",
})

hl.window_rule({
    match = { class = "kitty" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "float-pavucontrol",
    match = { class = "^(pavucontrol)$" },
    float = true,
})

hl.window_rule({
    name = "float-nm-connection-editor",
    match = { class = "^(nm-connection-editor)$" },
    float = true,
})

hl.window_rule({
    name = "float-blueman-manager",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name = "float-open-file",
    match = { title = "^(Open File)$" },
    float = true,
})

hl.window_rule({
    name = "float-save-file",
    match = { title = "^(Save File)$" },
    float = true,
})

hl.window_rule({
    name = "file-managers-blur",
    match = { class = "^(org\\.gnome\\.Nautilus|nautilus|thunar)$" },
    opacity = "0.85 0.75 override",
    opaque = false,
})
