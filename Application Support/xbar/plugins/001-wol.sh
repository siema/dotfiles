#!/bin/sh
#
# <xbar.title>Wake on LAN</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Siema</xbar.author>
# <xbar.author.github>siema</xbar.author.github>
# <xbar.desc>Wakes target machine.</xbar.desc>
# <xbar.dependencies>wakeonlan</xbar.dependencies>

export PATH="/opt/homebrew/bin:$PATH"

if [ "$1" = "wake" ]; then
  wakeonlan "$2"
  exit
fi

echo "⏻"
echo "---"

if ! hash wakeonlan 2>/dev/null; then
  echo "wakeonlan not installed"
  exit
fi

if [ ! -e ~/.xbar-wol ]; then
  echo "missing config file"
  exit
fi

MAC_ADDRESS=$(cat ~/.xbar-wol)

echo "Wake ${MAC_ADDRESS} | shell=\""$(realpath "$0")"\" param1=wake param2=${MAC_ADDRESS} terminal=false"
