if test -e $source
    set -g _pde_source $source
end

function migrate_config
    if test -e $_pde_source
        rsync -au --backup --suffix=".bak" "$_pde_source/etc/" "$HOME/.config"
    end

    if ! grep init_shell "$__fish_config_dir/config.fish" >/dev/null
        set --local _fish_config "$__fish_config_dir/config.fish"
        mv $_fish_config "$_fish_config.bak"
        printf "init_shell\n" >$_fish_config
        cat "$_fish_config.bak" >>$_fish_config
    end
end

function _pde_install --on-event pde_install
    # Set universal variables, create bindings, and other initialization logic.
    migrate_config
end

function _pde_update --on-event pde_update
    # Migrate resources, print warnings, and other update logic.
    migrate_config
end

function _pde_uninstall --on-event pde_uninstall
    # Erase "private" functions, variables, bindings, and other uninstall logic.
end
