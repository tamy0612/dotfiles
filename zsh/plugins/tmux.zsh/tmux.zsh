function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function open_tmux() {
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi
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
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi
        fi
    fi
}
