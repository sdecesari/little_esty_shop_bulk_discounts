class BulkDiscount < ApplicationRecord
  validates :percent, presence: true 
  validates :threshold, presence: true
  validates :merchant_id, presence: true
  belongs_to :merchant 
  has_many :invoices, through: :merchant
end 