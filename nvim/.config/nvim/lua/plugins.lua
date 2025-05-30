local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim", install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Colorschemes
    --use "shaunsingh/nord.nvim"
    use({
        "neanias/everforest-nvim",
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup()
        end,
    })

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "mason-org/mason.nvim" -- simple to use language server installer
    use "mason-org/mason-lspconfig.nvim" -- simple to use language server installer

    use 'simrat39/rust-tools.nvim'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/vim-vsnip'
    use "hrsh7th/cmp-cmdline" -- cmdline completions

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'nvim-tree/nvim-web-devicons'

    -- lualine (bottom line)
    use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true} }

    -- nvim-tree
    use {'kyazdani42/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'}

    -- Bufferline
    use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
    use 'moll/vim-bbye'

    -- VimWiki
    use { 'vimwiki/vimwiki', branch='dev'}

    -- Dashboard
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- Telescope
    use "nvim-lua/plenary.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- dicord fuckery
    use 'andweeb/presence.nvim'

    -- floaterm
    use 'voldikss/vim-floaterm'

    -- git gud
    use 'lewis6991/gitsigns.nvim'

    -- LaTeX
    use 'lervag/vimtex'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
