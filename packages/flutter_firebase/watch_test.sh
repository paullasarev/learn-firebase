#!/bin/sh
#brew install fswatch

#fswatch -e ".*" -i "\\.dart$" . | xargs -n1 -I {} sh -c "echo $'\e[1;31m'{}$'\e[0m'; flutter test -j 2 ./lib"
fswatch -e ".*" -i "\\.dart$" . | grep --line-buffered -v "generated_plugin_registrant\\.dart$" | xargs -n1 -I {} sh -c "echo $'\e[1;31m'{}$'\e[0m'; flutter test -j 2 ./lib"
#fswatch -l2 -e "generated_plugin_registrant\\.dart$" -e "_test\\.dart$" -i "\\.dart$" ./lib | sed -u -e "s/\\.dart/_test\\.dart/g" | xargs -n1 -I {} sh -c "flutter test {}"
