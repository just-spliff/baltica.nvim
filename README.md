# 🌊 Baltica.nvim

> A professional, high-contrast Neovim colorscheme inspired by the Baltic Sea depths and raw amber. Designed for fullstack developers who need clarity between backend logic and frontend UI.

![Baltica Screenshot](https://via.placeholder.com/800x400?text=Place+Your+Screenshot+Here)

## ✨ Features

- **Semantic Coloring:** Distinct colors for types (`Cyan`) vs variables (`Blue`) vs strings (`Amber`).
- **Fullstack Focus:** Optimized for TypeScript, React (TSX/JSX), JSON, CSS, and Lua.
- **Eye Care:** Deep abyss background (`#0b1015`) reduces eye strain compared to pure black, while maintaining high contrast.
- **Customizable:** Toggle transparency, italics, and bold styles easily.
- **Plugins:** Built-in support for Treesitter, Gitsigns, Telescope, Lualine, and more.

## ⚡ Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "just-spliff/baltica.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("baltica").setup({
      transparent_background = false,
      italics = {
        comments = true,
        keywords = true,
      }
    })
    vim.cmd.colorscheme("baltica")
  end,
}
```
