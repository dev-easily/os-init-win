############# Ӳ������ #############
Write-Host "��װcpu-z"
# scoop install cpu-z
Write-Host "��װAida64"
# scoop install aida64extreme

############# ���� #############
Write-Host "��װ΢���Ʒ�ĳ�ǿϵͳ���powertoys"
scoop install powertoys

Write-Host "��װƯ���������У���Ҫ����ԱȨ�ޣ�"
# https://github.com/felixse/FluentTerminal
scoop install fluent-terminal-np
# https://github.com/JanDeDobbeleer/oh-my-posh
scoop install oh-my-posh
New-Item -Path $PROFILE -Type File -Force
Write-Host "oh-my-posh init pwsh --config `"$env:POSH_THEMES_PATH/M365Princess.omp.json`"| Invoke-Expression" > $PROFILE

#scoop install Monocraft-Nerd-Font
scoop install Cascadia-Code
Write-Host "��������λ��λ�� $env:POSH_THEMES_PATH����鿴 $PROFILE �����޸�"
Write-Host "���⣬����PowerShell����CMD��������ѡ�����Nerd���������塣������Ҫ�������ذ�װ" 

Write-Host "��װMacOS Like�Ŀ���Ԥ�����QuickLook"
scoop install QuickLook

Write-Host "��װ���˳���Ա����Ҫ�Ŀ����ļ��������Everything"
scoop install everything

Write-Host "��װ���̿ռ�ռ�ù�����TreeSize��Ѱ�"
#scoop bucket add vi https://gh-proxy.com/https://github.com/ViCrack/scoop-bucket
#scoop install vi/treesize
scoop install treesize-free