# Thx to georgecalm from HackerNews for providing these.
# https://news.ycombinator.com/item?id=6231396
set MARKPATH $HOME/.marks
function jump
  cd $MARKPATH/$argv; or echo "No such mark: $argv"
end

function mark
   mkdir -p $MARKPATH; and ln -s (pwd) $MARKPATH/$argv
end

function unmark
  rm -i $MARKPATH/$argv
end

function marks
  ls -l $MARKPATH | cut -d' ' -f9-; and echo
end
