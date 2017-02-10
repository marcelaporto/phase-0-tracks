## Prior Study I need to do

* https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
* https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean
* https://www.digitalocean.com/community/tutorials/additional-recommended-steps-for-new-ubuntu-14-04-servers
* https://www.digitalocean.com/community/tutorials/5-common-server-setups-for-your-web-application


* https://learnrubythehardway.org/book/ex51.html
* https://learnrubythehardway.org/book/ex52.html
* http://ruby.about.com/od/sinatra/a/sinatra2.htm
* https://www.packtpub.com/books/content/building-tiny-web-applications-ruby-using-sinatra
* http://www.sinatrarb.com/intro.html
* http://guides.railsgirls.com/sinatra-app
* https://www.sitepoint.com/just-do-it-learn-sinatra-i/
* http://www.sinatrarb.com/configuration.html


## How the Web Works


1. Getting Input from a Browser
On the ruby file: create a post method
On the HTML: create a form

2. Creating a View Template
As programmers we have to find common patterns and try to automate them away. One common pattern is the HTML that is at the beginning and the end of each of our .erb files. You shouldn't have to type that every single time you want to create a new view, and you should be able to change that content in one place to change all the pages. The solution to this is a concept called a "layout template", which we'll create in views/layout.erb:

```
<html>
<head>
    <title>Gothons From Planet Percal #25</title>
</head>
<body>

<%= yield %>

</body>
</html>
```
This simply takes the common HTML at the top and bottom of every template and puts it into one file. The code <%= yield %> is a Ruby thing that says to stop there and run the other view then come back.

## Using Sinatra in Ruby

Sinatra is not a framework but a library i.e. a set of classes that allows you to build almost any kind of web-based solution (no matter what the complexity) in a very simple manner, on top of the abstracted HTTP layer it implements from Rack. When you code in Sinatra you’re bound only by HTTP and your Ruby knowledge. Sinatra doesn’t force anything on you, which can lead to awesome or evil code, in equal measures.

## Inline Templates

1. Install de slim gem: `gem install slim`
2. Create inline tmeplates. Ex:

```
require 'sinatra' 
require 'slim'

get '/' do 
  slim :index 
end

__END__

@@layout 
doctype html 
html
  head 
    meta charset="utf-8" 
    title Just Do It 
    link rel="stylesheet" media="screen, projection" href="/styles.css" 
    /[if lt IE 9] 
      script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" 
  body 
    h1 Just Do It 
    == yield 

@@index 
h2 My Tasks
ul.tasks
  li Get Milk

```

This is an example of Sinatra’s inline templates, something I consider to be a killer feature as it allows you to keep all your code in the same file – perfect for putting things together quickly. Inline templates always come after the __END__ declaration, and each template begins with @@.

I’ve also included a template called ‘@@layout’. This will automatically be rendered with every view and provides a basic HTML5 scaffolding. The key line in the layout template is right at the end (==yield). The yield statement renders the content from the whichever template was requested by the handler (in this case, ‘index’).

Both of these views use Slim’s minimal syntax. I find this makes writing HTML a much more pleasant experience, but be warned – Slim is white-space sensitive. Indentations of 2 spaces are used to nest elements within each other and Slim is very strict about this being consistent.

## Why is it considered a bad idea to run programs as the root user on a Linux system?

You're logged as root = all applications are running with root privilegies -- every vulnerability in Firefox, Flash, OpenOffice etc. now can destroy your system, because possible viruses now have access everywhere. Yes, there are only few viruses for Ubuntu/Linux, but it's also because of good security and default unprivileged user.

* Stupidity: Nothing prevents you from doing something stupid. If you try to change the system in anyway that could be harmful you need to do sudo which pretty much guarantees a pause while you are entering the password for you to realize that you are about to make a possible big/costly change.

* Security: It has been mentioned already quite a few times in this question but basically it's the same thing, harder to hack if you dont know the admin user's login account. root means you already have one half of the working set of admin credentials.

* You don't really need it: If you need to run several commands as root and you are annoyed by having to enter your password several times when sudo has expired all you need to do is sudo su - and you are now root. Want to run some commands using pipes? Then use sudo sh -c "comand1 | command2".

* You can always use it in the recovery console: The recovery console allows you to try and recover from doing something stupid or fixing a problem caused by an app (which you still had to run as sudo :)) Ubuntu doesn't have a password for the root account in this case but you can search online for changing that, this will make it harder for anyone that has physical access to your box to be able to do harm.

#### So, How To Add and Delete Users on an Ubuntu 14.04 VPS?

I f you are signed in as the root user, you can create a new user at any time by typing: `adduser newuser`

