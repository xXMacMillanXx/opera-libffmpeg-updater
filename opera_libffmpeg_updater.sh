# download for backups in case something breaks, creates folders if not exist
mkdir -p ~/Downloads/libffmpeg_web
curl -s https://api.github.com/repos/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/latest \
| grep "linux-x64.zip" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - --directory-prefix ~/Downloads/libffmpeg_web
# actual download to replace libffmpeg in opera directory
curl -s https://api.github.com/repos/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/latest \
| grep "linux-x64.zip" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi - -O temp.zip
# handle downloaded file
unzip -q temp.zip
rm temp.zip
# move lib, create folders if not exist
sudo mkdir -p /usr/lib64/opera/lib_extra
sudo mv libffmpeg.so /usr/lib64/opera/lib_extra/libffmpeg.so
