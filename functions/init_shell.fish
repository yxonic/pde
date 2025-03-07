function init_shell --description "Initialize shell. Should be called in config.fish immediately after brew initialization."
    if status is-interactive
        # Commands to run in interactive sessions can go here
        starship init fish | source
        functions -e __fish_prompt_orig

        zoxide init fish | source
        fzf --fish | source
    end
end
