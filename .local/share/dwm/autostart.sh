#!/bin/sh
if ! pgrep -x "picom" > /dev/null; then picom --experimental-backends; fi
if ! pgrep -x "sxhkd" > /dev/null; then sxhkd; fi
