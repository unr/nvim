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
		volar = {
			-- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
			filetypes = { 'vue' },
			documentFeatures = {
				documentColor = false,
				documentFormatting = {
					defaultPrintWidth = 120
				},
				documentSymbol = true,
				foldingRange = true,
				linkedEditingRange = true,
				selectionRange = true
			},
			languageFeatures = {
				callHierarchy = true,
				codeAction = true,
				codeLens = true,
				completion = {
					defaultAttrNameCase = "camelCase",
					defaultTagNameCase = "both"
				},
				definition = true,
				diagnostics = true,
				documentHighlight = true,
				documentLink = true,
				hover = true,
				implementation = true,
				references = true,
				rename = true,
				renameFileRefactoring = true,
				schemaRequestService = true,
				semanticTokens = false,
				signatureHelp = true,
				typeDefinition = true
			},
		},
		taplo = {},
		yamlls = {},
	}
})
