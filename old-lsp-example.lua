-- Config for LSP Setup
-- LazyVim Docs for LSP https://www.lazyvim.org/plugins/lsp

-- Trying to disable this temporarily, and see if latest lazy can just do it all for me instead
-- There was a lot of customization here around vue/eslint... but it seems to maybe handle
-- that out of the box now.

if true then
  return {}
end

return {

  -- setup lspconfig to support our LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      -- set to false, to prevent vetur formatting?
      autoformat = false,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        jsonls = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },

        -- "vue-language-server" is called "volar" still
        volar = {
          settings = {
            volar = {
              filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
            },
          },
        },

        -- commented out to prevent duplicate formatting issues with volar
        -- eslint, to match linting rules for nuxt3
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              -- commenting this out, so I can disable volar autoformat, but still eslint fix
              -- if not require("lazyvim.plugins.lsp.format").enabled() then
              --   -- exit early if autoformat is not enabled
              --   return
              -- end

              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end,
          })
        end,
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- use Mason to ensure our LSP are installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "vue-language-server",
      },
    },
  },
}
