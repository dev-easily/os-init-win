Write-Host "安装VLC"
scoop install vlc

Write-Host "安装视频压缩软件Handbrake"
scoop install handbrake
# scoop install handbrake-cli

#Write-Host "安装音频转文字软件Buzz（需要自制bucket）"
scoop bucket add travisb https://gh-proxy.com/https://github.com/travisbikkle/scoop-collections
scoop install travisb/buzz

Write-Host "安装录屏转动图软件 ScreenToGif"
scoop install screentogif
 
Write-Host "安装mp3tag"
scoop install mp3tag

Write-Host "安装potplayer"
scoop search potplayer