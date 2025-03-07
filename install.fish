set temp (command mktemp -d)
set source $temp/pde
set url https://api.github.com/repos/yxonic/pde/tarball/HEAD
set fish_config $HOME/.config/fish/config.fish

echo Fetching (set_color --underline)$url(set_color normal)
command curl -q --silent -L $url | command tar -xzC $temp -f - 2>/dev/null

echo -n "Installing configurations... "
command mkdir -p $source
command cp -a $temp/*/* $source
command rsync -au --backup --suffix=.bak $source/config/ $HOME/.config

if ! command grep init_shell $fish_config >/dev/null
    touch $fish_config
    mv $fish_config $fish_config.bak
    printf "init_shell\n\n" >$fish_config
    cat $fish_config.bak >>$fish_config
end

echo Done
