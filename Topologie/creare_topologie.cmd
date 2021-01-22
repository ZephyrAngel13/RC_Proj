ECHO OFF
REM Create virtnet topology 10

ECHO Se creaza topologia

PAUSE

REM Shortcut to the Virutal Box manager executable
SET vbm="E:\VirtualBox\VBoxManage.exe"

REM Clone and configure each node

REM Node 1 
%vbm% clonevm base --name node1 --snapshot base --options link --register
%vbm% modifyvm node1 --cableconnected2 off
%vbm% modifyvm node1 --cableconnected3 off
%vbm% modifyvm node1 --nic2 intnet --intnet2 neta
%vbm% modifyvm node1 --cableconnected2 on
%vbm% modifyvm node1 --natpf1 delete ssh
%vbm% modifyvm node1 --natpf1 ssh,tcp,,2201,,22

REM Node 2
%vbm% clonevm base --name node2 --snapshot base --options link --register
%vbm% modifyvm node2 --cableconnected2 off
%vbm% modifyvm node2 --cableconnected3 off
%vbm% modifyvm node2 --nic2 intnet --intnet2 neta
%vbm% modifyvm node2 --nic3 intnet --intnet3 netb
%vbm% modifyvm node2 --cableconnected2 on
%vbm% modifyvm node2 --cableconnected3 on
%vbm% modifyvm node2 --natpf1 delete ssh
%vbm% modifyvm node2 --natpf1 ssh,tcp,,2202,,22

REM Node 3 
%vbm% clonevm base --name node3 --snapshot base --options link --register
%vbm% modifyvm node3 --cableconnected2 off
%vbm% modifyvm node3 --cableconnected3 off
%vbm% modifyvm node3 --nic2 intnet --intnet2 netb
%vbm% modifyvm node3 --nic3 intnet --intnet3 netc
%vbm% modifyvm node3 --cableconnected2 on
%vbm% modifyvm node3 --cableconnected3 on
%vbm% modifyvm node3 --natpf1 delete ssh
%vbm% modifyvm node3 --natpf1 ssh,tcp,,2203,,22

REM Node 4 
%vbm% clonevm base --name node4 --snapshot base --options link --register
%vbm% modifyvm node4 --cableconnected2 off
%vbm% modifyvm node4 --cableconnected3 off
%vbm% modifyvm node4 --nic2 intnet --intnet2 netc
%vbm% modifyvm node4 --cableconnected2 on
%vbm% modifyvm node4 --natpf1 delete ssh
%vbm% modifyvm node4 --natpf1 ssh,tcp,,2204,,22

PAUSE

ECHO Urmatoarele masini virtuale vor aparea in VirtualBox:
ECHO    node1 node2 node3 node4
ECHO Pentru initalizarea acestora urmati pasii:
ECHO    1. Porniti "node1" in VirtualBox
ECHO    2. Logati-va cu userul si parola "network"/"network"
ECHO    3. Rulati comanda:
ECHO       sudo bash virtnet/bin/vn-deploynode 10 :
ECHO    4. Repetati pasii 1, 2 si 3 for node2, dar in terminal folositi comanda:
ECHO       sudo bash virtnet/bin/vn-deploynode 10 2
ECHO    5. Repetati pasii 1, 2 si 3 for node2, dar in terminal folositi comanda:
ECHO       sudo bash virtnet/bin/vn-deploynode 10 3
ECHO    6. Repetati pasii 1, 2 si 3 for node2, dar in terminal folositi comanda:
ECHO       sudo bash virtnet/bin/vn-deploynode 10 4

PAUSE
