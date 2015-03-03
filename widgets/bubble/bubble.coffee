class Dashing.Bubble extends Dashing.Widget

  ready: ->
    console.log("BUBBLE READY")
    container = $(@node).parent()
    container.css('overflow', 'hidden')
    $(@node).attr('id', 'bubbleid')
    if @topBox
      @animateTopBox()
    
  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    console.log("BUBBLE ONDATA")
    @topBox = @createBox(data.title, data.text, data.color)
    $(@node).prepend(@topBox)

    height = @topBox.height();
    startPosition = height + 100
    @topBox.css({ top: "-#{startPosition}px" })

    # Animate the rest of the boxes down
    $('.bubblebox:gt(0)').animate({
      top: "+=#{startPosition}px",
    },
      600,
      "easeInOutQuart"
    )
  
    window.setTimeout(@animateTopBox, 600)

    @removeBoxes()

  createBox: (title, text, color="green") ->
    console.log("BUBBLE createBox")
    date = @getTime()
    rand = Math.floor(Math.random() * 3)
    div = $("<div class='bubblebox'><p class='bubbletime'>#{date}</p><p class='bubbletitle'>#{title}</p><p class='bubbletext'>#{text}</p></div?>")
      .addClass("box#{rand}")
      .css("background-color", color)

  removeBoxes: ->
    $(@node).find(".bubblebox:gt(10)").remove()

  animateTopBox: =>
    console.log("BUBBLE animateTopBox")
    height = @topBox.height() + 150    
    @topBox.animate({
        top: "+=#{height}px"
      },
      2000,
      "easeOutBack"
    )

  getTime: ->
      timestamp = new Date()
      weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
      weekday = weekdays[timestamp.getDay()];
      hours = timestamp.getHours()
      minutes = ("0" + timestamp.getMinutes()).slice(-2)
      "#{weekday} #{hours}:#{minutes}"
      
