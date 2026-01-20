#!/bin/sh

flatpak list --app --columns=application | tail -n +1 > flatpaklist.txt
echo "flatpaklist.txt has been updated"
