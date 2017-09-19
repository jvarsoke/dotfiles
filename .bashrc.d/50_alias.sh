#!/bin/bash

MAILSPOOL='/var/spool/mail/jvarsoke'

##aliases
alias ls='ls -F --color=auto'
alias vi=vim
alias cls='ls -la ~'
alias ducks='du -cks * | sort -rn | head -11'

alias from='egrep "^From:" $MAILSPOOL'
alias f='finger'
alias xv='xzgv'
alias dvd='mplayer -framedrop dvd://1'

alias pine2mutt='pine2mutt ~/.addressbook > ~/.mutt/aliases_pine'
alias ss='ssh shadowbox'
alias sss='ssh -p 443 www.ghostmanonfirst.com'

#alias gr='cd "$(git rev-parse --show-toplevel)" && pwd'
alias gr='git rev-parse && cd "$(git rev-parse --show-cdup)" && pwd'

#radio
alias rkol='mplayer http://www.radio-kol.net/64/listen.pls'
alias difm='mplayer http://u17.di.fm:80/di_trance'
alias goa='mplayer http://u17.di.fm:80/di_goapsy'
alias djmix='mplayer http://u12.di.fm:80/di_djmixes'
alias dihouse='mplayer http://u16.di.fm:80/di_house'
alias dihardcore='mplayer http://u16.di.fm:80/di_hardcore'
alias diprogressive='mplayer http://u16.di.fm:80/di_progressive'

