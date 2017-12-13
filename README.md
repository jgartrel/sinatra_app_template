# Sinatra App

This is a sample app designed to be a reference implementation for Bundler
deployment of a Sinatra app, using .rbenv to select ruby versions.  More
details on deploying this app can be found below.

## Preparing the package

* Clone the source
* Ensure .ruby-version is a correct and approved version
* Edit the source and Gemfile as necessary
* Run: 'make install'
* Test it: 'make test'
* Commit Gemfile, Gemfile.lock, and your source changes
* Commit vendor/cache

NOTE: The same proceedure applies for updating the gems in the app.

## Deploying Ruby apps in our build environment

This part of the install will make the project, at a minimum, machine specific, and additionally target specific if any of your gems are native. From within your running job if using CI or on the production server, do the following:

* Checkout project with vendor/cache into workspace
* In the root of the project, inside the workspace, run:

        $ make install-local

## Running the app

Ensure that rbenv is in your path and simply run your app using 'make run', 'bundle exec', or './bin/rackup' from the binstub directory.

    $ make run

or

    $ export PATH=~/.rbenv/shims:~/.rbenv/bin:"$PATH"
    $ ./bin/rackup


## Appendix A: Install rbenv the easier way

Rbenv can be installed using the instructions located here: https://github.com/rbenv/rbenv . You can install rbenv using the following proceedure, with an 'rbenv install' for each approved ruby version.

    $ brew install rbenv
    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    $ rbenv install 2.4.2
    $ echo 2.4.2 >~/.rbenv/version
    $ gem install -v 1.16.0 bundler
    $ rbenv rehash

## Appendix B: Install rbenv the harder way

Rbenv can be installed using the instructions located here: https://github.com/rbenv/rbenv . You can install rbenv using the following proceedure, with an 'rbenv install' for each approved ruby version.

    $ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    $ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    $ export PATH=~/.rbenv/shims:~/.rbenv/bin:"$PATH"
    $ rbenv install 2.4.2
    $ echo 2.4.2 >~/.rbenv/version
    $ gem install -v 1.16.0 bundler
    $ rbenv rehash

Also consider running 'rbenv init' or adding rbenv to your path permanantly. Otherwise you will always need to add the above export path manually to your shell before any of the 'make' or binstub commands previously described in this doc.

    $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
