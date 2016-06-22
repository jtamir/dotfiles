#!/bin/bash

# enable color support of ls and also add handy aliases
alias ls='ls -G'
alias lsl='ls -lth'
alias lsa='ls -Ath'
alias l='ls -CFh'

alias grep='grep --color=auto'
alias cgrep='grep --color=always'
alias psg='ps aux | head -1 ; ps aux | grep'

alias make='colormake'

alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -P now'

alias xfig='xfig -geometry 950x700+50+20 -metric -startgridmode 3 -specialtext -latexfonts -startlatexFont default'

alias skim='open -a Skim'
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text'
