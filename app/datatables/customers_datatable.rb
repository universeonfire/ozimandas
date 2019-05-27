class  CustomersDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:          { source: "Customer.id" },
      firm_name:       { source: "Customer.firm_name" },
      adress:      { source: "Customer.adress" },
      phone:      { source: "Customer.phone" },
      
    }
  end

  def data
    records.map do |record|
      {
          id:          record.id,
          firm_name:       record.firm_name,
          adress: record.adress,
          phone: record.phone,
        
      }
    end
  end

  def get_raw_records
     Customer.all
  end

end