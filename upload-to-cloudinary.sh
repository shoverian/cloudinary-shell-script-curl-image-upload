#!/bin/bash
source ./secrets.sh

# Image upload url
CLOUDINARY_URL="https://api.cloudinary.com/v1_1/${CLOUD_NAME}/image/upload"

# Path to the image file to upload
FILE_PATH="/Users/username/desktop/img/"

# An upload preset can be found or created by going to Settings > Uploads. Make preset unsigned.
UPLOAD_PRESET_NAME="hhzweihw"

# Loop through all jpg files in the directory
for FILE in ${FILE_PATH}/*.jpg
do

  # Copy original file to __bkp folder
  cp "${FILE}" "${FILE_PATH}/__bkp" 

  # Generate a timestamp for the signature
  TIMESTAMP=$(date +%s)

  # Generate the signature using the timestamp and API secret
  SIGNATURE=$(echo -n "${TIMESTAMP}${API_SECRET}" | shasum | awk '{print $1}')

  # Send the POST request to Cloudinary with the image data as the payload
  curl --request POST \
  --url "${CLOUDINARY_URL}" \
  --header "content-type: multipart/form-data" \
  --header "X-Cloudinary-API-Key: ${API_KEY}" \
  --header "X-Cloudinary-Timestamp: ${TIMESTAMP}" \
  --header "X-Cloudinary-Signature: ${SIGNATURE}" \
  -F "file=@${FILE}" \
  -F "upload_preset=${UPLOAD_PRESET_NAME}"

  # Process each file using a command
  echo "Processing ${FILE}"

  # Delete copied file once uploaded
  rm "${FILE}" 

done