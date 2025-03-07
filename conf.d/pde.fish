function migrate_config
    rsync -au --backup --suffix=$(date +'.%F_%H-%M') etc/ $HOME/.config
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
