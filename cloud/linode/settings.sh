#!/usr/bin/env bash

# Export vars is required for envsubst to work

# Change this to reference your game server. Defaults to CS GO. Full list at https://github.com/GameServerManagers/LinuxGSM/blob/master/lgsm/data/serverlist.csv
export terra_gameserver="csgoserver"

# LinuxGSM Repo Settings. Change these to reference your repo and branch if you are making development changes
export terra_githubuser="GameServerManagers"
export terra_githubrepo="LinuxGSM"
export terra_githubbranch="develop" # See https://github.com/GameServerManagers/LinuxGSM/issues/2177

# This script will automatically generate a new ED25519 public/private key - If you don't know what this is, then it's worth a read as it's quick and secure
# If you have your own public/private certificate (RSA, ED25519, etc) then configure the location here.
export terra_privatekeylocation="id_ed25519"
export terra_publickeylocation="${terra_privatekeylocation}.pub" # Changing this will likely break the script!

# Linode API key location - Version 4 (cloud.linode.com)
export terra_linodeapikeyfile="./.linodeapikey"

# You don't have to change these settings unless you want to
export terra_linodeimage="linode/ubuntu18.04"
export terra_linodelabel="LinuxGSM-Terraform"
export terra_linodegroup="LinuxTerraform"
export terra_linoderegion="us-east"
export terra_linodetype="g6-standard-1" #See https://api.linode.com/v4/linode/types - highly recommended to improve this for demanding game servers, and lower this to keep within the free trial!