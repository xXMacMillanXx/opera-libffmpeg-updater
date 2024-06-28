# Script

This script updates your Opera (web browser) extra media lib. In case this wasn't done before, it will also create the necessary directories (/usr/lib64/opera/lib_extra for the lib and a backup directory for older versions in ~/Downloads/libffmpeg_web).

Only update the extra media lib, if videos suddenly stopped playing after an Opera update and clearing the cache didn't fix it. (information about clearing the cache can be found in the section below)

Execute the script to update the extra media lib:

```bash
sh ./opera_libffmpeg_updater.sh
```

If you like to use different paths / directories or your distribution uses a different path to Opera, please edit them in your local script.

## After updating the media lib, my pages can't load anymore. Now what?

If this happens, start Opera without hardware acceleration:

```bash
opera --disable-gpu
```

Then go to settings (shortcut: Alt + p, or enter "opera://settings/" in the address bar), search for "cache" in the settings search bar or look for "Clear browsing data" in the "Privacy & security" section.
Here clear your data, "Cached images and files" should be fine, just be sure to select "All time" in the "Time range". Clear the data, close Opera and start it as usual. Now, with the cleared cache, it should be able to load the pages again.

In case this didn't help, try downloading an older version of libffmpeg.so form the [repo](https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases) (usually the linux-x64.zip file) unzip it and copy the libffmpeg.so manually to /usr/lib64/opera/lib_extra/libffmpeg.so.
