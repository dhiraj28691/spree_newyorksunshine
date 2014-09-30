module Spree::StockistsHelper

  def nice_url(url)
    # return url
    return url.to_s.sub(/^https?\:\/\//, '').sub(/^www./,'').sub(/\//,'')
    # return url
  end

end
