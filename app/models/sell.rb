class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { finished: 0, canceled: 1 }

  validates :client, presence: true

  belongs_to :discount
  belongs_to :client

  has_many :sell_products
  has_many :products, through: :sell_products, dependent: :destroy

  has_many :sell_services
  has_many :services, through: :sell_services, dependent: :destroy

  before_save :set_total

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  private

  def set_total
    total = 0
    self.products.each {|p| total += p.price }
    self.services.each {|s| total += s.price }
    total = get_total_with_discount(total) if self.discount.present?
    total = (total >= 0)? total : 0
    self.total = total
  end

  def get_total_with_discount(total)
    return total_with_discount_in_money(total) if is_discount_with_money?
    return total_with_discount_in_percentagem(total)
  end

  def is_discount_with_money?
    self.discount.discount_type == 0
  end

  def total_with_discount_in_money(total)
    total - self.discount.value
  end

  def total_with_discount_in_percentagem(total)
    total * (1 - (self.discount.value/100))
  end
end
