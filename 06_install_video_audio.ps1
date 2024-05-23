Write-Host "安装VLC"
./install_cmd.ps1 vlc

Write-Host "安装视频压缩软件Handbrake"
./install_cmd.ps1 handbrake
# scoop install handbrake-cli

#Write-Host "安装音频转文字软件Buzz（需要自制bucket）"
scoop bucket add travisb https://gh-proxy.com/https://github.com/travisbikkle/scoop-collections
./install_cmd.ps1 screentogif travisb/buzz

Write-Host "安装录屏转动图软件 ScreenToGif"
./install_cmd.ps1 screentogif
 
Write-Host "安装mp3tag"
./install_cmd.ps1 mp3tag

Write-Host "安装potplayer"
./install_cmd.ps1 potplayer