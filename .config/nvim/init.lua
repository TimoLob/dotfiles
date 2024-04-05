-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(_)
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(0, true)
    end
  end,
})
