#!/usr/bin/env sh

# Read settings.sh file. For now we'll assume everything is set up correctly
. settings.sh

# Check that the API key file exists. Warn user if it does not
if [[ ! -f ${terra_linodeapikeyfile} ]]; then
    echo "Linode API Key file is required. Please create the file ${terra_linodeapikeyfile} and enter the Linode API key in a single line"
    exit 1
elif [[ $(wc -l <${terra_linodeapikeyfile}) -ne 1 ]]; then
    echo "The file ${terra_linodeapikeyfile} must be a single line containing the Linode API key. Please check and try again"
    exit 1
fi

# Read API file content to var
export linodeapikey=`cat ${terra_linodeapikeyfile}`

# Check to see if public and private key exists
if [[ ! -f ./${terra_privatekeylocation} ]]; then
    echo "Private key ${terra_privatekeylocation} does not exist. Generating new private and public key. Please use this key to connect to the server over SSH"
    echo "The certificate does not have a passphrase - do not check into version control and treat it like a password!"
    ssh-keygen -a 100 -t ed25519 -N '' -f ./${terra_privatekeylocation}
    sleep 2

else
    echo "Using private key ${terra_privatekeylocation}.\n"
    sleep 2
fi

# Perform variable replacement on terraform template
envsubst < linode.tf.template > linode.tf

#remove sensitive information from export var
unset linodeapikey
terraform init
terraform apply