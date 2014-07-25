function fish_prompt -d "Write out the prompt"
	printf '%s%s%s@%s%s%s%s> ' (set_color F60) (whoami) (set_color normal) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end
