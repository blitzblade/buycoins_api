# README

# BITCOIN PRICE API

API that that calculates the price to sell/buy bitcoin in Naira.

## What you need

- [Ruby](https://www.ruby-lang.org/en/): This project uses `Ruby v 2.6.6`, I try to stay on the latest stable or releast candidate version. I recommend [rbenv](https://github.com/rbenv/rbenv) for ruby version management but feel free to use what works for you.

- [Bundler](https://rubygems.org/gems/bundler/versions/1.16.2): You can grab the latest version of the bundler by running `gem install bundler`. You will need this to grab all the dependencies of the application.

- [Git](https://git-scm.com): I use [Git](https://git-scm.com) and [GitHub](https://github.com) for version control and collaboration.
  If you don't have a [GitHub](https://github.com) account already you can create one [here](https://github.com/join).
  Follow instructions [here](https://git-scm.com/downloads) to install the latest version of Git for

## Project Setup

First things first, Clone this repository on your computer with the following command: `git clone https://github.com/blitzblade/buycoins_api.git`

### Direct Setup

1. Run `bin/setup` to grab all the dependencies and setup the project.
2. Contact administrator to get environment variables and paste them into `config/application.yml`
3. Run `bin/server` to start the application on [http://localhost:5000](http://localhost:5000).

I use Rubocop for static code analysis of our Ruby code and Rspec for testing models & controllers. To execute the test suite, run `bin/test`.
