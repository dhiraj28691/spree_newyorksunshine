module Spree
  class NewsController < Spree::BaseController

    def index

      @posts = []

      #1
      # @posts << {
      #   "title" => "Rick Ross &mdash; Mastermind",
      #   "date" => "04-22-2014",
      #   "images" => ["//files.human-nyc.com/newyorksunshine/assets/news-post1-image1.jpg"],
      #   "body_text" => "<p>Mastermind, the 6th LP from the 38 year old founder of Maybach Music Group or MMG for short, is a truly remarkable rap album. You usually expect to see artists that have grown at such a fast pace to sort of lose steam after their fourth or fifth album. Although, nothing seems to be slowing down the Rozay train. By surrounding himself with talent (Wale, Meek Mill, and French Montana just to name a few) he&#8217;s pushed not only his artists but himself to stay on track to go down as one of raps all-time greats.</p><p>The album is great because of two c’s, consistency and collaborations. Rick Ross has built so much of his career collaborating with the right people at the right time. This album is just another example of why rappers need to work with one another to obtain and maintain eminence. The consistency comes into play throughout the individual tracks. Although not every album is flawless, I would be lying if I said I only liked the chosen few singles on the album. &ldquo;The Devil is a Lie,&rdquo; smash radio hit. &ldquo;Black and White,&rdquo; that’s one you have to listen too with the top down on full blast. &ldquo;In Vein&rdquo; featuring The Weekend, a slowed down beat with not only a great chorus but arguably my favorite verse from Ricky on the whole album. And my personal favorite, &ldquo;Sanctified&rdquo; featuring Kanye West and Big Sean.</p><p>All in all, I plan on playing this LP all summer and even most likely well into the winter. If you haven’t picked it up, go out and grab a copy. If you don’t know, now you know&hellip;</p>"
      # }

      #2
      @posts << {
        "title" => "Dark Side of the Lens",
        "date" => "04-22-2014",
        "embed_code" => '<iframe src="//player.vimeo.com/video/14074949" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>',
        "clickthrough_link" => "http://vimeo.com/14074949",
        "body_text" => "No matter how many times we watch this video, we never cease to be amazed.  Gives us the chills every time&hellip;"
      }

      #3
      @posts << {
        "title" => "Our Night out with the Obamas",
        "date" => "04-22-2014",
        "body_text" => "<p>A couple days ago we went to see Denzel in &ldquo;A Raisin in the Sun&rdquo; at the Barrymore Theater. When we got to 47th Street, the whole block was shut down between 8th and Broadway. After pushing our way through a crowd, we presented our tickets to a cop, who allowed us to walk down the barricaded block to the theater.</p><p>There seemed to be an above average amount of security to see Denzel Washington, so we knew something was up. Then we saw the Secret Service. After a metal detector and a bag check, we were directed to our seats. Once everyone was inside, the lights shut off and an announcer asked everyone to &ldquo;please be quiet&rdquo; out of respect for the actors.</p><p>The side door opened and we could hear people filing in. Right away, a thunderous standing ovation broke out to usher in the President and First Lady, along with six or seven Secret Service men, shining flashlights at people as they tried to take photos, hence the lack of photos of Obama in this post.</p><p>It was amazing to see Denzel, one of our favorite actors, performing live, especially in the same room as the most powerful man in the world. It was really a true New York moment.</p>",
        "images" => ["//files.human-nyc.com/newyorksunshine/assets/news-post3-image1.jpg", "//files.human-nyc.com/newyorksunshine/assets/news-post3-image2.jpg", "//files.human-nyc.com/newyorksunshine/assets/news-post3-image3.jpg"]
      }

      # Press
      #0
      @posts << {
        "title" => "Sunshine State of Mind",
        "date" => "05-01-2014",
        "clickthrough_link" => "http://files.human-nyc.com/newyorksunshine/assets/news-manhattan-magazine-2014-05.pdf",
        "tags" => ["press"]
      }

      #1
      @posts << {
        "title" => "Exploding From The Beach To The City",
        "date" => "07-24-2012",
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/news-elitedaily.jpg"],
        "clickthrough_link" => "http://elitedaily.com/money/entrepreneurship/sunshine/",
        "tags" => ["press"]
      }

      #2
      @posts << {
        "title" => "New York Sunshine Works With Illustrator Will Bryant For Surf-Inspired Clothes",
        "date" => "07-13-2012",
        "clickthrough_link" => "http://www.complex.com/style/2012/07/new-york-sunshine-brings-the-summer-fun-gear-featuring-work-from-illustrator-will-bryant",
        "tags" => ["press"]
      }

      #3
      @posts << {
        "title" => "Swell Attire",
        "date" => "02-02-2014",
        "images" => ["http://files.human-nyc.com/newyorksunshine/assets/news-swell-attire.jpg"],
        "clickthrough_link" => "http://www.insidehook.com/new-york/summer-surf-style/",
        "tags" => ["press"]
      }


      #4
      @posts << {
        "title" => "The Sunshine Kid",
        "date" => "07-01-2013",
        "clickthrough_link" => "http://files.human-nyc.com/newyorksunshine/assets/news-the-sunshine-kid.jpg",
        "tags" => ["press"]
      }

      #5
      @posts << {
        "title" => "Summer In December",
        "date" => "06-01-3013",
        "clickthrough_link" => "http://files.human-nyc.com/newyorksunshine/assets/news-new-york-post.pdf",
        "tags" => ["press"]
      }

    end
  end
end

