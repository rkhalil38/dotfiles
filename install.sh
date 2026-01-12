for app in $(ls); do
    if [[ "$app" != "install.sh" ]]; then
	echo "Symlinking $(pwd)/$app into $HOME/.config/$app"
	cp -rs $(pwd)/$app $HOME/.config/$app
    fi
done
