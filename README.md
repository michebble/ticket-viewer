# Zendesk Ticket Viewer

A basic command line ticket viewer for the Zendesk API, written in Ruby.

The purpose of this ticket viewer is to:
* Connect to the Zendesk API
* Request all the tickets for your account
* Display them in a list
* Display individual ticket details
* Page through tickets when more than 25 are returned

## Requirements

- This project is using `ruby 2.4.1` or greater. [Installation instruction here](https://www.ruby-lang.org/en/documentation/installation/). Current version of Ruby can be checked:

```bash
$ ruby -v
```

- For testing, install Bundler:

```bash
$ gem install bundler
```

### Installation
- Clone repository to your local machine:

```bash
$ git clone https://github.com/michebble/ticket-viewer.git
```

- Install required gems by running bundle install:

```bash
$ bundle install
```

### Testing
- Run tests from the app directory:

```bash
$ rspec
```

### Usage
- Run the app from the app directory:

```bash
$ ruby app.rb
```

The app will automatically call the api and request all tickets, then display the first 25 tickets in a list. List pages can be changed by entering `next` and `previous`. Individual tickets can be viewed by entering their id number, i.e `2`. Entering `list` will return to the current list page. Entering `quit` will exit the app.

## Future improvements
* improve error handling.
* Pretty up interface.
