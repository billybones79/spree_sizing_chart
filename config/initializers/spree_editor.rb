Spree::Config[:show_raw_product_description] = true

SpreeEditor::Config.tap do |config|
  config.ids = 'product_description page_body event_body template_chart_chart_table sizing_chart_chart_table'

  # change the editor to CKEditor
  config.current_editor = 'CKEditor'
end