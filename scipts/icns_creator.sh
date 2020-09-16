#!/bin/bash
# Creates an icns file from a source image

# based on https://github.com/jamf/icns-Creator

# How to use this script
# icns_creator.sh takes a path to an image file as an 
# argument and outputs the converted PNGs and final .icns file 
# into the directory it is run from. You may optionally pass a name for 
# the .icns file as a second parameter (defaults to 'iconbuilder').

# ~$ bash icns_creator.sh /path/to/source.png [icon_name]
# If the source image is not a PNG, the script will attempt to convert it. 
# It is also recommended that your source image be 1024x1024 or higher resolution. 
# Lower resolution icons will look pixelated when upscaled.
echo "____________HOLD ON SOLDIER!__________________"

src_image="../assets/icons/icon_1024x1024.png"
icns_name="wild-words"

if [ "${src_image:(-3)}" != "png" ]; then
    echo "Source image is not a PNG, making a converted copy..."
    /usr/bin/sips -s format png "$src_image" --out "${src_image}.png"
    if [ $? -ne 0 ]; then
        echo "The source image could not be converted to PNG format."
        exit 1
    fi
    src_image="${src_image}.png"
fi

iconset_path="./${icns_name}.iconset"
if [ -e "$iconset_path" ]; then
    /bin/rm -r "$iconset_path"
    if [ $? -ne 0 ]; then
        echo "There is a pre-existing file/dir $iconset_path the could not be deleted"
        exit 1
    fi
fi

/bin/mkdir "$iconset_path"

icon_file_list=(
    "icon_16x16.png"
    "icon_16x16@2x.png"
    "icon_32x32.png"
    "icon_32x32@2x.png"
    "icon_128x128.png"
    "icon_128x128@2x.png"
    "icon_256x256.png"
    "icon_256x256@2x.png"
    "icon_512x512.png"
    "icon_512x512@2x.png"
    )

icon_size=(
    '16'
    '32'
    '32'
    '64'
    '128'
    '256'
    '256'
    '512'
    '512'
    '1024'
    )

counter=0    
for a in ${icon_file_list[@]}; do
    icon="${iconset_path}/${a}"
    /bin/cp "$src_image" "$icon"
    icon_size=${icon_size[$counter]}
    /usr/bin/sips -z $icon_size $icon_size "$icon"
    counter=$(($counter + 1))
done

echo "Creating .icns file from $iconset_path"
/usr/bin/iconutil -c icns "$iconset_path"
if [ $? -ne 0 ]; then
    echo "There was an error creating the .icns file"
    exit 1
fi

iconutil -c icns wild-words.iconset/
rm -rf wild-words.iconset/

cp wild-words.icns ../assets/icons/.
rm -rf wild-words.icns

echo "_______________MISSON COMPLETED!__________________"
exit 0