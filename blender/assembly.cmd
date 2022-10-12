# Movie filling the fourier space
for a in {1..1000}; do convert -gravity center temp/frame$(printf "%04d\n" $a).png \( ../0001.png -rotate $( printf '%s\n' $(echo "scale=8; $RANDOM/91" | bc ) ) \) -compose multiply -layers flatten temp/frame$( printf "%04d\n" $(( $a + 1 )) ).png; done


# Ribosome in realspace box
convert ribo.png -bordercolor White    -border 300x300 -resize 1080x1080 png:- | convert  real_space.png - -compose multiply -layers flatten ribo_real_space.png

convert ribo2.png -bordercolor White    -border 300x300 -resize 1080x1080 png:- | convert  real_space.png - -compose multiply -layers flatten ribo_real_space2.png

convert ribo3.png -bordercolor White    -border 300x300 -resize 1080x1080 png:- | convert  real_space.png - -compose multiply -layers flatten ribo_real_space3.png


convert ribo4.png -bordercolor White    -border 300x300 -resize 1080x1080 png:- | convert  real_space.png - -compose multiply -layers flatten ribo_real_space4.png
 # Video
ffmpeg -loop 1 -t 40 -i 'ribo_real_space%*.png' -framerate 25 -crf 30 -b:v 0 -c:v libvpx-vp9  ribo_video.webm

# Filled Fourier real_space
convert filled.png -bordercolor White    -border 50x50 -resize 1080x1080 png:- | convert  fourier_space.png - -compose multiply -layers flatten filled_fourier_space.png

# Slice in Fourier space
convert -gravity center ../fourier_space.png /tmp/frame0002.png -compose multiply -layers flatten temp/frame0002.png

# SLices for fourier
cp /tmp/0001.png temp.png

for i in {1..19}; do convert -gravity center temp.png \( /tmp/00$(printf "%02d\n" $(( $i + 1 )) ).png -rotate -$(( $i * 3 )) \) -compose multiply -layers flatten temp.png ; done

for i in {1..19}; do convert -gravity center temp.png \( /tmp/00$(printf "%02d\n" $(( $i + 1 )) ).png -rotate $(( $i * 3 )) \) -compose multiply -layers flatten temp.png ; done



