# README

## Install

### Clone the repository

```bash
git clone https://github.com/shimroz1992/movie_rating.git
cd movie_rating

```

### Check your Ruby version

```bash
ruby -v
```

The output should start with something like `ruby 3.0.0`

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby-3.0.0"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle
```

### Update database.yml file
In database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rails db:create db:migrate
```

### Run rake task to import movies and review

```ruby
rake import:movies
rake import:import_reviews
```

### Start rails server

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000

### Run rspec
In order to run spec run the below command

```bash
rspec
```
