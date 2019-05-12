rm ~/.bash_aliases

path=$(pwd)
rm -rf "$path/helm"

exec bash
