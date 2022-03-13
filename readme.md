# Docker image for Dedicated Trackmania 2020 Server
## Prerequisites:

 - Working Docker instance
 - Docker compose installed
 - *OPTIONAL: jq installed when using makefile*

## How to use it:

>Recommended way to build image is to using makefile to get latest version of glibc

Clone the repository:



`git clone https://github.com/Vincent-HD/Trackmania2020-dedicated-docker.git`

Once done, rename ``docker-compose.example.yml`` to ``docker-compose.yml``

Edit (not mandatory) the ``docker-compose.yml`` if you want to change the IP, or anything else available

Once done, type :

``docker-compose up -d``

The server should start on port ``2350``

## Custom configuration files

### AT BUILD TIME
For adding your custom config files. You need to add them in this folder, and called them ``<configname>.dedicated_cfg.xml`` and/or ``<configname>.tracklist_cfg.xml``, after doing that, change the two environnement variables in Dockerfile from

``GAME_SETTINGS=tracklist.xml DEDICATED_CFG=dedicated_cfg.xml``

to

``GAME_SETTINGS=<configname>.tracklist_cfg.xml DEDICATED_CFG=<configname>.dedicated_cfg.xml``

Your configurations files will be now copied as default one once the container will first start

### AT RUNNING TIME

Juste edit config files present in ``data/<pathtoconfigpath>``