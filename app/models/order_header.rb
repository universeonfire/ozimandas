class OrderHeader < ApplicationRecord
	belongs_to :proposal_header
	belongs_to :customer
	has_many :order_details
	has_one :currency
end
