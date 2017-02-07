## Prior Study I need to Do

* https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
* https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean
* https://www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-ubuntu-14-04-servers
* https://www.digitalocean.com/community/tutorials/5-common-server-setups-for-your-web-application

 Why is it considered a bad idea to run programs as the root user on a Linux system?

You're logged as root = all applications are running with root privilegies -- every vulnerability in Firefox, Flash, OpenOffice etc. now can destroy your system, because possible viruses now have access everywhere. Yes, there are only few viruses for Ubuntu/Linux, but it's also because of good security and default unprivileged user.

* Stupidity: Nothing prevents you from doing something stupid. If you try to change the system in anyway that could be harmful you need to do sudo which pretty much guarantees a pause while you are entering the password for you to realize that you are about to make a possible big/costly change.

* Security: It has been mentioned already quite a few times in this question but basically it's the same thing, harder to hack if you dont know the admin user's login account. root means you already have one half of the working set of admin credentials.

* You don't really need it: If you need to run several commands as root and you are annoyed by having to enter your password several times when sudo has expired all you need to do is sudo su - and you are now root. Want to run some commands using pipes? Then use sudo sh -c "comand1 | command2".

* You can always use it in the recovery console: The recovery console allows you to try and recover from doing something stupid or fixing a problem caused by an app (which you still had to run as sudo :)) Ubuntu doesn't have a password for the root account in this case but you can search online for changing that, this will make it harder for anyone that has physical access to your box to be able to do harm.

#### So, How To Add and Delete Users on an Ubuntu 14.04 VPS?

I f you are signed in as the root user, you can create a new user at any time by typing: `adduser newuser`

