class ProposalHeadersDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:          { source: "ProposalHeader.id" },
      title:       { source: "ProposalHeader.title" },
      description: { source: "ProposalHeader.description" },
      
    }
  end

  def data
    records.map do |record|
      {
          id:          record.id,
          title:       record.title,
          description: record.description,
        
      }
    end
  end

  def get_raw_records
     ProposalHeader.all
  end

end