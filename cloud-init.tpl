#!/usr/bin/env bash
# Install git and other tools
sudo apt update && sudo apt install -y unzip jq git
# Clone janus source to src
cd /usr/local/src
#git clone https://github.com/MediaMash/janus-script.git
#cd janus-script
#sed -i 's/old-text/"${janus_server_name}"/g turnserver.conf
echo  'server_name "${janus_server_name}"' |tee "${janus_server_name}"
# edit janus.cfg
#sed -i 's/old-text/"${janus_server_name}"/g janus.cfg
#sed -i 's/old-text/"${janus_server_name}"/g janus.cfg

#bash install_janus.sh
