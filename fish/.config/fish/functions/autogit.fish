function autogit --description 'Pull, add all, commit, and push'
    set -l msg $argv[1]
    if test -z "$msg"
        set msg "auto git command"
    end
    git pull && git add . && git commit -m $msg && git push
end
