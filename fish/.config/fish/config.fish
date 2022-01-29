if [ -z "$DISPLAY" ] && [ (fgconsole) -eq 1 ]; 
    startx
end

function q
    exit
end

function cl 
    command clear && ls
end

function cat
    bat --theme=Nord $argv
end

function cnas
    curlftpfs 10.0.0.250 ~/NAS -o ssl,no_verify_peer,no_verify_hostname,uid=1000,gid=1000,umask=022
end
