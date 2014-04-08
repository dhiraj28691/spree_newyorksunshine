module Spree
  class StockistsController < Spree::BaseController

    def index

      @stockists = []

      @stockists << {
        "name" => "WISM in Tokyo",
        "address" => "5-17-20 Jingumae, Shibuya-Ku, 150-0001, Tokyo",
        "phone_number" => "+3 6418 5034",
        "anchor" => "wism-tyo.jp",
        "anchor_href" => "http://wism-tyo.jp/"
      }

      @stockists << {
        "name" => "Barneys Japan",
        "address" => "6-8-7 Ginza, Tokyo",
        "phone_number" => "+81 03 3289 1200",
        "anchor" => "barneys.co.jp",
        "anchor_href" => "http://www.barneys.co.jp/"
      }

      @stockists << {
        "name" => "ODIN NY",
        "address" => "199 Lafayette St, New York, NY 10012",
        "phone_number" => "+1 212 966 0026",
        "anchor" => "www.odinnewyork.com",
        "anchor_href" => "http://www.odinnewyork.com/"
      }

      @stockists << {
        "name" => "Fred Segal Japan",
        "anchor" => "www.fredsegal.jp",
        "anchor_href" => "http://www.fredsegal.jp/"
      }

      @stockists << {
        "name" => "W. South Beach"
      }

      @stockists << {
        "name" => "Blue & Cream East Hampton",
        "address" => "60 The Cir, East Hampton, NY 11937",
        "anchor_href" => "http://www.blueandcream.com/"
      }

      @stockists << {
        "name" => "Oakland Surf Club",
        "address" => "337 14th St, Oakland, CA 94612",
        "phone_number" => "+1 510 465 2770",
        "anchor" => "oaklandsurfclub.com",
        "anchor_href" => "http://oaklandsurfclub.com/"
      }

      @stockists << {
        "name" => "Aloha Sunday Supply Company",
        "address" => "3039 University Ave, San Diego, CA 92104, U.S.A.",
        "phone_number" => "+1 619.269.9838",
        "anchor" => "alohasunday.com",
        "anchor_href" => "http://alohasunday.com/"
      }

      @stockists << {
        "name" => "Collette in Paris",
        "address" => "213 Rue Saint Honoré, 75001 Paris, France",
        "phone_number" => "+33 1 55 35 33 90",
        "anchor" => "www.colette.fr",
        "anchor_href" => "http://www.colette.fr/"
      }

    end

  end
end