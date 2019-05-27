class Customer < ApplicationRecord
	has_many :proposal_header
	has_many :order_header
end
