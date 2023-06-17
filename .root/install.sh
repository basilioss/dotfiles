#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
  echo "Permission denied. Run sudo ./install.sh"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

copy() {
  from="$1"
  to="$2"
  echo "Copying '$from' to '$to'"
  rm -f "$to"
  cp "$from" "$to"
}

script_path=$(readlink -f "$0")
script_dir=$(dirname "$script_path")
cd "$script_dir" || exit
files=$(find * -type f -not -name "install.sh")

for file in $files; do
  mkdir -p "/$(dirname "$file")"
  if [ "${file#boot}" != "$file" ]; then
    copy "$script_dir/$file" "/$file"
  else
    link "$script_dir/$file" "/$file"
  fi
done
