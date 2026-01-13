function init_shell --description "Initialize shell. Should be called in config.fish immediately after brew initialization."
    if status is-interactive
        # Commands to run in interactive sessions can go here
        starship init fish | source
        functions -e __fish_prompt_orig

        zoxide init fish | source
        fzf --fish | source

        set -gx EDITOR (which hx)

        set -gx BUN_INSTALL "$HOME/.bun"
        fish_add_path -g "$BUN_INSTALL/bin"
    end
end
