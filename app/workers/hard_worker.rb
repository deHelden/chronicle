class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: 4

  # The current retry count and exception is yielded. The return value of the
  # block must be an integer. It is used as the delay, in seconds. A return value
  # of nil will use the default.
  sidekiq_retry_in do |count, exception|
    case exception
    when RuntimeError
      10 * (count + 1) # (i.e. 10, 20, 30, 40, 50)
    end
  end

  #After all retries  Sidekiq moves the job to the Dead set.
  sidekiq_retries_exhausted do |msg, ex|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end


  def perform(*args)
    puts "ARGS THAT ARE GIVEN #{args}"
  end
end
