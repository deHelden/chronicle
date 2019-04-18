class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "ARGS THAT ARE GIVEN #{args}"
  end
end
