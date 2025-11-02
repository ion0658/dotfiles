#!/bin/bash
pos=$(pwd)

read -p "Link .config/ ? [Y/n]: " config
case $config in
  "" | "Y" | "y" | "yes" | "Yes" | "YES" ) ln -sf $pos/.config $HOME/.config && echo ".config linked" ;;
  * ) echo "not linked .config";;
esac

