#!/usr/bin/env bash

cmd=$1

case $1 in "neopush")
	git add .
	git commit -m "$2"
	git push
esac
