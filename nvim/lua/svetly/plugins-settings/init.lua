if vim.g.vscode then
    require "svetly.plugins-settings.leap"
else
    require "svetly.plugins-settings.feline"
    require "svetly.plugins-settings.treesitter"
end
