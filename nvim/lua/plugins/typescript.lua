-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  { "jose-elias-alvarez/typescript.nvim", lazy = true },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      setup_handlers = {
        -- add custom handler
        tsserver = function(_, opts) require("typescript").setup { server = opts } end,
      },
    },
  },
}
