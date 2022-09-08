# Rails + RabbitMQ + Tesseract
This is repo contains simple [Rails API](https://guides.rubyonrails.org/api_app.html) which receives image url and pushes it to [RabbitMQ](https://www.rabbitmq.com/) queue to later process it with [tesseract](https://github.com/dannnylo/rtesseract)

## How to run
### With **Docker** simply execute:

    $ docker compose up -d
    
### Without Docker:

  There are 3 services that should be running:
  
  1. Rails API
  2. Rails Worker
  3. RabbitMQ
  
  All is needed is successfull connection to [RabbitMQ](https://www.rabbitmq.com/) and [tesseract command line](https://github.com/tesseract-ocr/tesseract) installed.
  
  The default connection url will be tried by app is:
  ```
  amqp://guest:guest@localhost:5672
  ```
  
  If that's not your option, you can change it there:
  ```
  config/initializers/sneakers.rb:1
  ```
  Once you have everything required, go ahead and fire up RabbitMQ and then Rails API and Worker:
  
    $ bin/rails s # for API
    $ bin/rake sneakers:run # for worker

## Docker infrastructure
There are 2 containers:
1. Rails application

    - Rails API
    - Rails Worker 

    multiple services in the same container, supervised by [s6-overlay](https://github.com/just-containers/s6-overlay):
2. RabbitMQ service

## Credits 
- https://github.com/jondot/sneakers
- https://github.com/veeqo/advanced-sneakers-activejob
- https://github.com/tesseract-ocr/tesseract
- https://github.com/dannnylo/rtesseract
- https://github.com/rails/rails
