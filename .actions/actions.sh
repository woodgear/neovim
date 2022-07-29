#!/bin/bash
function nvim-build() {
    local base=$(dirname $(zmx-find-base-of-action))
    echo $base
    unset LUA_CPATH
    unset LUA_PATH
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$base/target
    make install
    sudo rm /usr/bin/wg-nvim
    sudo ln -s $base/target/bin/nvim /usr/bin/wg-nvim
}