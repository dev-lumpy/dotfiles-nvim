vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    pcall(vim.cmd, "TSEnable highlight")
  end,
})

-- Separador sutil en la barra superior de la terminal (winbar)
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})
