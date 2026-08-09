vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    pcall(vim.cmd, "TSEnable highlight")
  end,
})
