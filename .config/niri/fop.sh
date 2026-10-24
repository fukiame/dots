cd "$HOME"
xdg-open "$(find . -mindepth 1 -maxdepth 2 -type f | fuzzel -d --auto-select --no-sort --hide-before-typing -w 60 --placeholder "files maxdepth 2" )" &
