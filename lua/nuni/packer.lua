return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { "zbirenbaum/copilot.lua" }

	use('jose-elias-alvarez/null-ls.nvim')


	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}

	use('MunifTanjim/prettier.nvim')

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" }
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use {
		'morhetz/gruvbox',
		as = 'gruvbox',
		config = function()
			vim.cmd('colorscheme gruvbox')
		end
	}

	use 'Pocco81/auto-save.nvim'

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use 'theprimeagen/harpoon'

	use 'mbbill/undotree'

	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }


	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use 'kabouzeid/nvim-lspinstall'
	-- Autocompletion
	use 'hrsh7th/nvim-compe'
	-- Syntax highlighting
	use 'nvim-treesitter/nvim-treesitter'
	-- Other utilities
	use 'windwp/nvim-autopairs'

	use {
		'andymass/vim-matchup',
		setup = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	}

	use {
		"Dhanus3133/LeetBuddy.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		-- keys = {
		-- 	{ "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
		-- 	{ "<leader>ll", "<cmd>LBQuestion<cr>",  desc = "View Question" },
		-- 	{ "<leader>lr", "<cmd>LBReset<cr>",     desc = "Reset Code" },
		-- 	{ "<leader>lt", "<cmd>LBTest<cr>",      desc = "Run Code" },
		-- 	{ "<leader>ls", "<cmd>LBSubmit<cr>",    desc = "Submit Code" },
		-- }
	}

	-- Lua
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use {
		"akinsho/flutter-tools.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require('flutter-tools').setup {}
		end,
	}
end)
