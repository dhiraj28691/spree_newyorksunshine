module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)

      # @home_feed = [
      #   {
      #     :href => "/t/category/women",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/women.jpg",
      #     :heading => "Women"
      #   },
      #   {
      #     :href => "/events",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/events.jpg",
      #     :heading => "Events"
      #   },
      #   {
      #     :href => "/lookbook",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/lookbook.jpg",
      #     :heading => "Lookbook"
      #   },
      #   {
      #     :href => "/t/category/men",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/men.jpg",
      #     :heading => "Men"
      #   },
      #   {
      #     :href => "/press",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/press.jpg",
      #     :heading => "Press"
      #   },
      #   {
      #     :href => "/promo1",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/promo1.jpg",
      #     :superheading => "Urban Outfitters",
      #     :heading => "Hard Times",
      #     :subheading => "By Obesity & Speed"
      #   },
      #   {
      #     :href => "/promo2",
      #     :img_src => "//files.vanityleaks.com/obesityandspeed/home/promo2.jpg",
      #     :heading => "Lyz Olko",
      #     :subheading => "Featured on 'Girls I Know'"
      #   }
      # ]

    end
  end
end
