# README

[![Maintainability][codeclimate-badge-maintainability]][codeclimate-maintainability] [![Test Coverage][codeclimate-badge-coverage]][codeclimate-coverage] [![Build Status][travis-badge]][travis]

## About this project

This project is the Back-end and should be work together with [sample_tracking](https://github.com/marcelotoledo5000/sample_tracking).

Is a Rails application to management Contacts and Data Tracking captured from another app (sample_tracking).

It should list all created Contacts and Data Tracking received by REST API. This API allows receiving, via POST, both the Contacts and Data Tracking from other sites that using the [libTracking.js](https://github.com/marcelotoledo5000/sample_tracking/blob/master/public/assets/js/libTracking.js).

## 🚀 Recent Upgrade (2024)

This project has been successfully upgraded from Ruby 2.7.0 to Ruby 3.4.6 and Rails 6.0 to Rails 7.2.2.2, following modern best practices and maintaining 100% test coverage. All functionality has been preserved while improving performance, security, and maintainability.

**Key improvements:**
- ✅ Ruby 3.4.6 (latest stable version)
- ✅ Rails 7.2.2.2 (modern framework)
- ✅ PostgreSQL 15 (latest database)
- ✅ All gems updated to compatible versions
- ✅ 100% test coverage maintained (36/36 tests passing)
- ✅ Docker environment modernized
- ✅ Security improvements (Host Authorization configured)
- ✅ Asset pipeline optimized

For detailed technical documentation about the upgrade process, see [docs/UPGRADE_TECHNICAL_REPORT.md](docs/UPGRADE_TECHNICAL_REPORT.md).

## Technical Informations and dependencies

* The Ruby language - version 3.4.6
* The Rails gem     - version 7.2.2.2
* RSpec             - version 8.0.2
* Capybara          - version 3.39.0
* Rubocop           - version 1.50.0
* PostgreSQL        - version 15
* Docker            - version 19.03.5-ce
* Docker Compose    - version 1.25.1

## To use

Clone the project:

``` Shell
git clone git@github.com:marcelotoledo5000/ContactList.git
cd ContactList
```

### With Docker (better option)

``` Shell
script/setup    # => development bootstrap, preparing containers
script/server   # => starts server
script/console  # => starts console
script/test     # => running tests
```

#### Running without Docker (not recommended!)

If you prefer, you'll need to update `config/database.yml`:

``` Yaml
# host: db        # when using docker
host: localhost   # when using localhost
```

System dependencies:

* Install and configure the database: [Postgresql-10](https://www.postgresql.org/download/)

And then:

``` Shell
gem install bundler         # => install the last Bundler version
bundle install              # => install the project's gems
rails db:setup db:migrate   # => prepare the database
rails s                     # => starts server
rails c                     # => starts console
bundle exec rspec           # => to running tests
```

### To run app

To see the application in action, starts the rails server to able [http://localhost:3000/](http://localhost:3000.)

### API Documentation

#### Authentication

* Do not need to use authentication yet.

#### Domain

[http://localhost:3000/](http://localhost:3000)

#### Endpoints

##### CONTACTS

INDEX

```code
GET: http://DOMAIN/contacts
"http://localhost:3000/contacts"
```

Response:

```code
200 Ok
```

SHOW

```code
GET: http://DOMAIN/contacts/:id
"http://localhost:3000/contacts/1"
```

Response:

```code
200 Ok
```

CREATE

```code
POST: http://DOMAIN/contacts
"http://localhost:3000/contacts"
Param: Body, JSON(application/json)
```

```json
{
  "email": "vladimir@harkonnen.com",
  "name": "Vladimir Harkonnen",
  "guid": "5834417a-e646-49b8-b1d6-92d8812291c9"
}
```

Response:

```code
201 Created
```

UPDATE

```code
PUT: http://DOMAIN/contacts
"http://localhost:3000/contacts"
Param: Body, JSON(application/json)
```

```json
{
  "email": "vladimir@harkonnen.com",
  "name": "Vladimir Harkonnen",
  "guid": "5834417a-e646-49b8-b1d6-92d8812291c9"
}
```

Response:

```code
204 No Content
```

##### TRACKS

INDEX

```code
GET: http://DOMAIN/tracks
"http://localhost:3000/tracks"
```

Response:

```code
200 Ok
```

SHOW

```code
GET: http://DOMAIN/tracks/:id
"http://localhost:3000/tracks/1"
```

Response:

```code
200 Ok
```

CREATE

```code
POST: http://DOMAIN/tracks
"http://localhost:3000/tracks"
Param: Body, JSON(application/json)
```

```json
{
  "guid": "5834417a-e646-49b8-b1d6-92d8812291c9",
  "visited_page": "http://localhost:4567/home",
  "visited_datetime": "2019-05-14 04:22:10 UTC",
}
```

Response:

```code
201 Created
```

[codeclimate-badge-maintainability]: https://api.codeclimate.com/v1/badges/6c7b7281c2b791bb3b95/maintainability
[codeclimate-maintainability]: https://codeclimate.com/github/marcelotoledo5000/ContactList/maintainability

[codeclimate-badge-coverage]: https://api.codeclimate.com/v1/badges/6c7b7281c2b791bb3b95/test_coverage
[codeclimate-coverage]: https://codeclimate.com/github/marcelotoledo5000/ContactList/test_coverage

[travis-badge]: https://travis-ci.com/marcelotoledo5000/ContactList.svg?branch=master
[travis]: https://travis-ci.com/marcelotoledo5000/ContactList
