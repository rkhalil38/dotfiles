CONFIG_DIR="$HOME/.config"

declare -a to_remove=()

echo "Scanning for existing configs that would be overwritten...\n"

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
            echo "  [DIR ] $item"
        else
            echo "  [FILE] $item"
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
