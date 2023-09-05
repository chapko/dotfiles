local function get_selection_range(virt)
  local getcol = virt and vim.fn.virtcol or vim.fn.col

  local start_line = vim.fn.line "v"
  local start_col = getcol "v"
  local end_line = vim.fn.line "."
  local end_col = getcol "."

  if start_line > end_line or (start_line == end_line and start_col > end_col) then
    start_line, end_line = end_line, start_line
    start_col, end_col = end_col, start_col
  end
  return start_line, start_col, end_line, end_col
end

local selection_info = {
  condition = function()
    local mode = vim.api.nvim_get_mode().mode
    return mode == "v" or mode == "V" or mode == ""
  end,
  provider = function()
    local mode = vim.api.nvim_get_mode().mode
    local icon = "󰘎 "

    if mode == "" then
      local start_line, start_col, end_line, end_col = get_selection_range(true)
      local w = math.abs(end_col - start_col + 1)
      local h = math.abs(end_line - start_line + 1)
      return icon .. w .. "×" .. h
    end

    local start_line, start_col, end_line, end_col = get_selection_range()

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    if mode == "V" then
      start_col = 0
      end_col = lines[#lines]:len()
    end

    local chars_count = 0
    local lines_count = #lines

    if lines_count == 1 then
      chars_count = chars_count + end_col - start_col + 1
    else
      -- newline characters
      chars_count = lines_count - 1
      for i, line in ipairs(lines) do
        if i == 1 then
          chars_count = chars_count + line:len() - start_col + 1
        elseif i == lines_count then
          chars_count = chars_count + end_col
        else
          chars_count = chars_count + line:len()
        end
      end
    end
    return icon .. lines_count .. " (" .. chars_count .. ")"
  end,
  update = { "ModeChanged", "CursorMoved" },
}

return {
  {
    "rebelot/heirline.nvim",
    init = function() end,
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.opts.disable_winbar_cb = function(args)
        local bufopts = vim.bo[args.buf or 0]
        return bufopts.buftype == "terminal" or bufopts.buftype == "quickfix"
        -- vim.print {
        --   ft = vim.bo[args.buf or 0].filetype,
        --   bt = vim.bo[args.buf or 0].buftype,
        --   buflisted = vim.bo[args.buf or 0].buflisted,
        --   valid = require("astronvim.utils.buffer").is_valid(args.buf),
        -- }
        -- return not require("astronvim.utils.buffer").is_valid(args.buf)
        --   or status.condition.buffer_matches({
        --     buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
        --     filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
        --   }, args.buf)
      end

      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.git_diff(),
        status.component.file_info {
          filetype = false,
          -- display full file path in statusline
          filename = {
            modify = ":p:.",
          },
        },
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        selection_info,
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav { scrollbar = false },
        status.component.mode { surround = { separator = "right" } },
      }

      opts.winbar = {
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false,
        {
          status.component.separated_path(),
          status.component.file_info {
            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
      }

      opts.winbar[1].condition = nil

      return opts
    end,
  },
}
