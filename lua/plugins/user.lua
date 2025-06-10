-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- Github Copilot
  -- {
  --   "github/copilot.vim",
  -- },

  -- render-markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },

  -- mini-diff
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require "mini.diff"
      diff.setup {
        source = diff.gen_source.none(),
      }
    end,
  },

  -- img-clip
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },

  -- codecompanion
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    opts = {
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = os.getenv "OPENAI_API_KEY",
            },
          })
        end,
        openwebui = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = os.getenv "OPENWEBUI_API_URL",
              api_key = os.getenv "OPENWEBUI_API_KEY",
              chat_url = "/v1/chat/completions",
              models_endpoint = "/v1/models",
            },
            schema = {
              model = {
                default = "qwen2.5-coder:7b",
              },
              temperature = {
                order = 2,
                mapping = "parameters",
                type = "number",
                optional = true,
                default = 0.8,
                desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
                validate = function(n) return n >= 0 and n <= 2, "Must be between 0 and 2" end,
              },
              max_completion_tokens = {
                order = 3,
                mapping = "parameters",
                type = "integer",
                optional = true,
                default = nil,
                desc = "An upper bound for the number of tokens that can be generated for a completion.",
                validate = function(n) return n > 0, "Must be greater than 0" end,
              },
              stop = {
                order = 4,
                mapping = "parameters",
                type = "string",
                optional = true,
                default = nil,
                desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
                validate = function(s) return s:len() > 0, "Cannot be an empty string" end,
              },
              logit_bias = {
                order = 5,
                mapping = "parameters",
                type = "map",
                optional = true,
                default = nil,
                desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
                subtype_key = {
                  type = "integer",
                },
                subtype = {
                  type = "integer",
                  validate = function(n) return n >= -100 and n <= 100, "Must be between -100 and 100" end,
                },
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot",
          opts = {
            completion_provider = "cmp",
          },
        },
        inline = {
          adapter = "copilot",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
        cmd = {
          adapter = "copilot",
        },
      },
      display = {
        action_pallette = {
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
    },
    keys = {
      { "<Leader>a", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Code Companion Chat" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = false,
        },
        enabled = true,
      },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              ai_accept = function()
                if require("copilot.suggestion").is_visible() then require("copilot.suggestion").accept() end
              end,
            },
          },
        },
      },
    },
  },

  -- llm.vim
  -- {
  --   "huggingface/llm.nvim",
  --   opts = {
  --     backend = "openai",
  --     api_token = os.getenv "OPENWEBUI_API_KEY",
  --     url = os.getenv "OPENWEBUI_API_URL",
  --     model = "qwen2.5-coder:7b",
  --     accept_keymap = nil,
  --     dismiss_Keymap = nil,
  --     context_window = 1024,
  --     enable_suggestions_on_startup = true,
  --     enable_suggestions_on_files = "*",
  --     disable_url_path_completion = false,
  --     debounce_ms = 150,
  --     tokens_to_clear = { "<|endoftext|>" },
  --     fim = {
  --       enabled = true,
  --       prefix = "<fim_prefix>",
  --       middle = "<fim_middle>",
  --       suffix = "<fim_suffix>",
  --     },
  --     request_body = {
  --       parameters = {
  --         max_new_tokens = 60,
  --         temperature = 0.2,
  --         top_p = 0.95,
  --       },
  --     },
  --   },
  --   specs = {
  --     {
  --       "AstroNvim/astrocore",
  --       opts = {
  --         options = {
  --           g = {
  --             ai_accept = function()
  --               if require("llm.completion").shown_suggestion ~= nil then require("llm.completion").complete() end
  --             end,
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
}
