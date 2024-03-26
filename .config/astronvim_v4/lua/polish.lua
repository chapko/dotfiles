if require("astrocore").is_available "resession.nvim" then
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("resession_load_on_start", { clear = true }),
    callback = function()
      -- Only load the session if nvim was started with no args
      if vim.fn.argc(-1) ~= 0 then return end

      -- wait for other plugins (cloak, color-highlight, etc.) to initialize
      vim.schedule(
        function()
          require("resession").load(vim.fn.getcwd(), {
            dir = "dirsession",
            silence_errors = true,
          })
        end
      )
    end,
  })
end
