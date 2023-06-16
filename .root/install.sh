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

script=$(readlink -f "$0")
script_path=$(dirname "$script")
files=$(find * -type f -not -name "install.sh")

for file in $files; do
  if [ "${file#boot}" != "$file" ]; then
    copy "$script_path/${file}" "/${file}"
  else
    link "$script_path/${file}" "/${file}"
  fi
done
