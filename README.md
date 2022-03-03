# Free GitLab local server using docker compose

Sometimes one is not allowed to, or just don't feel comfortable, putting code into the cloud. However, you still want some way of managing your Git repos locally in the style of GitHub or BitBucket. If that's the case I have a solution for you.

This repo contains a docker compose script to set up a local instance of GitLab server. It’s an alternative to GitHub able to run locally for free and is very easy to set up. The script was tested on Linux and Windows but should work on any platform able to run Docker.

Thanks for reading this. My socials are:

https://phicygni.com/

https://github.com/PhiCygni

https://medium.com/@emileross

https://twitter.com/PhiCygni

https://www.facebook.com/PhiCygni/

# Follow these steps to set up GitLab locally

Check out the repo:

    $ git clone https://github.com/PhiCygni/gitlab-free-local-server-using-docker-compose.git

&nbsp;

Get the local hostname of the machine you want to run GitLab on:

    $ hostname

&nbsp;

Modify the ```.env``` file with a text editor and change the  ```localhost``` value to your local hostname. For example:

    GITLAB_HOSTNAME=mydesktop

&nbsp;

Build the container and start it:

    $ docker-compose up

&nbsp;

While it's building and starting up open another terminal to the same directory and run the command:

    $ docker-compose ps

This command will report on the current state of the container. Wait until the **```State```** column reports the container to be **```Up (health: healthy)```** and not **```Up (health: starting)```**. This might take about **5 minutes so be patient!** This is how we know the building of the container is completed and is ready to be used.

&nbsp;

Now retrieve the newly created GitLab root password:

    Linux: $ sudo cat ./config/initial_root_password

    Windows: $ type .\config\initial_root_password

Example output:

    Password: zsFHw3SpgwSTal1+Ufiurw4DaghDIcKlVy+MUctmxwE=

**Make sure to write this root password down somewhere because GitLab will delete it in time!**

&nbsp;

One can now access the GitLab UI using URL ```http://MY_HOSTNAME:7080/```. For instance if the hostname is ```mydesktop``` then the URL is https://mydesktop:7080. The username is ```root``` and we just found the password in the step above. Log in as ```root``` to get started.


Note: URL http://localhost:7080/ will also work to access the server, but the local hostname will be required if one wants to access the server from another computers on the local LAN.

&nbsp;

# Configuring your GitLab server after it is set up

Your GitLab container is now running and you can access the UI. Now do the following to start using it:

1. Log in with the root account and for security reasons make a new user with admin rights and use it for everyday admin tasks. The root account should only be used when needed. It should also the noted the root account can only be used using localhost access and remote access is not allowed. Therefore creating another admin user is probably for the best.
2. Configure your firewall to open up port ```TCP 7080``` if access to other LAN computers is required.

# Using GitLab with a SSL certificate

It is very possible to generate a SSL certificate for GitLab so that HTTPS can be used instead of just HTTP. One can generate a Certificate Authority and then add it to all computers on the LAN so that the server can be accessed using a HTTPS connection with a verified certificate. If I get enough stars and comments on this repo I will endeavour to expand this repo to incorporate the configuration of verified HTTPS access.

# Steps to completely remove the GitLab container

**Note! The following steps will completely remove the GitLab container and all its repos!** 

You will only want to do this if you want to do fresh install for some reason or just don't need the container anymore. If that's the case do the following to remove the container, repos and its config files: 

    Linux: $ ./script-docker-compose-down-remove-everything.sh

    Windows: $ script-docker-compose-down-remove-everything.bat


# Thanks for reading!

My socials are:

https://phicygni.com/

https://github.com/PhiCygni

https://medium.com/@emileross

https://twitter.com/PhiCygni

https://www.facebook.com/PhiCygni/