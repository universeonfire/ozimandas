class ItemDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:          { source: "Item.id" },
      item_name:       { source: "Item.item_name" },
      item_description: { source: "Item.item_description" },
      
    }
  end

  def data
    records.map do |record|
      {
          id:               record.id,
          item_name:        record.item_name,
          item_description: record.item_description,
       
          
      }
    end
  end

  def get_raw_records
    Item.all
  end

end