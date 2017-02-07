## Web Servers - Concepts

1. What are some of the key design philosophies of the Linux operating system?

Quote from the section Introduction of the Unix philosophy of the book Linux and the Unix Philosophy, by Mike Gancarz: An operating system, by its nature, embodies the philosophy of its creators... The creators of the Unix operating system started with a radical concept: they assumed that the user of their operating system would be computer literate from the start. The entire Unix philosophy revolves around the idea that the user knows what he or she is doing.

So, Unix was not designed to stop its users from doing stupid things, as that would also stop them from doing clever things.
Therein lies the truth about Linux. It never assumes that the user is incompetent. It always assumes you know what you are doing and allows you do do anything you tell it to. Other operating systems are elitist and exclusive because they withhold or hide their power behind an inflexible Graphical User Interface that allows one to do only what the developers think we should be allowed to do.

Oregon State University has their own take on the Linux Philosophy:
	* The user should know better…..so (s)he must specify how things work.
	* Provide mechanisms, not policy
		* Mechanism: long life time
		* Policy: short life time
	* Linux provides a large set of simple tools…
		* which can be connected with well specified interfaces…
		* which are usually textual data streams.
	* Resist and be creators of new things

Unix Philosophy
The Unix philosophy, originated by Ken Thompson, is a set of cultural norms and philosophical approaches to minimalist, modular software development. Early Unix developers were important in bringing the concepts of modularity and reusability into software engineering practice, spawning a "software tools" movement. The Unix philosophy emphasizes building simple, short, clear, modular, and extensible code that can be easily maintained and repurposed by developers other than its creators.

The UNIX philosophy is documented by Doug McIlroy in the The Bell System Technical Journal from 1978:
* Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new "features".
* Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information. Avoid stringently columnar or binary input formats. Don't insist on interactive input.
* Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.
* Use tools in preference to unskilled help to lighten a programming task, even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.

Later summarized by Peter H. Salus in A Quarter-Century of Unix (1994):[1] This is the Unix philosophy:
1. Write programs that do one thing and do it well.
2. Write programs to work together.
3. Write programs to handle text streams, because that is a universal interface.

There are nine major tenets to the Linux philosophy.

1. Small is Beautiful
2. Each Program Does One Thing Well
3. Prototype as Soon as Possible
4. Choose Portability Over Efficiency
5. Store Data in Flat Text Files
6. Use Software Leverage (Good programmers write good code and great programmers borrow good code. Never rewrite code that has already been written.)
7. Use Shell Scripts to Increase Leverage and Portability
8. Avoid Captive User Interfaces
9. Make Every Program a Filter (That is each command will take an input, usually from Standard Input, and “filters” the data stream by making some change to it, then sends the resulting data stream to Standard Output.)

2. In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a    VPS?
A VPS is like a fraction of a server. So its basically a virtual machine that answers to the users needs like a computer, sold as a service in the internet. The server actually exists, and you share it with another number of VPSs from other users. 

It is good since it is much more cheaper to use (the analogy I found was that a server is a building and a VPS is a single loft. You don't need a building and it costs a lot, but a single loft is affordable and exactly what you need). YOu can also update your data on the spot (don't need to do data imigration), which makes VPS more scalable. You can also choose your own operating system. 

https://blog.servermania.com/the-5-major-benefits-of-using-a-virtual-private-server/

3. Why is it considered a bad idea to run programs as the root user on a Linux system?

You're logged as root = all applications are running with root privilegies -- every vulnerability in Firefox, Flash, OpenOffice etc. now can destroy your system, because possible viruses now have access everywhere. Yes, there are only few viruses for Ubuntu/Linux, but it's also because of good security and default unprivileged user.

* Stupidity: Nothing prevents you from doing something stupid. If you try to change the system in anyway that could be harmful you need to do sudo which pretty much guarantees a pause while you are entering the password for you to realize that you are about to make a possible big/costly change.

* Security: It has been mentioned already quite a few times in this question but basically it's the same thing, harder to hack if you dont know the admin user's login account. root means you already have one half of the working set of admin credentials.

* You don't really need it: If you need to run several commands as root and you are annoyed by having to enter your password several times when sudo has expired all you need to do is sudo su - and you are now root. Want to run some commands using pipes? Then use sudo sh -c "comand1 | command2".

* You can always use it in the recovery console: The recovery console allows you to try and recover from doing something stupid or fixing a problem caused by an app (which you still had to run as sudo :)) Ubuntu doesn't have a password for the root account in this case but you can search online for changing that, this will make it harder for anyone that has physical access to your box to be able to do harm.

#### So, How To Add and Delete Users on an Ubuntu 14.04 VPS?

I f you are signed in as the root user, you can create a new user at any time by typing: `adduser newuser`