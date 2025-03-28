## redis
#scoop install redis
# redis-server.exe
## end redis

## mysql 8
#scoop install mysql-lts
# mysqld --console
## end mysql 8

## 硬件检测
# ./install_cmd.ps1 cpu-z
# ./install_cmd.ps1 aida64extreme

./install_cmd.ps1 powertoys

#Write-Host "安装漂亮的命令行（需要管理员权限）"
#winget install --id Microsoft.Powershell --source winget

# https://github.com/JanDeDobbeleer/oh-my-posh
./install_cmd.ps1 oh-my-posh
New-Item -Path $PROFILE -Type File -Force
$root_path=scoop config root_path
$POSH_THEMES_PATH=$root_path + "\apps\oh-my-posh\themes"
"oh-my-posh init pwsh --config `"$POSH_THEMES_PATH/agnoster.omp.json`"| Invoke-Expression" > $PROFILE

#scoop install Monocraft-Nerd-Font
./install_cmd.ps1 Cascadia-Code
Write-Host "其它主题位置位于 $env:POSH_THEMES_PATH，请查看 $PROFILE 自行修改"
Write-Host "另外，请在PowerShell或者CMD的设置中选择带有Nerd字样的字体。字体需要自行下载安装" 

./install_cmd.ps1 QuickLook
#./install_cmd.ps1 everything
./install_cmd.ps1 openark
./install_cmd.ps1 carnac
./install_cmd.ps1 switchhosts
./install_cmd.ps1 rufus
./install_cmd.ps1 translucenttb
./install_cmd.ps1 notepadplusplus
./install_cmd.ps1 shellmenuview

# neovim
# add this to PATH: C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\Llvm\x64\bin
scoop install ripgrep universal-ctags JetBrainsMono-NF-Mono vcredist2022
npm i -g vim-language-server bash-language-server 
pip install -U pynvim 'python-lsp-server[all]' pylsp-mypy python-lsp-isort 
git clone git@github.com:travisbikkle/nvim-config.git $env:LOCALAPPDATA/nvim/
# 添加右键菜单
reg import ".\neovide.reg"
