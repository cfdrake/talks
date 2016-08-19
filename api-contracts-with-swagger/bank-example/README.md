# Bank Account API Example
Bank Account API represented in a [Swagger](http://swagger.io/) site.

## Setup

### Swagger Editor
Make sure you have ruby 2.x installed:

    $ ruby -v

Then:

    $ gem install sinatra
    $ ruby server.rb

View [localhost:4567](http://localhost:4567) in a browser.

### Mock Server
Start by installing Node and npm:

    $ brew install node

Next, install all Node dependencies:

    $ npm install swagger-mock-api grunt grunt-cli grunt-contrib-connect --save-dev

Finally, to start the mock server, run:

    $ grunt

View [localhost:8000](http://localhost:8000) in a browser and navigate to a valid endpoint.
