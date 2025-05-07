-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  { "vimwiki/vimwiki" },
  { "easymotion/vim-easymotion" },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "          *+*#++-==++*                      ",
        "  +**####+%@====+++*==:.+=+*++***%%%##      ",
        " +####@*+%@-+=-*#*##*#:.:-+**##%%@@@@%#%    ",
        " *%%%@+=%@-=-=*++#%#+#-.:=**%%#%%#@@@%##%   ",
        " +%%#++=@-==++%##%##+*::::++*#%#%#*@@%%%%#  ",
        "  *+++==*==++####%%@%%--==*%#@%%%###@%%%%*  ",
        "   ++===:++@%@@+##%%*--:-*+#@%@@@%#*%    *  ",
        "    *+==+:+=%@#+**#=++:::=*%%%@@#%%*     *  ",
        "     +=#--=-++++*#===::::-*%%%%%%###        ",
        "        --=-=+#+=+:::.-::-=+%%%%##*         ",
        "         :=+-=+-+:::+*=-=+===%%#%##         ",
        "         +-:--=+.-+*+#%%%%%+=++%#**=        ",
        "          -=-=-.:=+%@@@@@@%#+==*#+=         ",
        "           :-:...-*#%%@@@@%#+==++*==        ",
        "            :-..:-+#%@@@@%%#*==##==-+#      ",
        "             :..:=*##%@%#%%#*+=====-=#%     ",
        "             .::-+##%@%%%#%#*+===+****#@    ",
        "             ..:===+*****++=+#++*%####%@    ",
        "             .....--==+++++++++@%#%#*#%@@   ",
      }
      return opts
    end,
  },
}
