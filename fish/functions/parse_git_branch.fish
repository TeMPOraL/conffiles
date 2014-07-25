function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo "⌜"(set_color red)$branch(set_color normal)"⌟"
  else
    echo "⌜"(set_color AEAEDD)$branch(set_color normal)"⌟"
  end
end
