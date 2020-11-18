#!/bin/bash
SCAN_DIR=/path_to_image_folder
CORRUPTED_FILES_DIR=/path_to_corrupted_images_folder
LOG_FILE=/var/log/broken_pictures.log
#do not modify below

if grep -qs '/mnt/500gb' /proc/mounts; then
    echo "Drive is mounted."
else
    echo "Drive not mounted. Mounting drive"
    mount /mnt/500gb
    if [ $? -eq 0 ]; then
       echo "Mount success!"
    else
       echo "Something went wrong with the mount..."
    exit
    fi
fi
#all ok, can continue

if [ ! -d $CORRUPTED_FILES_DIR ] 
then
    mkdir $CORRUPTED_FILES_DIR
fi

#do not modify below
find $SCAN_DIR -iregex '.*\.\(jpg\|gif\|png\|jpeg\|dmg\)$' | while read FILE; do
    if ! identify "$FILE" &> /dev/null; then
        FILENAME=$(basename -- "$FILE")
        MOVE_PATH="${CORRUPTED_FILES_DIR}/$(date +"%m_%d_%y_%H_%M_%S")_${FILENAME}"
        echo  "${FILE}"  >> $LOG_FILE
        mv "${FILE}" $MOVE_PATH -f
    fi
done
