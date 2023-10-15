#!/bin/sh

unzip -q ./blessing-skin-server-6.0.2.zip -d blessing-skin-server
docker build -t dzzhyk/minecraft-blessing-skin-docker:6.0.2 .
