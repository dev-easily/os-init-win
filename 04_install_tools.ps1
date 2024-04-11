############# 硬件发烧 #############
"安装cpu-z"
# scoop install cpu-z

############# 游戏 #############

 "安装steam 不是最新"
# scoop install steam
 "安装epic 不是最新"
# scoop install epic-games-launcher

############# 其它 #############

"安装漂亮的命令行（需要管理员权限）"
# https://github.com/felixse/FluentTerminal
scoop install fluent-terminal-np
# https://github.com/JanDeDobbeleer/oh-my-posh
scoop install oh-my-posh
New-Item -Path $PROFILE -Type File -Force
# 默认主题
# "oh-my-posh init pwsh | Invoke-Expression" > $PROFILE
"oh-my-posh init pwsh --config `"$env:POSH_THEMES_PATH/M365Princess.omp.json`"| Invoke-Expression" > $PROFILE
"其它主题位置位于 $env:POSH_THEMES_PATH"
# scoop install Monocraft-Nerd-Font
"请在PowerShell或者CMD的设置中选择带有Nerd字样的字体" 
