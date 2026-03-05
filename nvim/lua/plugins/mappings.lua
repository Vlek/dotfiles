return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- Normal mode
        n = {
          -- second key is the lefthand side of the map
          ["<leader>n"] = { "<cmd>Neotree toggle<cr>" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
        -- Insert mode
        i = {
          ["kj"] = { "<esc>", desc = "Leave i mode." },
        },
      },
    },
  },
}
