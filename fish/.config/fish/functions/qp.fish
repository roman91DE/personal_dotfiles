function qp --description 'Run claude -p with args or stdin'
    if test (count $argv) -gt 0
        claude -p $argv
    else
        claude -p (cat)
    end
end
