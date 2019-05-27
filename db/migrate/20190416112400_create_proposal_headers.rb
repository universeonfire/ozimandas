class CreateProposalHeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :proposal_headers do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
