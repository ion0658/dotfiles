return {
    {
        "onsails/lspkind.nvim",
        version = "*",
        lazy = true,
    },
    {
        'saghen/blink.compat',
        -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
        version = '*',
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
    },
    {
        'saghen/blink.cmp',
        -- use a release tag to download pre-built binaries
        version = "*",
        lazy = true,
        event = "InsertEnter",

        -- optional: provides snippets for the snippet source
        dependencies = {
            { 'rafamadriz/friendly-snippets', lazy = true },
            { 'saghen/blink.compat',          lazy = true }
        },

        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-e: Hide menu
            -- C-k: Toggle signature help
            --
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = {
                preset = 'default',
                ["<C-space>"] = {},
                ["<C-o>"] = { "show", "show_documentation", "hide_documentation" },
                ["<TAB>"] = { "accept", "fallback" }
            },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink.compat.source",
                        score_offset = 100,
                        async = true,
                    },
                    path = {
                        score_offset = 70,
                    },
                    lsp = {
                        score_offset = 90,
                    },
                    snippets = {
                        score_offset = 80,
                    },
                    buffer = {
                        score_offset = 60,
                    }
                }
            },

            -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust" },
            completion = {
                trigger = {
                    show_on_trigger_character = true,
                    show_on_insert_on_trigger_character = true,
                },
                list = { selection = { preselect = true, auto_insert = false } },
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 }, { "kind_icon", "kind" }
                        },
                        treesitter = { "lsp" },
                    },
                    auto_show = true,
                },
                ghost_text = { enabled = true },
            },
            cmdline = { enabled = true },
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" }
    },
}
