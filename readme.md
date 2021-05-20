# Docker image for Dedicated Trackmania 2020 Server
## Prerequisites:

 - Working Docker instance
 - Docker compose installed

## How to use it:

Clone the repository:



`git clone https://github.com/Vincent-HD/Trackmania2020-dedicated-docker.git`

Once done, rename ``docker-compose.example.yml`` to ``docker-compose.yml``

Edit (not mandatory) the ``docker-compose.yml`` if you want to change the IP, or anything else available

Once done, type :

``docker-compose up -d``

The server should start on port ``2350``

## Edit configuration files

You can edit ``dedicated_cfg.default.xml`` or/and ``tracklist.default.xml`` (❗ Before building the image ❗)

Or after starting the server you can stop it, and edit the files that has been generated in your current directory (under ``data/UserData/Config`` and ``data/UserData/Maps/MatchSettings``)