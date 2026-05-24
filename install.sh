# ============================
# Dotfile Dependencies
# ============================
depends=(
   hyprland
   hyprpaper
   hypridle
   hyprlock
   hyprpolkitagent
   hyprcursor
   hyprshutdown
   xdg-desktop-portal-hyprland
   pipewire
   wireplumber
   pipewire-pulse
   pipewire-alsa
   pipewire-jack
   brightnessctl
   kdeconnect
   opentabletdriver
   cliphist
   steam
   openrgb
   awww
   waybar
   matugen
   swaync
   fish
   ghostty
   fastfetch
   rofi
   bob
   cava
   thunar
   firefox
   blueman
   nvtop
   pavucontrol
)

# ============================
# Dependency Installation
# ============================
install_depends() {
    local missing=()

    for pkg in "${depends[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null; then
            missing+=("$pkg")
        fi
    done

    if [[ ${#missing[@]} -eq 0 ]]; then
        echo "All dependencies already satisfied."
        return 0
    fi

    echo "The following dependencies are not installed:"
    for pkg in "${missing[@]}"; do
        echo "  - $pkg"
    done
    echo

    read -rp "Install missing dependencies with pacman? (y/N): " confirm
    if [[ "$confirm" != "y" ]]; then
        echo "Skipping dependency installation."
        return 0
    fi

    sudo pacman -S --needed "${missing[@]}"
}

# ============================
# Dotfile Symlinking
# ============================
install_dotfiles() {
    local CONFIG_DIR="$HOME/.config"
    local to_remove=()
    local apps=()

    # Build the list of apps to install
    if [[ ${#only_install[@]} -gt 0 ]]; then
        for app in "${only_install[@]}"; do
            if [[ ! -d "$app" ]]; then
                echo "Warning: '$app' is not a directory in $(pwd), skipping." >&2
                continue
            fi
            apps+=("$app")
        done
    else
        for app in *; do
            [[ "$app" == "install.sh" ]] && continue
            [[ -d "$app" ]] && apps+=("$app")
        done
    fi

    echo "Scanning for existing configs that would be overwritten..."
    echo

    for app in "${apps[@]}"; do
        target="$CONFIG_DIR/$app"
        if [[ -e "$target" ]]; then
            to_remove+=("$target")
        fi
    done

    if [[ ${#to_remove[@]} -gt 0 ]]; then
        echo "⚠️  WARNING: The following existing files/directories will be PERMANENTLY REMOVED:"
        echo
        for item in "${to_remove[@]}"; do
            if [[ -d "$item" ]]; then
                echo "  [ DIR ] $item"
            else
                echo "  [ FILE ] $item"
            fi
        done
        echo
        echo "This will delete the above items and replace them with symlinks."
        echo "This operation is destructive and cannot be undone."
        echo
        read -rp "Do you want to continue? (y/N): " confirm
        if [[ "$confirm" != "y" ]]; then
            echo "Aborted."
            exit 1
        fi
    else
        echo "No existing configs found. Proceeding safely..."
    fi

    echo

    for app in "${apps[@]}"; do
        target="$CONFIG_DIR/$app"
        [[ -e "$target" ]] && rm -rf -- "$target"
        echo "Symlinking $(pwd)/$app -> $target"
        cp -rs -- "$(pwd)/$app" "$target"
    done
}

# ============================
# Post-Install Hooks
# ============================
post_install() {
    echo
    echo "Running post-install hooks..."
    echo

    # fish = default shell
    local fish_path
    fish_path="$(command -v fish)"

    if [[ -z "$fish_path" ]]; then
        echo "  [ SKIP ] fish not found in PATH, skipping shell change."
    elif [[ "$SHELL" == "$fish_path" ]]; then
        echo "  [ SKIP ] fish is already the default shell."
    else
        if ! grep -qF "$fish_path" /etc/shells; then
            echo "  [INFO] Adding $fish_path to /etc/shells..."
            echo "$fish_path" | sudo tee -a /etc/shells > /dev/null
        fi
        echo "  [....] Setting default shell to fish..."
        chsh -s "$fish_path"
        echo "  [ OK ] Default shell set to $fish_path"
    fi

    # reload hyprland
    if [[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
        echo "  [ SKIP ] Not running inside Hyprland, skipping hyprctl reload."
    else
        echo "  [....] Reloading Hyprland config..."
        hyprctl reload
        echo "  [ OK ] Hyprland reloaded."
    fi
}

# ============================
# Argument Parsing
# ============================
no_install_deps=false
only_install=()

while [[ $# -gt 0 ]]; do
    case "$1" in
        --no-install-deps)
            no_install_deps=true
            shift
            ;;
        --only-install)
            shift
            while [[ $# -gt 0 && "$1" != --* ]]; do
                only_install+=("$1")
                shift
            done
            if [[ ${#only_install[@]} -eq 0 ]]; then
                echo "Error: --only-install requires at least one directory." >&2
                exit 1
            fi
            ;;
        *)
            echo "Unknown option: $1" >&2
            echo "Usage: install.sh [--no-install-deps] [--only-install dir1 dir2 ...]" >&2
            exit 1
            ;;
    esac
done

# ============================
# Script
# ============================
[[ "$no_install_deps" == false ]] && install_depends
install_dotfiles
post_install
