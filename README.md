A small "Address book"
======================

app that allows:
* listing/creating/editing/removing contacts and showing a single contact on its own page
* exporting/importing contacts to/from CSV file (overwrite contacts with the same full name on import)
* sharing contact details by email
* searching for contacts (optional, if you have time left)

Each contact should have:
* first name
* last name
* multiple emails
* multiple phone numbers
Each full name should be unique. Each contact should have at least one phone number or email.

Requirements:
* latest Rails and Ruby versions
* first git commit right after `rails new`, other ones as you like
* Slim, Coffee, SASS (BEM if you like it), I18n, RSpec or minitest, SQLite (just for easy setup)
* server side model validations
* simple client side input validation for phone and email formats with CoffeeScript/jQuery
* no scaffolding, no bootstrap, just some clean and simple design up to your taste


Install:
-----------------------

## Setup environment variables

```
SECRET_KEY_BASE = YOURSECRETKEYGOESHERE
APPLICATION_URL = http://domain.com:port
MAIL_FROM = user@domain.com
MAIL_SERVER_URL = protocol://user:password@domain:port?domain=domain.com&authentication=plain&starttls_auto=true # as 
```

## Setup database
```
rake db:create
rake db:migrate
rake db:seed
```
## Tests & code style

rubocop:
```
rubocop -a
```

specs:
```
rspec
```
