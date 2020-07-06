#!/bin/bash
# Theme paths are relative to vimStuff/
THEME_COUNT=2
THEME_NAMES=( "turbocpp" "Pablo" )
# TODO: automate theme paths



END_VIMRC_FILE="/.vimrc"
END_VIM_COLORS_DIR="/.vim/colors"
THEME_ROOT_DIR="$(pwd)"
# tdo: pATHS COULD BE SPECIFIED USING theme_names ARRAY
THEME_DIRS=('/vim-themes/turbocpp/.vim' '/vim-themes/Pablo/.vim')
THEME_COLOR_FILES=('NULL' '/vim-themes/Pablo/.vim/colors/256-jungle.vim')
THEME_RC_FILES=( "/vim-themes/turbocpp/.vimrc" "/vim-themes/Pablo/.vimrc" )
echo '⌂Themes⌂'
select theme in ${THEME_NAMES[@]}
do
case $theme in

  turbocpp) 
    sudo cp $THEME_ROOT_DIR${THEME_RC_FILES[0]} $END_VIMRC_PATH
    ;;

  Pablo)
    sudo cp $THEME_ROOT_DIR${THEME_RC_FILES[1]}  $END_VIMRC_FILE
    sudo cp $THEME_ROOT_DIR${THEME_COLOR_FILES[1]} $END_VIM_COLORS_DIR
    ;;

  *)
    echo "BFC::ERROR: INVALID SWITCH CASE IN boost-vim.sh"
    exit
    ;;

esac
done

exit
