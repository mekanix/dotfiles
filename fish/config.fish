set -x LANG "en_US.UTF-8"
set -x LC_COLLATE "POSIX"
set -x EDITOR nvim
set -x fish_prompt_pwd_dir_length 256
set -x hydro_color_pwd 6a9fb5
set -x hydro_color_git 75b5aa
set -x hydro_color_start f4bf75
set -x hydro_cmd_duration_threshold 999999999999

if set -q SSH_TTY; or set -q SUDO_USER; or test (id -u) -eq 0
 set -g hydro_symbol_start "$USER@"(prompt_hostname)" "
end

if status --is-interactive
  set -x SHELL (which fish)
end

if status is-login
  if [ -z "$DISPLAY" ]; and [ (tty) = "/dev/ttyv8" ]
    set -xg BROWSER ~/bin/browser.sh
    eval (ssh-agent -c)

    export XDG_RUNTIME_DIR=/var/run/user/$(id -u)
    if [ ! -d "$XDG_RUNTIME_DIR" ]
        mkdir -p $XDG_RUNTIME_DIR
        chmod 700 $XDG_RUNTIME_DIR
    end
    export XDG_CURRENT_DESKTOP=sway

    exec dbus-run-session sway
  end
end
