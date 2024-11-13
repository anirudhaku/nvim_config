require("nvchad.options")

local o = vim.o

-- tab settings
o.backspace = "indent,eol,start"
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

-- highlight 81st and 97th column for coding convention
o.colorcolumn = "81,97"

-- Get rid of that pesky little thing!
o.mouse = ""

o.guicursor = "n-v-c-i:block"
