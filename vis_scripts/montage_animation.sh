for a in test_montage0???.tif; do convert -resize 1920x1080 $a ${a%.tif}_resize.tif; done

# Create pngs using 3dmod

ffmpeg -i temp/zap%03d.png -framerate 10 -c:v libvpx-vp9 -lossless 1 video.webm
ffmpeg -i video.webm -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 1 -an -f null /dev/null && ffmpeg -i video.webm -c:v libvpx-vp9 -b:v 0 -crf 30 -pass 2 -c:a libopus assembly.webm