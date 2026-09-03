return {
    {

        'seblyng/roslyn.nvim',

        ft = 'cs',

        dependencies = {
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:mason-org/mason-registry', 'github:Crashdummyy/mason-registry', 
                    },
                },
            },
        },

        config = function()
            require('roslyn').setup {
                args = {
                            '--logLevel=Information',

                            '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_filename()),
                            '--stdio',
                },

    config = {

    settings = {

    ['csharp|background_analysis'] = {

    dotnet_compiler_diagnostics_scope = 'fullSolution',

    },

    },

    },

    }

    end,

    },

} 
