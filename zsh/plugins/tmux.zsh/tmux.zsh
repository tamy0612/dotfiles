# Environment
function _is_interactive() { [ ! -z "$PS1" ]; }
function _is_ssh_connection() { [ ! -z "$SSH_CONECTION" ]; }
function _is_tmux_running() { [ ! -z "$TMUX" ]; }
function _is_screen_running() { [ ! -z "$STY" ]; }
function _is_tmux_available() { type "tmux" > /dev/null 2>&1; return $?; }

# tmux
function _tmux_has_session() {
    tmux has-session > /dev/null 2>&1;
}
function _tmux_num_sessions() {
    tmux list-sessions | awk '{ print NR }';
}
function _tmux_new_session() {
    tmux new-session -s "default";
}
function _tmux_attach_mru() {
    tmux attach-session;
}
function _tmux_select_session() {
    echo '---Available sessions';
    tmux list-sessions;
    echo -n "\ntmux: attach? [y/N/session] > ";
    read
    if [[ "$REPLY" =~ ^[nN]$ ]]; then
        return 0;
    else
        if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
            tmux attach-session;
        else
            tmux attach-session -t "$REPLY";
        fi
    fi
}

# global functions
function open_tmux() {
    if ! _is_interactive; then
        return 0;
    fi
    if _is_ssh_connection; then
        return 0;
    fi
    if _is_tmux_running; then
        echo "already in a $(tmux -V) session";
        return 0;
    fi
    if _is_screen_running; then
        echo "Error: cannot open tmux session on a screen session" 2>&1;
        return 1;
    fi
    if ! _is_tmux_available; then
        echo "Error: tmux is not installed" 2>&1;
        return 1;
    fi
    if ! _tmux_has_session; then
        _tmux_new_session "default";
    else
        case $(tmux list-sessions | awk '{ print NR }') in
            1) _tmux_attach_mru;;
            *) _tmux_select_session;;
        esac
    fi
}

function on_login_tmux_session() {
    if _is_tmux_running; then
        echo "$(tmux -V) attached session: $(tmux display-message -p '#S')"
    fi
}
