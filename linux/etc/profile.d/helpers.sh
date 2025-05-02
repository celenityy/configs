#!/bin/sh

alias update='sudo dnf update --refresh && sudo flatpak update && sudo fwupdmgr refresh --force && sudo fwupdmgr upgrade && sudo akmods --force';
alias envedit='nano ~/.bashrc';
alias envup='source ~/.bashrc';

export MOZ_ENABLE_WAYLAND=1;