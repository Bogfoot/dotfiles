#!/bin/bash
function dsize ()
{
        du -sh $1 
}
 function reqs() 
{
        pip3 install -r $1
}
    
function loc()
{
        locate -b $1
        locate -c $1
}

function rmdir ()
{
        rm -rf "$1"
}

function cpdir ()
{
        cp -R "$1" "$2"
}
function LDir ()
{
for entry in "ls -R $1"/*
do
  echo "$entry"
done
}
