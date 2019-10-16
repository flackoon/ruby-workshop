class WorkshopCleanerJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    self.class.set(:wait => 12.hours).perform_later
  end

  def perform(*args)
    Workshop.where('date<?', Date.today).delete_all
  end
end