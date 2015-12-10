#!/bin/sh

printf '%s\n' "${PWD}"
cd "`dirname "$0"`"
printf '%s\n' "${PWD}"

cucumber

printf '%s\n' "${PWD##*/}"
printf "执行完毕，敲回车退出..."

read WHATEVER

exit $?
