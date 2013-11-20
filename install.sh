#!/bin/sh

function usage
{
    echo "usage: install.sh -k admin_key -s admin secret -i stanchion_ip | -h" >&2
}

admin_key= 
admin_secret=
stanchion_ip=

while getopts "k:s:i:" opt; do
    case $opt in
        k)  admin_key=$OPTARG 
            continue
            ;;
        s)  admin_secret=$OPTARG  
            continue
            ;;
        i)  stanchion_ip=$OPTARG  
            continue
            ;;
        h)  usage
            exit
            ;;
        \?) echo "Invalid option: -$OPTARG" >&2
            usage
            exit
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            exit 1
            ;;
    esac
done

cp /etc/resolv.conf /usr/jails/flavours/riakcsnode/etc/resolv.conf

mv usr/local/share/riak-cs/app.config usr/local/share/riak-cs/app.config.save
cat usr/local/share/riak-cs/app.config.save | sed s/YOUR_ADMIN_KEY/`echo $admin_key`/g | sed s/YOUR_ADMIN_SECRET/`echo $admin_secret`/g | sed s/YOUR_STANCHION_IP/`echo $stanchion_ip`/g > usr/local/share/riak-cs/app.config

mkdir -p /usr/jails/flavours/riakcsnode/pkg
rm -rf /usr/jails/flavours/riakcsnode/.git