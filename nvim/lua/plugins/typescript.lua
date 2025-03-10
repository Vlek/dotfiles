return {
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  {
    "AstroNvim/astrolsp",
    ---@type AtrLSPOpts
    opts = {
      setup_handlers = {
        -- add custom handler
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
        end,
      },
    },
  },
}
