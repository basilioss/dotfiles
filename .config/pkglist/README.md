## List of installed packages

- [Explicitly installed packages](pkglist.txt)
- [AUR](foreignpkglist.txt)

## Installation

1. `sudo cp generate-pkglist.hook generate-foreignpkglist.hook /usr/share/libalpm/hooks` (generate hooks to keep the lists up-to-date)
2. `pacman -S --needed - < pkglist.txt`
3. `paru -S --needed - < foreignpkglist.txt`

See: <https://wiki.archlinux.org/title/pacman/Tips_and_tricks#List_of_installed_packages>

