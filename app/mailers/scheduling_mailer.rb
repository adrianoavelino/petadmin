class SchedulingMailer < ApplicationMailer
  def schedule(schedule)
    @schedule = schedule
    subject = "Agendamento PET Admin: #{@schedule.service.title}"
    mail to: @schedule.client.email, subject: subject
  end
end
