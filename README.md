# Twitter clone challenge

## Requirements

- Ubuntu 18.04+
- Ruby 2.7+
- Rails 6+

## Installation & Init

1. Clone the repository: `git clone https://github.com/daorejuela1/twitter_clone`
2. Go to the folder: `cd twitter_clone`
3. Install requirements `bundle`
4. Create the data base `rails db:create`
5. Run the migrations `rails db:migrate`
6. Run the server: `rails s -b 0.0.0.0 -p 3000`

## Usage

Get into the URL `127.0.0.1:3000` to start the web app, create a new account, go into your @username at the top of the web pages and start writing.

When you log out you can see all the recent tweets from all the users using the system

## Features

### Tweet

 - This action will allow you to tweet messages

### Follow/Unfollow

 - This software will allow you to follow/unfollow other users to see their tweets on your Feeds
