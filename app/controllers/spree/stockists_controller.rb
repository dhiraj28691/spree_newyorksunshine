module Spree
  class StockistsController < Spree::BaseController

    def index

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

      # @stockists['North America'] << {
      #   "name" => "Oakland Surf Club",
      #   "address" => "337 14th St, Oakland, CA 94612",
      #   "phone_number" => "+1 510 465 2770",
      #   "anchor" => "oaklandsurfclub.com",
      #   "anchor_href" => "http://oaklandsurfclub.com/"
      # }

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

  end
end