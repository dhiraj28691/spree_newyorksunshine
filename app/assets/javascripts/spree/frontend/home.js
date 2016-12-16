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
      video.css('width', '100%');
      video.css('height', video.width() / videoRatio);
    } else { // TALL
      video.css('height', '100%');
      video.css('width', video.height() * videoRatio);
    }
  }

  setVideoRatio()
  resizeHomeVideo()

  $(window).resize(function() {
    resizeHomeVideo()
  });
})
