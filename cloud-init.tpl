#!/usr/bin/env bash
sudo apt update && sudo apt install -y unzip jq git
cd /usr/local/src
git clone https://github.com/MediaMash/janus-script.git
cd janus-script
cat turnserver.conf