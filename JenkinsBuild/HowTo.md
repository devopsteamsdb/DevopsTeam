### Build ###
from the folder where we have all the 3 files we run this:
docker build . -t itamartz/jenkins:centos

### Run - Create container from the image we build ###
docker run \
  --name jenkins-blueocean \
  --rm \
  --detach \
  --network jenkins \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  itamartz/jenkins:centos
