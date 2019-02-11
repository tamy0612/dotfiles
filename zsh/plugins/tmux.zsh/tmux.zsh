function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_running() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function open_tmux() {
    if is_tmux_running; then
        echo "already in a $(tmux -V) session"
        return 0
    fi
    if is_screen_running; then
        echo "Error: cannot open tmux session on a screen session" 2>&1
        return 1
    fi
    if ! is_exists 'tmux'; then
        echo "Error: tmux is not installed" 2>&1
        return 1
    fi
    if shell_has_started_interactively && ! is_ssh_running; then
        if tmux has-session > /dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
            echo '--- Available sessions'
            tmux list-sessions
            echo -n "\ntmux: attach? [y/N/session] > "
            read
            if [[ "$REPLY" =~ ^[nN]$ ]]; then
                return 0
            else
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                else
                    tmux attach-session -t "$REPLY"
                fi
            fi
        else
            echo -n 'tmux: new session name > '
            read
            if [[ "$REPLY" == '' ]]; then
                tmux new -s default
            else
                tmux new -s "$REPLY"
            fi
        fi
    fi
}

function on_login_tmux_session() {
    echo "$(tmux -V) attached session: $(tmux display-message -p '#S')"
}
