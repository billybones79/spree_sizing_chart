class AddSpreeSizingChart < ActiveRecord::Migration


  def up
    return if table_exists?(:spree_sizing_charts)
    create_table :spree_sizing_charts do |t|
      t.integer :brand_id
      t.integer :taxon_id
      t.text    :chart_table
      t.timestamps
    end
  end

  def down
    drop_table :spree_sizing_charts
  end
end
