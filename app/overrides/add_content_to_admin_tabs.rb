Deface::Override.new(
  :virtual_path => 'spree/admin/shared/_tabs',
  :name => 'add_content_to_admin_tabs_0',
  :insert_after => "erb[loud]:contains('tab :products')",
  :text => "<%= tab :home, :surf_club, :lookbook, :posts, :stockists, :about, :returns_and_exchanges, :label => 'Content', :icon => 'file-text', :url => '/admin/posts/' %>")
