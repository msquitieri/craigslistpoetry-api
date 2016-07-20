## Craigslist Poetry API

[![Build Status](https://travis-ci.org/msquitieri/craigslistpoetry-api.svg?branch=master)](https://travis-ci.org/msquitieri/craigslistpoetry-api)

The API that powers [craigslistpoetry.com](https://craigslistpoetry.com). Written in Rails 5, the latest and greatest.

### Overview
This project provides the following:

- An API to: create a poem, retrieve a paginated list of poems, retrieve a single poem.
- Sends out a daily email to all `AdminUser`s that displays how many poems were generated in the past day.
- Tweets out a poem periodically around the day to [@craigslistpoems](https://twitter.com/craigslistpoems)

### Related Repos

Please see related repos to this project:
- [craigslistpoetry-frontend](https://github.com/msquitieri/craigslistpoetry-frontend) repo, which is written in [Ember](https://github.com/emberjs/ember.js)
- [craigslistpoetry-api-chef](https://github.com/msquitieri/craigslistpoetry-api-chef) repo, which consists of [Chef](https://github.com/chef/chef) recipes used to provision a cloud server to run this repo.
