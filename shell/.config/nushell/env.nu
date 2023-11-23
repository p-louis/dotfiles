def create_left_prompt [] {
    let home =  $nu.home-path

    # Perform tilde substitution on dir
    # To determine if the prefix of the path matches the home dir, we split the current path into
    # segments, and compare those with the segments of the home dir. In cases where the current dir
    # is a parent of the home dir (e.g. `/home`, homedir is `/home/user`), this comparison will 
    # also evaluate to true. Inside the condition, we attempt to str replace `$home` with `~`.
    # Inside the condition, either:
    # 1. The home prefix will be replaced
    # 2. The current dir is a parent of the home dir, so it will be uneffected by the str replace
    let dir = (
        if ($env.PWD | path split | zip ($home | path split) | all { $in.0 == $in.1 }) {
            ($env.PWD | str replace $home "~")
        } else {
            $env.PWD
        }
    )

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X %p') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.local/bin")


$env.EDITOR = "nvim"
$env.TERMINAL = "st"
$env.BROWSER = "firefox"

$env.M2_HOME = "$HOME/.local/share/maven"

$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
$env.XDG_CACHE_HOME = $"($env.HOME)/.cache"
$env.XDG_STATE_HOME = $"($env.HOME)/.local/state"
$env.XDG_RUNTIME_DIR = $"($env.HOME)/.local/runtime"
$env.PROJECT_HOME = $"($env.HOME)/work"

$env.NOTMUCH_CONFIG = $"($env.XDG_CONFIG_HOME)/notmuch-config"
$env.GTK2_RC_FILES = $"($env.XDG_CONFIG_HOME)/gtk-2.0/gtkrc-2.0"
$env.LESSHISTFILE = "-"
$env.WGETRC = $"($env.XDG_CONFIG_HOME)/wget/wgetrc"
$env.INPUTRC = $"($env.XDG_CONFIG_HOME)/shell/inputrc"
$env.ZDOTDIR = $"($env.XDG_CONFIG_HOME)/zsh"
$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"
$env.WINEPREFIX = $"($env.XDG_DATA_HOME)/wineprefixes/default"
$env.KODI_DATA = $"($env.XDG_DATA_HOME)/kodi"
$env.PASSWORD_STORE_DIR = $"($env.XDG_DATA_HOME)/password-store"
$env.TMUX_TMPDIR = $"$XDG_RUNTIME_DIR"
$env.ANDROID_SDK_HOME = $"($env.XDG_CONFIG_HOME)/android"
$env.CARGO_HOME = $"($env.XDG_DATA_HOME)/cargo"
$env.GOPATH = $"($env.XDG_DATA_HOME)/go"
$env.ANSIBLE_CONFIG = $"($env.XDG_CONFIG_HOME)/ansible/ansible.cfg"
$env.UNISON = $"($env.XDG_DATA_HOME)/unison"
$env.HISTFILE = $"($env.XDG_DATA_HOME)/history"
$env.AWS_CONFIG_FILE = $"($env.XDG_CONFIG_HOME)/aws/config"
$env.AWS_SHARED_CREDENTIALS_FILE = $"($env.XDG_DATA_HOME)/aws/credentials"
$env._JAVA_OPTIONS = $"-Djava.util.prefs.userRoot=\"($env.XDG_CONFIG_HOME)\"/java"
$env.DOCKER_CONFIG = $"($env.XDG_CONFIG_HOME)/docker"
$env.GRADLE_USER_HOME = $"($env.XDG_DATA_HOME)/gradle"
$env.RANDFILE = $"($env.XDG_DATA_HOME)/openssl/rnd"
$env.ELM_HOME = $"($env.XDG_CONFIG_HOME)/elm"
$env.REDISCLI_HISTFILE = $"($env.XDG_DATA_HOME)/redis/rediscli_history"
$env.REDISCLI_RCFILE = $"($env.XDG_CONFIG_HOME)/redis/redisclirc"
$env.XINITRC = $env.XDG_CONFIG_HOME + "/x11/xinitrc"
$env.XSERVERRC = $env.XDG_CONFIG_HOME + "/x11/xserverrc"

$env.TEXMFHOME = $env.XDG_DATA_HOME + "/texmf"
$env.TEXMFVAR = $env.XDG_CACHE_HOME + "/texlive/texmf-var"
$env.TEXMFCONFIG = $env.XDG_CONFIG_HOME + "/texlive/texmf-config"

$env.PSQLRC = $"($env.XDG_CONFIG_HOME)/pg/psqlrc"
$env.PSQL_HISTORY = $"($env.XDG_STATE_HOME)/psql_history"
$env.PGPASSFILE = $"($env.XDG_CONFIG_HOME)/pg/pgpass"
$env.PGSERVICEFILE = $"($env.XDG_CONFIG_HOME)/pg/pg_service.conf"

$env.RUSTUP_HOME = $"($env.XDG_CONFIG_HOME)/rustup/config"

$env.WGETRC = $"($env.XDG_CONFIG_HOME)/wgetrc"


# Other program settings:
$env.DICS = "/usr/share/stardict/dic/"
$env.SUDO_ASKPASS = "$HOME/.local/bin/dmenupass"
$env.FZF_DEFAULT_OPTS = "--layout=reverse --height 40%"

$env.PAGER = "bat"
$env.LESS = " -R "
$env.LESS_TERMCAP_mb = '\E[1;31m'
$env.LESS_TERMCAP_md = '\E[1;36m'
$env.LESS_TERMCAP_me = '\E[0m'
$env.LESS_TERMCAP_so = '\E[01;44;33m'
$env.LESS_TERMCAP_se = '\E[0m'
$env.LESS_TERMCAP_us = '\E[1;32m'
$env.LESS_TERMCAP_ue = '\E[0m'
$env.LESSOPEN = "| /usr/bin/highlight --out-format ansi %s 2>/dev/null"
$env.QT_QPA_PLATFORMTHEME = "gtk2"	# Have QT use gtk2 theme.
$env.MOZ_USE_XINPUT2 = "1"		# Mozilla smooth scrolling/touchpads.
$env.AWT_TOOLKIT = "MToolkit wmname LG3D"	#May have to install wmname
$env._JAVA_AWT_WM_NONREPARENTING = 1	# Fix for Java applications in dwm

# This is the list for lf icons:
$env.LF_ICONS = (["di=📁" "fi=📃" "tw=🤝" "ow=📂" "ln=⛓" "or=❌" "ex=🎯" "*.txt=✍" "*.mom=✍" "*.me=✍" "*.ms=✍" "*.png=🖼" "*.webp=🖼" "*.ico=🖼" "*.jpg=📸" "*.jpe=📸" "*.jpeg=📸" "*.gif=🖼" "*.svg=🗺" "*.tif=🖼" "*.tiff=🖼" "*.xcf=🖌" "*.html=🌎" "*.xml=📰" "*.gpg=🔒" "*.css=🎨" "*.pdf=📚" "*.djvu=📚" "*.epub=📚" "*.csv=📓" "*.xlsx=📓" "*.tex=📜" "*.md=📘" "*.r=📊" "*.R=📊" "*.rmd=📊" "*.Rmd=📊" "*.m=📊" "*.mp3=🎵" "*.opus=🎵" "*.ogg=🎵" "*.m4a=🎵" "*.flac=🎼" "*.wav=🎼" "*.mkv=🎥" "*.mp4=🎥" "*.webm=🎥" "*.mpeg=🎥" "*.avi=🎥" "*.mov=🎥" "*.mpg=🎥" "*.wmv=🎥" "*.m4b=🎥" "*.flv=🎥" "*.zip=📦" "*.rar=📦" "*.7z=📦" "*.tar.gz=📦" "*.z64=🎮" "*.v64=🎮" "*.n64=🎮" "*.gba=🎮" "*.nes=🎮" "*.gdi=🎮" "*.1=ℹ" "*.nfo=ℹ" "*.info=ℹ" "*.log=📙" "*.iso=📀" "*.img=📀" "*.bib=🎓" "*.ged=👪" "*.part=💔" "*.torrent=🔽" "*.jar=♨" "*.java=♨" ] | str join ":")

source "~/.config/nushell/private-env.nu"
