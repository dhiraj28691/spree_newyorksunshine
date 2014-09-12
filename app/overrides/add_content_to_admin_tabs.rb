Deface::Override.new(
  :virtual_path => 'spree/admin/shared/_tabs',
  :name => 'add_content_to_admin_tabs_0',
  :insert_after => "erb[loud]:contains('tab :products')",
  :text => "<%= tab :static, :taxonomies, :label => 'Content', :icon => 'file-text', :url => '/admin/posts/' %>")
