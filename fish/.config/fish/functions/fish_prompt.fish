function fish_prompt
    set -l cyan (set_color cyan)
    set -l blue (set_color --bold blue)
    set -l yellow (set_color yellow)
    set -l magenta (set_color magenta)
    set -l normal (set_color normal)

    echo -n $cyan$USER@(hostname -s)$normal'  '
    echo -n $blue(prompt_pwd)$normal' '

    set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test -n "$branch"
        echo -n $yellow'⎇ '$branch$normal' '
    end

    echo -n $magenta'⚡'$normal' '
end
