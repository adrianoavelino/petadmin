class Client < ApplicationRecord
  include Fae::BaseModelConcern

  has_many :campaign_clients
  has_many :campaigns, through: :campaign_clients, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :email,
    uniqueness: true,
    presence: true,
    format: {
      with: Fae.validation_helpers.email_regex,
      message: 'You need use a valid and unique email'
    }

  def fae_display_field
    name
  end

end
