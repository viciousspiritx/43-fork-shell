-- Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0.15,
})

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
    name = "nautilus-real-blur",
    match = { class = "^(org\\.gnome\\.Nautilus)$" },
    opacity = "0.85 override 0.75 override",
    opaque = false,
    xray = true,
})

