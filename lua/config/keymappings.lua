local keymap = vim.keymap.set
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- Fix moving forward in jumplist via <C-i> and <D-i>
keymap("n", "<C-I>", "<C-I>", silent)
keymap("n", "<D-I>", "<C-I>", silent)

-- Add down/up mapping for Cmd
keymap("n", "<D-d>", "<C-d>", silent)
keymap("n", "<D-u>", "<C-u>", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Jump to beginning with backspace
keymap("n", "<BS>", "^", silent)

-- Save file by CTRL-S/CMD-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("n", "<D-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)
keymap("i", "<D-s>", "<ESC> :w<CR>", silent)

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "<F19>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":lua Snacks.bufdelete()<CR>", silent)
keymap("n", "<D-q>", ":lua Snacks.bufdelete()<CR>", silent)
keymap("n", "<D-w>", ":lua Snacks.bufdelete()<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
-- vim.cmd([[
--   nnoremap <Plug>SpeedDatingFallbackUp <c-a>
--   nnoremap <Plug>SpeedDatingFallbackDown <c-x>
-- ]])

-- Quickfix
keymap("n", "<Leader>,", ":cp<CR>", silent)
keymap("n", "<Leader>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Manually invoke speeddating in case switch.vim didn't work
-- keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
-- keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
--   silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- Adjust font size
keymap("n", "<M-=>", function() require('utils').adjust_font_size(1) end, silent)
keymap("n", "<M-->", function() require('utils').adjust_font_size(-1) end, silent)
-- Comment Box
keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)

keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", silent)
keymap("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", silent)
keymap("n", "<leader>w", "<cmd>:w<CR>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │ VSCode like Alt movement                                 │
-- ╰──────────────────────────────────────────────────────────╯
-- Alt+h - move a word back
keymap("n", "˙", 'b', silent)
keymap("v", "˙", 'b', silent)
keymap("i", "˙", '<esc>bi', silent)
keymap("n", "<A-h>", 'b', silent)
keymap("v", "<A-h", 'b', silent)
keymap("i", "<A-h>", '<esc>bi', silent)

-- Alt+l - move a word forward
keymap("n", "¬", 'w', silent)
keymap("v", "¬", 'w', silent)
keymap("i", "¬", '<esc>wi', silent)
keymap("n", "<A-l>", 'w', silent)
keymap("v", "<A-l>", 'w', silent)
keymap("i", "<A-l>", '<esc>wi', silent)

-- Alt+j - move a line down
keymap("n", "∆", '"xdd"xp', silent)
keymap("n", "<A-j>", '"xdd"xp', silent)
-- Alt+Shift+j - copy a line down
keymap("n", "Ô", '"xyy"xp', silent)
keymap("n", "<A-J>", '"xyy"xp', silent)
-- Alt+k - move a line up
keymap("n", "˚", 'k"xdd"xpk', silent)
keymap("n", "<A-k>", 'k"xdd"xpk', silent)
-- Alt+Shift+k - copy a line up
keymap("n", "", '"xyyk"xp', silent)
keymap("n", "<A-K>", '"xyyk"xp', silent)
