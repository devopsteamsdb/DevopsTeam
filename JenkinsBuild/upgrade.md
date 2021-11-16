### Upgrade jenkins docker image and plugins ###
* build docker image
* ceate jenkins_home_staging folder
* sync jenkins_home to jenkins_home_staging
* import jenkins image ( akk servers )
* create temp folder /abc
* start new jenkins image on diffrent port then production and mout temp folder as /abc
* see jenknis working
* copy all plugins from new jenkins into temp folder
* shut down the new jenkins
* shut down old jenkins
* delete plugins from old jenkins
* copy temp folder plugins into jenkind home folder
* change compose yaml to load jenkins new image
* start compose
* wait 5 - 10 min for jenknis to start
* remove old images from server
* remove temp folder /abc
* remove jenkins_home_staging
* Done.
