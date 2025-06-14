-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Community Language Packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.prisma" },

  -- Recipes
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.ai" },

  -- Color Schemes
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },

  -- import/override with your plugins folder
}
