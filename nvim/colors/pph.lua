vim.cmd([[highlight clear]])

if vim.g.syntax_on then
  vim.cmd([[syntax reset]])
end

vim.g.colors_name = "bliss"
vim.o.background = "dark"

local ui_white 	 			= "#D3CEBA"
local ui_white_dimmed	= "#BBBBBB"
local ui_black 	 			= "#151317"
local ui_gray 		 		= "#525252"
local ui_yellow 	 		= "#FFAF00"

local syntax_pink			= "#F8BFCE"
local syntax_yellow 	= "#DCDAA3"
local syntax_blue 		= "#AED7F5"
local syntax_gray			= "#525252"

local red 		 		= "#F56868"
local green 	 		= "#C4D9B0"
local blue 		 		= "#394b70"
local orange 	 		= "#CC873F"
local purple 			= "#CCCCF8"

local dark_purple = "#37222C"
local dark_green	= "#223724"

local highlight_groups = {
	-- ui
  Directory 		= 	{ fg = ui_white_dimmed, bg = "NONE" },
  IncSearch 		= 	{ fg = ui_black, bg = ui_yellow },
  Search 				= 	{ fg = ui_black, bg = ui_yellow },
  Visual 				= 	{ fg = ui_black, bg = ui_yellow },
  NormalFloat 	= 	{ fg = ui_white, bg = ui_black },
  Pmenu 				= 	{ fg = ui_white, bg = ui_black },
  WinSeparator 	= 	{ fg = ui_black, bg = ui_black },
  Normal 				= 	{ fg = ui_white, bg = ui_black },
  NonText 			= 	{ fg = ui_white, bg = ui_black },
  CursorLineNr	= 	{ fg = ui_white, bg = ui_black },
  StatusLine 		= 	{ fg = ui_white, bg = ui_black },
  WinBar 				= 	{ fg = ui_white, bg = ui_black },
  LineNr 				= 	{ fg = ui_gray, bg = "NONE" },
  WinBarNC 			= 	{ fg = ui_gray, bg = ui_black },
  MatchParen 		= 	{ fg = ui_white, bg = ui_gray },
  EndOfBuffer 	= 	{ fg = "bg", bg = "bg" },

	NeoTreeGitUntracked = { fg = orange, italic = false },
	NeoTreeFileName = { fg = ui_white_dimmed },
	NeoTreeGitConflict = { fg = purple },

	-- diagnostics
  DiagnosticError 					= { fg = red },
	DiagnosticInfo						= { fg = blue },
  DiagnosticWarn						= { fg = orange },
  DiagnosticUnderlineError	= { fg = ui_white, underline = true, sp = red },
	DiagnosticUnderlineInfo		= { fg = ui_white, underline = true, sp = blue },
	DiagnosticUnderlineWarn		= { fg = ui_white, underline = true, sp = orange },

	-- basic syntax
  Comment 			= 	{ fg = syntax_gray, bg = "NONE" },
  Constant 			= 	{ fg = ui_white, bg = "NONE" },
  Function 			= 	{ fg = ui_white, bg = "NONE" },
  Identifier 		= 	{ fg = ui_white, bg = "NONE" },
  PreProc 			= 	{ fg = ui_white, bg = "NONE" },
  Statement 		= 	{ fg = ui_white, bg = "NONE" },
  Special 			= 	{ fg = ui_white, bg = "NONE" },
  String 				= 	{ fg = ui_white, bg = "NONE" },
  Operator 			= 	{ fg = ui_white, bg = "NONE" },
  Type 					= 	{ fg = ui_white, bg = "NONE" },
  ErrorMsg 			= 	{ fg = red, bg = "NONE" },
  Error 				= 	{ fg = red, bg = "NONE" },
  WarningMsg 		= 	{ fg = orange, bg = "NONE" },

  ["@variable"]	= 	{ fg = ui_white, bg = "NONE" },
  ["@error"] 		= 	{ fg = red, sp = dark_orange, undercurl = true },
  ["@spell"] 		= 	{ fg = syntax_gray, bg = "NONE" },

	-- lsp
	["@lsp.typemod.method.definition.go"] 		= 	{ fg = syntax_blue, bg = "NONE" },
  ["@lsp.typemod.function.definition.go"] 	= 	{ fg = syntax_blue, bg = "NONE" },
	["@lsp.typemod.method.definition.zig"] 		= 	{ fg = syntax_blue, bg = "NONE" },
  ["@lsp.typemod.function.definition.zig"] 	= 	{ fg = syntax_blue, bg = "NONE" },

  ["@lsp.typemod.variable.readonly.go"] 		= 	{ fg = syntax_pink, bg = "NONE" },
  ["@lsp.typemod.variable.readonly.zig"] 		= 	{ fg = syntax_pink, bg = "NONE" },

  ["@lsp.typemod.variable.definition.go"] 	= 	{ fg = syntax_yellow, bg = "NONE" },
  ["@lsp.typemod.variable.definition.zig"] 	= 	{ fg = syntax_yellow, bg = "NONE" },
  LspInlayHint 	= 	{ fg = syntax_gray, bg = "NONE" },

	-- git
  DiffText	 		=		{ fg = blue },
  DiffAdd 			=		{ bg = dark_green },
  DiffDelete 		=		{ fg = ui_white, bg = dark_purple },
  Added 				= 	{ fg = green, bg = "NONE" },
  Changed 			= 	{ fg = orange, bg = "NONE", italic = false},
  Removed 			= 	{ fg = red, bg = "NONE" },
	diffOldFile		= 	{ fg = syntax_gray, bg = "NONE" },
	diffNewFile		=		{ fg = syntax_gray, bg = "NONE" },
}

for group, opts in pairs(highlight_groups) do
  vim.api.nvim_set_hl(0, group, opts)
end
