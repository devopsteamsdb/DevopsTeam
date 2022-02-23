
### Build ###
create folder on your computer and put this 3 files in the folder
* Dockerfile
* plugins
* default-user.groovy

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

#### DockerFile ####
v1 - is the first version we use and it include auto setup for admin user
if you want to use, remove the _V* from the end of the file. (the file name have to be Dockerfile)

#### plugins ####
v2 - seconds plugins file for jenkins
v1 - is the first version we use, the new file is with updates plugins for jenkins 2.320

