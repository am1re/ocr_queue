AdvancedSneakersActiveJob.configure do |config|
  # Should AdvancedSneakersActiveJob try to handle unrouted messages?
  # There are still no guarantees that unrouted message is not lost in case of network failure or process exit.
  # Delayed unrouted messages are not handled.
  config.handle_unrouted_messages = false

  # Should Sneakers build-in runner (e.g. `rake sneakers:run`) run ActiveJob consumers?
  # :include - yes
  # :exclude - no
  # :only - Sneakers runner will run _only_ ActiveJob consumers
  #
  # This setting might be helpful if you want to run ActiveJob consumers apart from native Sneakers consumers.
  # In that case set strategy to :exclude and use `rake sneakers:run` for native and `rake sneakers:active_job` for ActiveJob consumers
  config.activejob_workers_strategy = :include

  # All delayed messages delays are rounded to seconds.
  # config.delay_proc = ->(timestamp) { (timestamp - Time.now.to_f).round } # integer result is expected

  # Delayed queues can be filtered by this prefix (e.g. delayed:60 - queue for messages with 1 minute delay)
  # config.delayed_queue_prefix = 'delayed'

  # Custom sneakers configuration for ActiveJob publisher & runner
  # config.sneakers = {
  #   connection: Bunny.new('amqp://guest:guest@localhost:5672', with: { other: 'options' }),
  #   exchange: 'activejob',
  #   handler: AdvancedSneakersActiveJob::Handler
  # }

  # Define custom delay for retries, but remember - each unique delay leads to new queue on RabbitMQ side
  # config.retry_delay_proc = ->(count) { AdvancedSneakersActiveJob::EXPONENTIAL_BACKOFF[count] }

  # Connection for publisher (fallbacks to connection of consumers)
  # config.publish_connection = Bunny.new('CUSTOM_URL', with: { other: 'options' })

  # Log level of "rake sneakers:active_job" output
  # config.log_level = :info
end
