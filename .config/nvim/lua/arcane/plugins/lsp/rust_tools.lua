return {
    "simrat39/rust-tools.nvim",
    config = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                on_attach = function(_,bufnr)
                    vim.keymap.set("n","<C-Space>",rt.hover_actions.hover_actions, { buffer = bufnr,desc="Rust Tools hover actions" })
                    vim.keymap.set("n","<leader>a",rt.code_action_group.code_action_group, { buffer = bufnr ,desc = "Rust Tools Code Actions"})
                end,
            },
        })
    end,
}