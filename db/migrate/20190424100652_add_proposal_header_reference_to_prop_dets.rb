class AddProposalHeaderReferenceToPropDets < ActiveRecord::Migration[5.2]
  def change
    add_reference :prop_dets, :proposal_header, foreign_key: true
  end
end
