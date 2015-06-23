Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  insert_top: "[data-hook='admin_tabs']",
  text: "<ul class=\"nav nav-sidebar\"><%= main_menu_tree \"Content\", icon: \"file\", sub_menu: \"content\", url: \"#sidebar-content\" %></ul>",
  name: 'add_content_to_admin_tabs'
)