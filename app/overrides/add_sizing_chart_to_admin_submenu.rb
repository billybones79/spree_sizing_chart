Deface::Override.new(
    virtual_path: 'spree/admin/shared/_product_sub_menu',
    name: 'add_sizing_chart_to_admin_submenu',
    insert_bottom: "[data-hook=admin_product_sub_tabs]",
    text: "<%= tab :sizing_charts %>
           <%= tab :template_charts %>",
)
