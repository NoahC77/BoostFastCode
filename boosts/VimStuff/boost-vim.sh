#!/bin/bash
# Theme paths are relative to vimStuff/
THEME_COUNT=2
THEME_ROOT_DIR=$(pwd)
THEME_PATHS=( '/vim-themes/turbocpp/.vimrc' '/vim-themes/pablo/.vimrc' )
# TODO: automate theme paths
THEME_NAMES=( "turbocpp" "Pablo" )

END_VIMRC_PATH="$HOME/vimfiles/.vimrc"


echo '⌂Themes⌂'
select theme in ${THEME_NAMES[@]}
do

echo "theme = $theme"

case $theme in

  turbocpp) 
    cp $THEME_ROOT_DIR${THEME_PATHS[0]} $END_VIMRC_PATH
    ;;

  Pablo)
    cp $THEME_ROOT_DIR${THEME_PATHS[1]} $END_VIMRC_PATH
    ;;

  *)
    echo "BFC::ERROR: INVALID SWITCH CASE IN boost-vim.sh"
    exit
    ;;

esac
done

exit
