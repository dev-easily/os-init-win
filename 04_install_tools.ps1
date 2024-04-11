############# 硬件发烧 #############
Write-Host "安装cpu-z"
# scoop install cpu-z
Write-Host "安装Aida64"
# scoop install aida64extreme

############# 其它 #############
Write-Host "安装微软出品的超强系统玩具powertoys"
scoop install powertoys

Write-Host "安装漂亮的命令行（需要管理员权限）"
# https://github.com/felixse/FluentTerminal
scoop install fluent-terminal-np
# https://github.com/JanDeDobbeleer/oh-my-posh
scoop install oh-my-posh
New-Item -Path $PROFILE -Type File -Force
Write-Host "oh-my-posh init pwsh --config `"$env:POSH_THEMES_PATH/M365Princess.omp.json`"| Invoke-Expression" > $PROFILE

#scoop install Monocraft-Nerd-Font
scoop install Cascadia-Code
Write-Host "其它主题位置位于 $env:POSH_THEMES_PATH，请查看 $PROFILE 自行修改"
Write-Host "另外，请在PowerShell或者CMD的设置中选择带有Nerd字样的字体。字体需要自行下载安装" 

Write-Host "安装MacOS Like的快速预览软件QuickLook"
scoop install QuickLook

Write-Host "安装除了程序员都需要的快速文件搜索软件Everything"
scoop install everything

Write-Host "安装磁盘空间占用管理工具TreeSize免费版"
#scoop bucket add vi https://gh-proxy.com/https://github.com/ViCrack/scoop-bucket
#scoop install vi/treesize
scoop install treesize-free