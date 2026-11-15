local M = {}

local symbols = {
  alpha = "α",
  beta = "β",
  gamma = "γ",
  delta = "δ",
  epsilon = "ε",
  zeta = "ζ",
  eta = "η",
  theta = "θ",
  lambda = "λ",
  mu = "μ",
  pi = "π",
  sigma = "σ",
  phi = "φ",
  psi = "ψ",
  omega = "ω",

  Alpha = "Α",
  Beta = "Β",
  Gamma = "Γ",
  Delta = "Δ",
  Omega = "Ω",

  infinity = "∞",
  partial = "∂",
  nabla = "∇",
  integral = "∫",
  sum = "∑",
  product = "∏",
  sqrt = "√",
  neq = "≠",
  approx = "≈",
  leq = "≤",
  geq = "≥",
  times = "×",
  divide = "÷",
  forall = "∀",
  exists = "∃",
  ["in"] = "∈",
  notin = "∉",
  subset = "⊂",
  union = "∪",
  intersection = "∩",
  rightarrow = "→",
  leftarrow = "←",
  uparrow = "↑",
  downarrow = "↓",
  degree = "°",
  plusminus = "±",
  therefore = "∴",
  because = "∵",
}

function M.new()
  return setmetatable({}, { __index = M })
end

function M:get_completions(_, callback)
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local before = line:sub(1, col)

  local prefix = before:match("\\([%w]*)$")

  if not prefix then
    return callback({ items = {} })
  end

  local items = {}

  for name, symbol in pairs(symbols) do
    if name:lower():find(prefix:lower(), 1, true) == 1 then
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local start_col = col - #prefix - 1
      table.insert(items, {
        label = name,
        insertText = symbol,
        kind = require("blink.cmp.types").CompletionItemKind.Text,
        detail = symbol,
        documentation = {
          kind = "markdown",
          value = "Unicode character: `" .. symbol .. "`",
        },
	textEdit = {
	  newText = symbol,
	  range = {
	    start = { line = row - 1, character = start_col },
	    ["end"] = { line = row - 1, character = col },
	  },
	},
      })
    end
  end

  callback({ items = items })
end

return M
