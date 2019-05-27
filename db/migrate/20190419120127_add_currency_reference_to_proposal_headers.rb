class AddCurrencyReferenceToProposalHeaders < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposal_headers, :currency, foreign_key: true
  end
end
