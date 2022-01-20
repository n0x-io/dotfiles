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

