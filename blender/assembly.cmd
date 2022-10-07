# Movie filling the fourier space
for a in {1..1000}; do convert -gravity center frame$(printf "%04d\n" $a).png \( 0001.png -rotate $( printf '%s\n' $(echo "scale=8; $RANDOM/91" | bc ) ) \) -compose multiply -layers flatten frame$( printf "%04d\n" $(( $a + 1 )) ).png; done


# Ribosome in realspace box
convert ribo.png -bordercolor White    -border 0x0 -resize 1080x1080 png:- | convert  real_space.png - -compose multiply -layers flatten ribo_real_space.png

# Filled FOurier real_space
convert filled.png -bordercolor White    -border 50x50 -resize 1080x1080 png:- | convert  fourier_space.png - -compose multiply -layers flatten filled_fourier_space.png




