" 配置文件导入 "{{{
" ---------------------------------------------------------------------
" 基础使用习惯配置
runtime ./vimrc.vim
" 插件管理
"./lua/plugins.lua
lua require('plugins')
" 按键映射
runtime ./maps.vim
" vim-airline配置启动
" source ~/.config/nvim/after/plugin/airline.rc.vim
" 配置主题
source ~/.config/nvim/colors/gruvbox_material.rc.vim
" derx-icons图标配置
source ~/.config/nvim/after/plugin/defx-icons.rc.vim
" rainbow	
source ~/.config/nvim/after/plugin/rainbow.rc.vim

