$(function() {
  function setVideoRatio() {
    video = $('#home-video');
    videoRatio = video.width() / video.height();
    video.data('ratio', videoRatio);
  }

  function resizeHomeVideo() {
    video = $('#home-video');
    videoRatio = video.data('ratio');
    container = $('.video-container');
    containerRatio = container.width() / container.height();
    if(containerRatio > videoRatio){ // WIDE
      video.attr('class', 'wide');
    } else { // TALL
      video.attr('class', 'tall');
    }
  }

  video = document.getElementById('home-video');
  if(!$.isEmptyObject(video)){
    video.addEventListener('loadeddata', function() {
      if (video.readyState === 4) {
        setVideoRatio()
        resizeHomeVideo()
        $('#home-video').fadeIn(2000);
      }
    });

    $(window).resize(function() {
      resizeHomeVideo()
    });
  }
})
