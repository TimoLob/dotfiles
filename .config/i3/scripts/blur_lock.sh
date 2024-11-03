#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="maim $PICTURE"

BLUR="10x8"

$SCREENSHOT
magick $PICTURE -blur $BLUR $PICTURE
i3lock -ni $PICTURE
rm $PICTURE
