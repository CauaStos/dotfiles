#!/bin/bash

if pidof ulauncher; then
    ulauncher-toggle
else
    ulauncher --no-window-shadow
fi
