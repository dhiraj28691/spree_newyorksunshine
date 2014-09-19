module Spree
  class StockistsController < Spree::BaseController

    def index_old

      @stockists = {
        'North America' => [],
        'International' => []
      }

      @stockists['North America'] << {
        "name" => "New York Sunshine Surf Club",
        "address" => "28 Nugent St, Southampton, NY",
        "phone_number" => "+1 631 461 2328",
        "anchor" => "newyorksunshine.com",
        "anchor_href" => "http://newyorksunshine.com/"
      }

      @stockists['North America'] << {
        "name" => "Memes NY",
        "address" => "3 Great Jones Street New York, NY, 10012",
        "phone_number" => "+1 212 420 9955",
        "anchor" => "memes-nyc.com",
        "anchor_href" => "http://memes-nyc.com/"
      }

      @stockists['North America'] << {
        "name" => "Reed Space",
        "address" => "151 Orchard St, New York, NY 10002",
        "phone_number" => "+1 212 253 0588",
        "anchor" => "thereedspace.com",
        "anchor_href" => "http://thereedspace.com/"
      }

      @stockists['North America'] << {
        "name" => "ODIN NY",
        "address" => "199 Lafayette St, New York, NY 10012",
        "phone_number" => "+1 212 966 0026",
        "anchor" => "odinnewyork.com",
        "anchor_href" => "http://odinnewyork.com/"
      }

      @stockists['North America'] << {
        "name" => "Hirshleifers",
        "address" => "2080 Northern Blvd, Manhasset, NY, 11030",
        "phone_number" => "+1 516 627 3566",
        "anchor" => "themensmarket.com",
        "anchor_href" => "http://themensmarket.com/"
      }

      @stockists['North America'] << {
        "name" => "W. South Beach",
        "address" => "2201 Collins Avenue, Miami Beach, Florida, 33139",
        "phone_number" => "+1 305 938 3000"
      }

      @stockists['North America'] << {
        "name" => "Aloha Sunday Supply Company",
        "address" => "3039 University Ave, San Diego, CA 92104, U.S.A.",
        "phone_number" => "+1 619.269.9838",
        "anchor" => "alohasunday.com",
        "anchor_href" => "http://alohasunday.com/"
      }

      @stockists['North America'] << {
        "name" => "Blue & Cream East Hampton",
        "address" => "60 The Cir, East Hampton, NY 11937",
        "phone_number" => "+1 631 329 1392",
        "anchor" => "www.blueandcream.com",
        "anchor_href" => "http://www.blueandcream.com/"
      }

      @stockists['International'] << {
        "name" => "Vanker Closet",
        "address" => "Fukuoka-shi, Fukuoka, Japan",
        "phone_number" => "+81 92 753 9563",
        "anchor" => "vankercloset.com",
        "anchor_href" => "http://vankercloset.com/"
      }

      @stockists['International'] << {
        "name" => "Colette",
        "address" => "213 Rue Saint Honoré, 75001 Paris, France",
        "phone_number" => "+33 1 55 35 33 90",
        "anchor" => "www.colette.fr",
        "anchor_href" => "http://www.colette.fr/"
      }

      @stockists['International'] << {
        "name" => "WISM",
        "address" => "5-17-20 Jingumae, Shibuya-Ku, 150-0001, Tokyo",
        "phone_number" => "+3 6418 5034",
        "anchor" => "wism-tyo.jp",
        "anchor_href" => "http://wism-tyo.jp/"
      }

      @stockists['International'] << {
        "name" => "Barneys Japan",
        "address" => "6-8-7 Ginza, Tokyo",
        "phone_number" => "+81 03 3289 1200",
        "anchor" => "www.barneys.co.jp",
        "anchor_href" => "http://www.barneys.co.jp/"
      }

      # @stockists['International'] << {
      #   "name" => "Fred Segal Japan",
      #   "anchor" => "www.fredsegal.jp",
      #   "anchor_href" => "http://www.fredsegal.jp/"
      # }
    end

    def index
      stockists = Stockist.all

      @stockists = {
        "North America" => [],
        "International" => []
      }

      stockists.each do |stockist|
        @stockists[stockist.region].push(stockist)
      end
    end

  end
end