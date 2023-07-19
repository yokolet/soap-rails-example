# README

Sample SOAP app

* Ruby version: 3.2.1
* Rails version: 7.0.4.2

#### What is this

This is just an idea of SOAP request and response handling.
The app uses Savon [https://www.savonrb.com/](https://www.savonrb.com/) for a
SOAP client.

The app is not tested yet. It should have a log of problems.
It has a bare bone implementation only.

#### How to do

- SOAP client: app/controllers/application_controller.rb
  - the client instance is created in the application controller
- Request/Response handling: app/controllers/airbag_controller.rb
  - the get method making an airbags_get request
  - the response handling snippet is there
