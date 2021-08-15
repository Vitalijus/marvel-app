# Marvel comics

Rails app to show marvel comics.

## Getting Started

These instructions will get you a copy of the project up and running on your
local machine for development and testing purposes.

## Prerequisites

- Install [Ruby](https://www.ruby-lang.org/en/downloads/) 2.6.3p62
- Install [Rails] (https://rubyonrails.org/) 6.0.4

## Installing

Pull the application code from the github repo.

```sh
$ git clone git@github.com:Vitalijus/marvel-app.git
```

Change into the application directory.

```sh
$ cd marvel-app
```

Install dependencies

```sh
$ bundle install
```

## Running the application

Command below will start app, create database, run migration:

```sh
$ rails s
```
Setup Postgres DB

```sh
$ rake db:setup
```

Migrate DB

```sh
$ rake db:migrate
```
### Running app

- Running app: [http://localhost:3000/](http://localhost:3000/).


## Running the tests

Testing is implemented using

- rspec-rails
- vcr

To run the whole test suite

```sh
$ bundle exec rspec
```

To run an individual spec

```sh
$ bundle exec rspec spec/path/to/test
```

## Authors

- **Vitalijus Desukas** - Ruby on Rails Developer
  [Vitalijus](https://github.com/Vitalijus)
