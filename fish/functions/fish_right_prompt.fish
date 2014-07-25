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

    set temp1 (sensors -u | grep temp3_input | awk '{print $2}')
    set temp2 (sensors -u | grep temp3_input | awk '{print $2}')

    if test (echo "$temp1 < 70" | bc) -eq 1
       set_color green
    else
       set_color red
    end
    printf "%.0f" $temp1

    set_color 555
    echo "/"

    if test (echo "$temp1 < 70" | bc) -eq 1
       set_color green
    else
       set_color red
    end
    printf "%.0f" $temp2

    set_color 555
    echo "℃  "
    date "+%H:%M:%S %d.%m.%Y"

    set_color normal
end
