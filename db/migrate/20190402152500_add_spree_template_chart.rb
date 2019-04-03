class AddSpreeTemplateChart < ActiveRecord::Migration


  def up
    return if table_exists?(:spree_template_charts)
    create_table :spree_template_charts do |t|
      t.string  :name
      t.text    :chart_table
      t.timestamps
    end
  end

  def down
    drop_table :spree_template_charts
  end
end
