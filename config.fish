status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

function fish_prompt
	test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test "$USER" = 'root'
    and echo (set_color red)"#"
    if test -n "$PYENV_VIRTUAL_ENV"
       set name (string split -r -m1 / $PYENV_VIRTUAL_ENV)

       set cur_dir (basename $PWD)
       echo -n  (set_color cyan)"$cur_dir""(venv:$name[2])"
       printf '%s$ ' (__fish_git_prompt)



    else
       set cur_dir (basename $PWD)
       echo -n  (set_color cyan)"$cur_dir"
       printf '%s$ ' (__fish_git_prompt)
    end
end


if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
