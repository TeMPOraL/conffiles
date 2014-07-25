# some stuff stolen^H^H^H^H^Hborrowed from https://bitbucket.org/sjl/dotfiles/src/tip/fish/config.fish
function hex; ~/games/OpenHexagon1.92/./OpenHexagon; end

function serve_this; python -m SimpleHTTPServer; end

function urlencode
    python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);" $argv
end
function urldecode
    python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])" $argv
end

function sjoin -d "Join input lines into a single line with spaces"; tr '\n' ' '; end

function ltrim -d "Strip whitespace from the left of each line"
    sed -e 's/^[ \t]*//'
end

function rtrim -d "Strip whitespace from the right of each line"
    sed -e 's/[ \t]*$//'
end

function trim -d "Strip whitespace from both ends of each line"
    ltrim | rtrim
end


function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

alias howdoi='howdoi -c'

prepend_to_path "$HOME/bin"
