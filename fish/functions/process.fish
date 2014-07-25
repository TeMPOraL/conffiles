function process -d "Find process(es) by name."
ps aux | grep -v grep | grep $argv
end
