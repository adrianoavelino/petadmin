class Schedule < ApplicationRecord
  include Fae::BaseModelConcern
  validates :date, presence: true
  validates :time, presence: true
  validates :service, presence: true
  validates :client, presence: true

  def fae_display_field
    date
  end

  belongs_to :service
  belongs_to :client

  after_save :schedule_emails

  def fae_display_field
    date
  end

  def self.for_fae_index
    order(:id)
  end

  def schedule_emails
    ScheduleJob.perform_later self
  end

end
