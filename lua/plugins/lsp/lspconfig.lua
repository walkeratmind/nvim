local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("blink.cmp").get_lsp_capabilities(require("nvchad.configs.lspconfig").capabilities)

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local ok, _ = pcall(require, "ufo")
      if ok then
        capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }
      end

      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      }

      vim.lsp.config("*", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
          },
        },
      })

      vim.lsp.config("templ", {
        cmd = { "templ", "lsp" },
        filetypes = { "templ" },
      })

      vim.lsp.config("ts_ls", {
        init_options = {
          preferences = {
            disableSuggestions = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      })

      vim.lsp.config("svelte", {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              if client.name == "svelte" then
                client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
              end
            end,
          })
        end,
      })

      vim.lsp.config("emmet_ls", {
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      vim.lsp.config("pyright", {
        settings = {
          pyright = { disableOrganizeImports = true },
          python = { analysis = { ignore = { "*" } } },
        },
      })

      vim.lsp.config("ruff", {
        settings = {
          configurationPreference = "fileSystemFirst",
          enable = true,
          organizeImports = true,
          fixAll = true,
          lint = { enable = true },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
            },
          },
        },
      })

      vim.lsp.config("biome", {
        filetypes = {
          "astro",
          "css",
          "graphql",
          "javascript",
          "javascriptreact",
          "json",
          "jsonc",
          "svelte",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
          "vue",
          "yml",
          "yaml",
        },
      })

      vim.lsp.config("vale_ls", {
        filetypes = { "markdown", "text", "tex", "html" },
      })

      vim.lsp.config("yamlls", {
        flags = { debounce_text_changes = 200 },
        settings = {
          yaml = {
            format = { enable = true, bracketSpacing = true },
            validate = true,
            completion = true,
            schemaStore = { url = "", enable = false },
            schemas = {
              ["https://taskfile.dev/schema.json"] = { "**/Taskfile.yml", "**/Taskfile.yaml" },
              ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml"] = {
                "**/openapi.{yaml,yml}",
              },
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
          },
        },
      })

      vim.lsp.config("sqls", {
        filetypes = { "sql", "mysql" },
      })

      vim.lsp.enable {
        "gopls",
        "templ",
        "ts_ls",
        "htmx",
        "cssls",
        "tailwindcss",
        "svelte",
        "prismals",
        "emmet_ls",
        "pyright",
        "ruff",
        "lua_ls",
        "biome",
        "vale_ls",
        "yamlls",
        "sqls",
        "nushell",
      }
    end,
  },
}
