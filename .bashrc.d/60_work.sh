#alias ciso="ssh -C varsokej@access.ciso.leidos.com -p 2202 -L 9119:10.248.49.55:119 -L 9443:10.248.49.55:443"
alias ciso="ssh access.ciso.leidos.com"
alias ds="ssh root@dev-shoulders.leidoscope.com"
#alias i2ar="ssh -A ec2-user@i2ar.leidoscope.com" #for the amazon hop
alias i2ar="sudo -E ssh -F $HOME/.ssh/config satellite"

