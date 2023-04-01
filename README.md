# Cloudinary Shell Script - Image Upload

Shell script to upload images using the Cloudinary API + cURL.

## General Workflow

- Image is added to designated folder
- Image is copied to `../__bkp` within designated folder
- Image is uploaded to Cloudinary via API using cURL
- Original image is deleted

## Getting started

1. Create a [Cloudinary account](https://cloudinary.com/users/register_free)
2. The information for the `secrets.sh` can be accessed from your Dashboard once you log in to Cloudinary.
3. Update the following variables with your details.
  
  In `secrets.sh`
  - `CLOUD_NAME`
  - `API_KEY`
  - `API_SECRET`

  In `upload-to-cloudinary.sh`
  - `FILE_PATH`
  - `UPLOAD_PRESET_NAME`
  - Optional: File type (currently only .jpg in `FILE_PATH`)

4. Designate a folder you will use to hold images you want to upload to Cloudinary. Add the `secrets.sh` and `upload-to-cloudinary.sh` to that directory.
5. Create a `/__bkp` directory in the designated directory to hold copies of original images.

## Optional. Use .gitignore if using git.
Friendly reminder to add `secrets.sh` to `.gitignore` if using Git.

## Run script
`./upload-to-cloudinary.sh`
