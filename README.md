# Welcome to the Receipt Management System App<br />
by Aleksander Gosk

## About the Project

Receipt Management System is an app made for the <a href="http://www.pja.edu.pl/">Polish and Japanese Academy of Computer Technologies</a> as part of the Engineering thesis.<br />
<br />The main concept of the application is to enable making complaints (based on a receipt you get from a shop) by the users about the products they bought in a particular shop, as well as giving feedback about the complaint process.

## Getting started

(If you want to use the search Shops functionality):

Install the <a href="https://www.elastic.co/guide/en/elasticsearch/reference/current/setup.html">Elastic Search service</a>

Download from github

```console
git clone https://github.com/beliar91/Receipt-Management-System
```
Run the bundle install command to install all the gems on your local machine.

Creating the database:

1. If you want to use PostgreSQL on your local machine:<br />
a) Install <a href="https://gorails.com/setup/ubuntu/15.10#postgresql">PostgreSQL</a><br />
b) Edit the file located in config/database.yml to match your own credentials<br />
c) Run the following command:<br />

    ```console
    rake db:create
    ```

2. If you want to use SQLite on your local machine:<br />
a) Edit your config/database.yml file to use SQLite so it looks like <a href="https://gist.github.com/danopia/940155">this</a><br />
b) Edit your Gemfile so it looks like this:<br />
```console
gem 'sqlite3'
gem 'pg', group: :production
```

After creating the database, run the following command:

```console
rake db:migrate
```

(Optional) For generating fake data use:

```console
rake db:seed
```

## FAQ

1. How can I get into the admin panel?<br />
a) Make sure the user you are currently logged in has the admin attribute set to true.<br />
b) Enter <a href="http://localhost:3000/admin">The Admin panel</a><br />

2. Why can't I make any complaint reviews?<br />
Before making a complaint review, an admin user must accept the particular review in the admin panel.


## Live demo:

<a href="http://receipt-managing-system.herokuapp.com/">Receipt Management System</a>

## What's next?

-Add test coverage (using Rspec/Capybara/FactoryGirl)<br />
-Add I18N support<br />
-Add facebook,twitter, google+ registration/signing up<br />