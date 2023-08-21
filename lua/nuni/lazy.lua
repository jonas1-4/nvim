require("lazy").setup( {
  -- Core plugins
  { 'zbirenbaum/copilot.lua' },
  { 'jose-elias-alvarez/null-ls.nvim' },

  -- NeoTree related plugins
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },

  -- Other plugins
  { 'MunifTanjim/prettier.nvim' },
  { 'Pocco81/auto-save.nvim' },
  { 'theprimeagen/harpoon' },
  { 'mbbill/undotree' },
  { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'glepnir/lspsaga.nvim' },
  { 'kabouzeid/nvim-lspinstall' },
  { 'windwp/nvim-autopairs' },
  { 'hrsh7th/nvim-compe' },
  { 'andymass/vim-matchup', opts = function() vim.g.matchup_matchparen_offscreen = { method = 'popup' } end },
  { 'Dhanus3133/LeetBuddy.nvim', dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim'} },
  
  -- folke/trouble.nvim config
  {
    'folke/trouble.nvim',
    config = [[require('trouble').setup{}]],
    opts = { use_diagnostic_signs = true },
  },
  
  -- akinsho/flutter-tools.nvim config
  {
    'akinsho/flutter-tools.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = [[require('flutter-tools').setup{}]],
  },

  -- Telescope related plugins
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- add other telescope related dependencies here
    },
    opts = {
      -- Telescope specific configurations
    }
  },
  { 
    'nvim-telescope/telescope-file-browser.nvim', 
    dependencies = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'}
  },

  -- which-key.nvim config
  {
    'folke/which-key.nvim',
    config = [[
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup{}
    ]]
  },

  -- morhetz/gruvbox config
  {
    'morhetz/gruvbox',
    name = 'gruvbox',
    -- config = [[vim.cmd('colorscheme gruvbox')]],
  },

  -- numToStr/Comment.nvim config
  {
    'numToStr/Comment.nvim',
    config = [[require('Comment').setup{}]],
  },

  -- nvim-treesitter config
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        -- add other required languages here
      }
    }
  },
})

