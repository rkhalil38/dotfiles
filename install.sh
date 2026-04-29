for app in *; do
    [[ "$app" == "install.sh" ]] && continue

    target="$HOME/.config/$app"

    echo "Removing existing $target"
    rm -rf -- "$target"

    echo "Symlinking $(pwd)/$app into $target"
    cp -rs -- "$(pwd)/$app" "$target"
done
