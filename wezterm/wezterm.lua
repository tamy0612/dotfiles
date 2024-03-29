local wezterm = require 'wezterm'
local config = {}
local hostname = wezterm.hostname()

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {'wsl.exe', '--exec', '/bin/zsh', '-l'}
    config.default_cwd = '/home/tamy'
end

config.color_scheme = 'AyuMirage (Gogh)'
config.colors = {
    cursor_bg = '#888888',
    cursor_fg = '#222222',
}

config.font = wezterm.font_with_fallback {
    "Cica",
    "Ricty Diminished"
}
if hostname == 'Sabrina.local' then
    config.font_size = 14
else
    config.font_size = 12
end

config.leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    }
}

return config
