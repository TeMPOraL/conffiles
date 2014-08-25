function fish_right_prompt -d "Write out the right prompt"

    set retcode $status

    if test $retcode -eq 0
       set_color normal
    else
       set_color red
    end
    echo -n "$retcode "
    set_color normal

    if test -d .git
       parse_git_branch
       echo -n " "
    end

    set_color 555

    date "+%H:%M:%S %d.%m.%Y"

    set_color normal
end
