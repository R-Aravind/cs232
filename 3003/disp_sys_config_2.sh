#!/bin/bash

clear

echo "## Operating System Information :"
echo ""
cat /etc/*-release
echo "-------"
echo ""

echo "## List of all available shells :"
echo ""
cat /etc/shells
echo "-------"
echo ""

echo "## CPU information :"
echo ""
lscpu
echo "-------"
echo ""

echo "## Memory Information :"
echo ""
cat /proc/meminfo
echo "-------"
echo ""

echo "## Hard Disk Information :"
echo ""
lshw -class disk -class storage
echo "-------"
echo ""

echo "## File System Information :"
echo ""
cat /proc/mounts
echo "-------"
echo ""
