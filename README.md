# Theater script

Starts and stops a plex web instance on chrome on a mediaserver to be controled by a phone running plex.

### Installation

run the make file:

`make install`

By default installs to `/usr/local/bin`. can be overwritten like so:

`make install INSTALLDIR=$HOME/wherever`

### Usage

simply running `theater` will start an instance of chrome all setup for theater mode.

To turn off simply run `theater down`.

### SSH control

The script is made to be toggled via a locked down ssh key.

the key can be genereated like so: 

`ssh-keygen -t rsa -b 2048 -C theaterssh@MEDIASERVER -f theaterssh`

The authorized keys file must then be locked down, since the key will not be encrypted (it is meant to be ran from scripts).

`cat theaterssh >> authorized_keys`

add the following to the beginning of the newly appended key to lock it down securely:

`command="/usr/local/bin/theater",no-pty,no-port-forwarding,no-x11-forwarding,no-agent-forwarding ssh-rsa AAAAB3Nz...`

Now the script can be run by simply connecting via ssh to the normal user but using the `theaterssh` key. (`ssh -i theaterssh user@ip`).


### Tasker integration

To control everything from a phone, you will need Tasker with an SSH plugin or another automation program and the Plex app.

Included is an [importable Tasker task](https://github.com/Laharah/theater_script/blob/master/Theater_Toggle.tsk.xml) that can be used to toggle the "theater". However you can write you own by following the instructions below.

1. install the script and configure a locked down ssh key as above.

2. Create a new task in tasker.

3. create an if statment (task > if) which checks if %THEATER variable is set to 1.

4. add an ssh plugin action configured to your ssh user@ip with your locked-down sshkey and the command `none`.

4. Add an application action to launch plex (App > Launch app > Plex).

5. add an action to set the variable %THEATER to 1 (Variables > Variable Set).

6. Add an else clause (task > else).

7. Copy and paste the above ssh action and change the command to `down`.

8. Add an action to set the variable %THEATER to 0.

Finally you can add a tasker event widget to your homescreen called "Theater" to get an icon you can press to toggle your home theater!
