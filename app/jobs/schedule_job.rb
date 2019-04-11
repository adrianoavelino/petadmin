class ScheduleJob < ApplicationJob
  queue_as :emails

  def perform(schedule)
    SchedulingMailer.schedule(schedule).deliver_now
  end
end
