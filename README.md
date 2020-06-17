# coreos_installation_iso

This image is a tool to create a coreOS image with a passed ignition file.
The output of the container is a ISO live CD image that will be uploaded to s3 of your choice.

Building an livecd image:
* use Dockerfile.livecd-iso-image to create an container image that will store the LIVECD ISO that we are going to use. Pushed to some accessible repository

Building a builder image:
* in the Dockerfile , update the first line to point to the LIVECD ISO image that you want to use ( the one you built in the previous stage)
* Build the docker image and push to you registry

### Using the image:
the parameters are passed to the image via env vars, 
to build a image the passed params are:
```
IGNITION_CONFIG : the ignition.conf file 
IMAGE_NAME      : the name of your choice for the image
S3_BUCKET       : s3 bucket where the image will be uploaded (default: test)
S3_ENDPOINT_URL : s3 endpoint url

aws_access_key_id   
aws_secret_access_key
```
