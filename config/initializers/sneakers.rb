Sneakers.configure amqp: ENV.fetch('AMQP_STR') { 'amqp://guest:guest@localhost:5672' },
                   vhost: '/',
                   exchange: 'sneakers',
                   exchange_type: :direct

Sneakers.logger.level = Logger::INFO
