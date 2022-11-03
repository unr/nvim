-- Configure LSP Servers, via lsp-config / mason
-- https://github.com/junnplus/lsp-setup.nvim#setup-structure
require('lsp-setup').setup({
	-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
	servers = {
		cssls = {},
		eslint = {},
		html = {},
		tsserver = {},
		marksman = {},
		sumneko_lua = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "require", "ipairs" },
					},
				},
			},
		},
		tailwindcss = {},
		vuels = {
			config = {
				css = {},
				emmet = {},
				html = {
					suggest = {}
				},
				javascript = {
					format = {}
				},
				stylusSupremacy = {},
				typescript = {
					format = {}
				},
				vetur = {
					completion = {
						autoImport = false,
						tagCasing = "camel",
						useScaffoldSnippets = true
					},
					format = {
						defaultFormatter = {
							js = "prettier",
							ts = "none"
						},
						defaultFormatterOptions = {},
						scriptInitialIndent = false,
						styleInitialIndent = false
					},
					useWorkspaceDependencies = false,
					validation = {
						script = true,
						style = true,
						template = true
					}
				}
			}
		},
		-- volar = {}, -- RUN WITH VUE3 IN FUTURE
		taplo = {},
		yamlls = {},
	}
})
