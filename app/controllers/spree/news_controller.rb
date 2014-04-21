module Spree
  class NewsController < Spree::BaseController

    def index

      @posts = []

      #1
      @posts << {
        "title" => ["Rick Ross – Mastermind"],
        "date" => ["2004-09-09"],
        "body_text" => "<p>Mastermind, the 6th LP from the 38 year old founder of Maybach Music Group or MMG for short, is a truly remarkable rap album. You usually expect to see artists that have grown at such a fast pace to sort of lose steam after their fourth or fifth album. Although, nothing seems to be slowing down the Rozay train. By surrounding himself with talent (Wale, Meek Mill, and French Montana just to name a few) he&#8217;s pushed not only his artists but himself to stay on track to go down as one of raps all-time greats.</p><p>The album is great because of two c’s, consistency and collaborations. Rick Ross has built so much of his career collaborating with the right people at the right time. This album is just another example of why rappers need to work with one another to obtain and maintain eminence. The consistency comes into play throughout the individual tracks. Although not every album is flawless, I would be lying if I said I only liked the chosen few singles on the album. &ldquo;The Devil is a Lie,&rdquo; smash radio hit. &ldquo;Black and White,&rdquo; that’s one you have to listen too with the top down on full blast. &ldquo;In Vein&rdquo; featuring The Weekend, a slowed down beat with not only a great chorus but arguably my favorite verse from Ricky on the whole album. And my personal favorite, &ldquo;Sanctified&rdquo; featuring Kanye West and Big Sean.</p><p>All in all, I plan on playing this LP all summer and even most likely well into the winter. If you haven’t picked it up, go out and grab a copy. If you don’t know, now you know&hellip;</p>"
      }

      #2
      @posts << {
        "embed_code" => '<iframe src="//player.vimeo.com/video/14074949" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/14074949">DARK SIDE OF THE LENS</a> from <a href="http://vimeo.com/astrayfilms">Astray Films</a> on <a href="https://vimeo.com">Vimeo</a>.</p>',
        "clickthrough_link" => "http://vimeo.com/14074949"
        "body_text" => "No matter how many times we watch this video, we never cease to be amazed.  Gives us the chills every time&hellip;"
      }


