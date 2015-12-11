#!/bin/sh

die() {
    printf '%s\n' "${PWD}"
    printf "执行完毕，敲回车退出..."

    read WHATEVER

    exit $?
}

checkDependency() {
    echo '检查 ' $1 '...'
    checkOutput=$(which $1)
    echo "$checkOutput"
    if [ "$checkOutput" = "" ]; then
        echo $1 ' 没有找到，请先安装 ' $1 '。'
    else
        echo $1 ' 已安装。'
    fi
    echo '检查 ' $1 '完毕。'
}

printf '%s\n' "${PWD}"
cd "`dirname "$0"`"
printf '%s\n' "${PWD}"

echo '========= 开始执行 ========='
echo '检查 ruby...'
ruby -v
echo $?
if [ "$?" = "0" ] ; then
    echo 'ruby 已安装。'
else
    echo 'ruby 没有找到。请先安装 ruby。'
    die
fi
echo '检查 ruby 完毕 。'

echo '检查 cucumber...'
cucumberOutput=$(gem list cucumber)
echo "$cucumberOutput"
if [ "$cucumberOutput" = "" ]; then
    echo 'cucumber 没有找到。请先安装 cucumber。'
else
    echo 'cucumber 已安装。'
fi
echo '检查 cucumber 完毕。'

checkDependency "chromedriver"

cucumber

die