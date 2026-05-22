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
CONFIG_DIR="$HOME/.config"
declare -a to_remove=()

install_depends

echo
echo "Scanning for existing configs that would be overwritten...\n"
echo

for app in *; do
    [[ "$app" == "install.sh" ]] && continue

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

for app in *; do
    [[ "$app" == "install.sh" ]] && continue

    target="$CONFIG_DIR/$app"

    [[ -e "$target" ]] && rm -rf -- "$target"

    echo "Symlinking $(pwd)/$app -> $target"
    cp -rs -- "$(pwd)/$app" "$target"
done

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
        echo "  [SKIP] Not running inside Hyprland, skipping hyprctl reload."
    else
        echo "  [....] Reloading Hyprland config..."
        hyprctl reload
        echo "  [ OK ] Hyprland reloaded."
    fi
}

post_install
