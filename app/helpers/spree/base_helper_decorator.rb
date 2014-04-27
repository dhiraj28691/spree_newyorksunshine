Spree::BaseHelper.module_eval do
	def taxons_tree(root_taxon, current_taxon, max_level = 1)
	  return '' if max_level < 1 || root_taxon.children.empty?
    root_taxon.children.map do |taxon|
      css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
			link_to(taxon.name, seo_url(taxon), { class: css_class}) + taxons_tree(taxon, current_taxon, max_level - 1)
    end.join("\n").html_safe
	end

  def breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
    return "no taxons to display" if current_page?("/") || taxon.nil?
    separator = raw(separator)
    crumbs = [content_tag(:li, link_to(Spree.t(:home), spree.root_path) + separator)]
    if taxon
      crumbs << content_tag(:li, link_to(Spree.t(:products), products_path) + separator)
      crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
      crumbs << content_tag(:li, content_tag(:span, link_to(taxon.name , seo_url(taxon))))
    else
      crumbs << content_tag(:li, content_tag(:span, Spree.t(:products)))
    end
    crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'inline')
    content_tag(:nav, crumb_list, id: 'breadcrumbs')
  end


  def link_to_cart(text = nil)
    text = text ? h(text) : Spree.t('cart')
    css_class = nil

    if simple_current_order.nil? or simple_current_order.item_count.zero?
      text = "#{text}(0)"
      css_class = 'empty'
    else
      text = "#{text}(#{simple_current_order.item_count})".html_safe
      css_class = 'full'
    end

    link_to text, spree.cart_path, :class => "cart-info #{css_class}"
  end



end
