cd "$HOME"
xdg-open "$(find . -maxdepth 2 -type f | fuzzel -d --auto-select --no-sort --hide-before-typing -w 60 )" &
