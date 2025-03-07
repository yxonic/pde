set temp (command mktemp -d)
set source $temp/pde
set url https://api.github.com/repos/yxonic/pde/tarball/HEAD

echo Fetching (set_color --underline)$url(set_color normal)
command curl -q --silent -L $url | command tar -xzC $temp -f - 2>/dev/null

command mkdir -p $source
command cp -Rf $temp/*/* $source
command rsync -au --backup --suffix=".bak" "$source/config/" "$HOME/.config"
