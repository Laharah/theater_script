#Theater script

Starts and stops the "theater" on the mediaserver to be controled by a phone running plex

### Installation

run the make file:

`make install`

By default installs to `/usr/local/bin/theater`. can be overwritten like so:

`make install INSTALLDIR=$HOME/wherever`

### Usage

simply running `theater` will start an instance of chrome all setup for theater mode

To turn off simply run `theater down`

### SSH control

The script is made to be toggled via a locked down ssh key

the key can be genereated like so: 

`ssh-keygen -t rsa -b 2048 -C theaterssh@MEDIASERVER -f theaterssh`

The authorized keys file must then be locked down, since the key will not be encrypted (it is meant to be ran from scripts)

`cat theaterssh >> authorized_keys`

add the following to the beginning of the newly appended key:

`command="/usr/local/bin/theater",no-pty,no-port-forwarding,no-x11-forwarding,no-agent-forwarding ssh-rsa AAAAB3Nz...`

Now the script can be run by simply connecting via ssh to the normal user but using the `theaterssh` key. (`ssh -i theaterssh user@ip`)
