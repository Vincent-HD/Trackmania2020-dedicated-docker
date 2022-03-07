#!/bin/sh
dedicated_cfg_dir="UserData/Config"
dedicated_cfg_path="${dedicated_cfg_dir}/${DEDICATED_CFG}"
customconf_dir="/customconf"
defaultconf_dir="/defaultconf"
game_settings_dir_path="UserData/Maps/MatchSettings"
game_settings_path="$game_settings_dir_path/${GAME_SETTINGS}"

mkdir -p  UserData/Config UserData/Maps/MatchSettings UserData/Maps/MatchSettings UserData/Maps/Campaigns UserData/Maps/Downloaded

if [[ -z "${SERVER_IP}" ]]; then
    printf "Server ip not configured, getting public IP ...\n"
    export SERVER_IP=$(curl ifconfig.me)
    printf "Public IP is: %s\n" ${SERVER_IP}
fi

if [[ ! -f "$dedicated_cfg_path" ]]; then
    printf "Missing file %s\n" "$dedicated_cfg_path"
    if [[ -f "${customconf_dir}/${DEDICATED_CFG}" ]]; then
        printf "Found custom dedicated config file, copying ...\n"
        cp ${customconf_dir}/${DEDICATED_CFG} $dedicated_cfg_path
    else
        printf "Copying default config file\n"
        cp /defaultconf/dedicated_cfg.default.txt $dedicated_cfg_path
    fi
fi

if [[ ! -f "$game_settings_path" ]]; then
    printf "Missing file %s\n" "$game_settings_path"
    if [[ -f "${customconf_dir}/${GAME_SETTINGS}" ]]; then
        printf "Found custom tracklist config file, copying ...\n"
        cp ${customconf_dir}/${GAME_SETTINGS} $game_settings_path
    else
        printf "Copying default config file\n"
        cp /defaultconf/example.txt $game_settings_path
    fi
fi

printf '===========================\n\n'
printf "Starting Trackmania with public IP: '%s'\nMatchSettings file: '%s'\nDedicated config file: '%s'" ${SERVER_IP} $game_settings_path $dedicated_cfg_path
printf '\n\n===========================\n'

./TrackmaniaServer /nodaemon /title="${TITLE}" /game_settings="Matchsettings/${GAME_SETTINGS}" /dedicated_cfg="${DEDICATED_CFG}"