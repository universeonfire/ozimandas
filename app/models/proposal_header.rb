class ProposalHeader < ApplicationRecord
	belongs_to :customer
	has_many :prop_dets , :dependent => :destroy
	accepts_nested_attributes_for :prop_dets  , :allow_destroy => true
	validates_presence_of :title 
	has_one :currency
	#belongs_to :customer
end
