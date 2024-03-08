{ config, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      base16-nvim
      vim-smoothie
      vim-prettier
      neoformat
    ];

    plugins = {
      lualine.enable = true;
      neo-tree.enable = true;
      bufferline.enable = true;
      notify.enable = true;
      noice.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      nvim-lightbulb.enable = true;
      rainbow-delimiters.enable = true;
      lspkind.enable = true;
      ts-autotag.enable = true;

      gitsigns.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>l" = "live_grep";
        };
      };

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          tsserver.enable = true;
          html.enable = true;
          cssls.enable = true;
          cmake.enable = true;
          csharp-ls.enable = true;
          jsonls.enable = true;
          pyright.enable = true;
          eslint.enable = true;
        };
      };

      dashboard = {
        enable = true;
        header = [ "Nixvim 🩵" ];
        footer = [ "To these types, complex software is the ideal." ];
        hideTabline = true;
        hideStatusline = true;
      };

      treesitter = {
        enable = true;
        ensureInstalled = [
          "nix"
          "vim"
          "regex"
          "lua"
          "bash"
          "markdown"
          "markdown_inline"
          "c"
          "vimdoc"
          "python"
          "c-sharp"
        ];
        indent = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix
          vim
          regex
          lua
          bash
          markdown
          markdown_inline
          c
          vimdoc
          python
          c-sharp
        ];
        nixGrammars = true;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
      };
    };

    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      terminalColors = true;
      transparentBackground = true;
    };

    clipboard.providers.wl-copy.enable = true;

    options = rec {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2; # Tab width should be 2
      clipboard = "unnamedplus"; # Sync with OS clipboard
      softtabstop = shiftwidth;
      expandtab = true;
      smartindent = true;
      swapfile = false;
      backup = swapfile;
      scrolloff = 10;
      cursorline = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>p";
        action = "<cmd>Neoformat<CR>";
      }
      {
        mode = "n";
        key = "<space>fb";
        action = ":Telescope file_browser<CR>";
        options.noremap = true;
      }
      {
        key = "<Tab>";
        action = ":bnext<CR>";
        options.silent = true;
      }
      {
        key = "<S-Tab>";
        action = ":bprev<CR>";
        options.silent = false;
      }
    ];

    globals.mapleader = " "; # Sets the leader key to space.

    extraConfigVim = # vim
      ''
        colorscheme base16-catppuccin-mocha
        let s:guifont = "JetBrainsMono\\ Nerd\\ Font"
        cmap w!! w !sudo tee > /dev/null %
        inoremap jk <ESC>

        let g:prettier#config#print_width = 2      
        let g:prettier#config#tab_width = 2
        let g:prettier#config#use_tabs = "true"

        augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat
        augroup END
      '';

    extraConfigLua = # lua
      ''
        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

        vim.keymap.set({ "n", "i", "v" }, "<A-l>", vim.cmd.bnext, { desc = "Switch to next Buffer" })
        vim.keymap.set({ "n", "i", "v" }, "<A-h>", vim.cmd.bprev, { desc = "Switch to prev Buffer" })
        vim.keymap.set("n", "<C-q>", function() vim.cmd("bw"); end, { desc = "Close Buffer" })

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, { desc = "Code action" })

        vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "gl", vim.diagnostic.setloclist, { desc = "Diagnostics on loclist" })
        vim.keymap.set("n", "gq", vim.diagnostic.setqflist, { desc = "Diagnostics on quickfix" })

        local cmp = require'cmp'

        cmp.setup({
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
              -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
          }, {
            { name = 'buffer' },
          })
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
          }, {
            { name = 'buffer' },
          })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })

        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
        require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
          capabilities = capabilities
        }
      '';
  };
}
