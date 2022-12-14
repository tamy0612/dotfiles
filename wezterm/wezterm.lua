local wezterm = require 'wezterm'
local config = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = {'wsl.exe', '--exec', '/bin/zsh', '-l'}
    config.default_cwd = '/home/tamy'
end

config.color_scheme = 'AyuMirage (Gogh)'

config.font = wezterm.font_with_fallback {
    "Cica",
    "Ricty Diminished"
}

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
