function proxy --description "manage proxy environment variables"
    switch $argv
    case on
        set -gx http_proxy http://localhost:1087
        set -gx https_proxy http://localhost:1087
    case off
        set -e http_proxy
        set -e https_proxy
    case '*'
        echo 'Usage: proxy [on|off]'
    end
end
