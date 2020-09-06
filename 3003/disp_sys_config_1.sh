#!/bin/bash

clear

echo "Your username : $USER"
echo "-------"

echo "Home directory : $HOME"
echo "-------"

echo "Operating System Type:"
#cat /etc/*-release
uname -o
echo "-------"

echo "Current path setting : $PATH"
echo "-------"

echo "current working directory :"
pwd
echo "-------"

echo "Currently logged on users:"
who
echo "-------"
