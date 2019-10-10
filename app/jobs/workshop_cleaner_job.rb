class WorkshopCleanerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Background job DONE"
  end
end