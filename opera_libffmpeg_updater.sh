# creates folders if not exist
mkdir -p ~/Downloads/libffmpeg_web

# variables
json=$(curl -s https://api.github.com/repos/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/latest)
url=$(echo $json | jq -r '.assets[] | select(.browser_download_url | contains("linux-x64")) .browser_download_url')
filename=$(echo $url | awk -F / '{print $NF}')

# actual download to replace libffmpeg in opera directory
wget -q $url -O temp.zip

# copy downloaded file to keep as backup
cp temp.zip ~/Downloads/libffmpeg_web/$filename

# handle downloaded file
unzip -q temp.zip
rm temp.zip

# move lib, create folders if not exist
sudo mkdir -p /usr/lib64/opera/lib_extra
sudo mv libffmpeg.so /usr/lib64/opera/lib_extra/libffmpeg.so
