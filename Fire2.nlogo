globals [
  initial-trees   ;; how many trees (green patches) we started with
  burned-trees    ;; how many have burned so far
  setup-patches
]

breed [fires fire]    ;; bright red turtles -- the leading edge of the fire
breed [embers ember]  ;; turtles gradually fading from red to near black

to setup
  clear-all
  set-default-shape turtles "square"
  ;; make some green trees
  ask patches with [(random-float 100) < density]
    [ set pcolor green ]
  ;; make a column of burning trees
  ask patches with [pxcor = min-pxcor]
    [ ignite ]
  ask patches
  [
     if pxcor >  100 and pxcor < 120  and pycor > 100 and pycor < 120
    [set pcolor yellow]
  ]
  ;; set tree counts
  set initial-trees count patches with [pcolor = green]
  set burned-trees 0
  reset-ticks

end

to go
  if not any? turtles  ;; either fires or embers
    [ stop ]
  ask fires
    [ ask neighbors4 with [pcolor = green]
        [ ignite ]
      set breed embers ]
  fade-embers
  signal
  tick
  signal2
  tick
end

;; creates the fire turtles
to ignite  ;; patch procedure
  sprout-fires 1
    [ set color red ]
  set pcolor black
  set burned-trees burned-trees + 1
end

;; achieve fading color effect for the fire as it burns
to fade-embers
  ask embers
    [ set color color - 0.3  ;; make red darker
      if color < red - 3.5     ;; are we almost at black?
        [ set pcolor color
          die ] ]
end
to signal
  ask patches
  [
     if pxcor >  100 and pxcor < 120  and pycor > 100 and pycor < 120 and pcolor = yellow
    [set pcolor orange]
  ]
end
to signal2
  ask patches
  [

    if pxcor >  100 and pxcor < 120  and pycor > 100 and pycor < 120 and pcolor = orange
    [set pcolor yellow]
  ]
end
; Copyright 1997 Uri Wilensky.
; See Info tab for full copyright and license.
