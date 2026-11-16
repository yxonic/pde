function init_shell --description "Initialize shell. Should be called at the top of config.fish."
    if status is-interactive
        # Commands to run in interactive sessions can go here
        starship init fish | source
        functions -e __fish_prompt_orig

        zoxide init fish | source
        # fzf --fish | source

        set -gx EDITOR (which hx)

        set -gx BUN_INSTALL "$HOME/.bun"
        fish_add_path -g "$BUN_INSTALL/bin"

        set -gx PNPM_HOME "$HOME/Library/pnpm"
        fish_add_path -g "$PNPM_HOME"
    end
end
