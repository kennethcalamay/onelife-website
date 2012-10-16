$(->
  $(".fancybox").fancybox({
    openEffect : 'elastic',
    closeEffect : 'elastic'
  })

  $(".video").fancybox({
    maxWidth: 800,
    maxHeigh:  600,
    fitToView: false,
    width: '70%',
    height: '70%',
    autosize: false,
    closeClick: false,
    openEffect : 'elastic',
    closeEffect : 'elastic'
  })
)
