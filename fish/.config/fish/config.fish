if [ -z "$DISPLAY" ] && [ (fgconsole) -eq 1 ]; 
    startx
end

# uncomment to automatically start tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end

fish_ssh_agent

function q
    exit
end

function lf
    command lfub
end

function cl 
    command clear && ls
end

function cat
    bat --theme=Nord $argv
end

function tn
    tmux new -s (pwd | sed 's/.*\///g')
end

function ls 
    lsd $argv --group-dirs first
end

function ll 
    lsd -lha $argv --group-dirs first 
end

function l
    lsd -lh $argv --group-dirs first 
end

function tree
    lsd --tree $argv 
end

function ds 
    command du -sch * | sort -rh
end

function hv
    command nmcli --ask connection up "HP VPN"
end

function hvd
    command nmcli connection down "HP VPN"
end

function nv
    command nvim $argv
end

