class AddCustomerReferenceToProposalHeaders < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposal_headers, :customer, foreign_key: true
  end
end
