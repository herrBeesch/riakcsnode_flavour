riakcsnode_flavour
==================

an ezjail (FreeBSD) flavour to create new jails for additional riakcs nodes

This script could be helpful assuming

- you have an already set up node with admin credentials (riak, riak-cs, stanchion)
- you're using jails for different riak-cs nodes
- you're using ezjail to manage your jail

If so, then, this is a flavour for ezjail to create a new jail with all necessary dependencies and riak-cs 1.4.2

How to use it:

on your host machine 

`cd /usr/jails/flavours`

clone this repo into "riakcsnode"

`git clone https://github.com/herrBeesch/riakcsnode_flavour.git riakcsnode`

change 3 parameters in `/usr/jails/flavours/riakcsnode/usr/local/share/riak-cs/app.config` :

`YOUR_STACHION_IP` to the ip address of your stanchion

`YOUR_ADMIN_KEY` to the key of your admin user

`YOUR_ADMIN_SECRET` to the secret of your admin user

create your jail using this flavour (use your jailname and your ip)

`ezjail-admin create -f riakcsnode yourjailname.yourdomain 10.5.1.120`

start it 

`ezjail-admin start yourjailname.yourdomain`

done




