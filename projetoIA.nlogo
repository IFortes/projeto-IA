Globals [
  Safe
  Burned
  wall
  exit]

breed [fires fire]
breed [people person]

people-own
[
  points
  state
  target
]

to setup
  ca
  reset-ticks
  setup-patches
  setup-people
  setup-fires
end


to setup-people
  set-default-shape people "person"
  ask n-of n-people (patches with [pcolor = white]) [sprout-people 1]
  ask people [ set color cyan ]
  ask people [ set points 2 ]
end

to setup-fires
  set-default-shape fires "fire"
  ask n-of 2 (patches with [pcolor = white or pcolor = yellow]) [sprout-fires 1]
  ask fires [ set color red set ycor 49]
end

to setup-patches
  ask patches
  [
    ; Setting the external walls
    if pycor = 0 or pycor = 50 or pxcor = 50 or pxcor = 0 [ set pcolor gray ] ; baundry walls

    ; Setting 3 exits
    if pxcor = 50  and pycor > 0 and pycor < 5 [ set pcolor green] ; right exit
    if pycor = 50  and pxcor > 20 and pxcor < 25 [ set pcolor green  ] ; top exit

    ; Setting interal walls

    if pxcor = 20 and pycor > 1 and pycor < 7 [ set pcolor gray ] ; wall 2.1

    if pxcor = 22 and pycor > 1 and pycor < 50 [ set pcolor yellow ] ; wall 2.1


    if pxcor = 23 and pycor > 1 and pycor < 50 [ set pcolor yellow ] ; wall 2.1

    if pxcor > 22 and pxcor < 50 and pycor = 3 [ set pcolor yellow ] ; wall 2.3
    if pxcor > 22 and pxcor < 50 and pycor = 2 [ set pcolor yellow ] ; wall 2.3
   ; if pxcor = 22 and pycor > 3 and pycor < 5 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 20 and pycor > 9 and pycor < 17 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 22 and pycor > 17 and pycor < 19 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 20 and pycor > 19 and pycor < 22 [ set pcolor gray ] ; wall 2.1
   ; if pxcor = 22 and pycor > 22 and pycor < 24 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 20 and pycor > 24 and pycor < 28 [ set pcolor gray ] ; wall 2.1
   ; if pxcor = 22 and pycor > 28 and pycor < 30 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 20 and pycor > 30 and pycor < 34 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 22 and pycor > 34 and pycor < 36 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 20 and pycor > 36 and pycor < 43 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 22 and pycor > 43 and pycor < 45 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 20 and pycor > 45 and pycor < 50 [ set pcolor gray ] ; wall 2.1

    if pxcor = 25 and pycor > 5 and pycor < 7 [ set pcolor gray ] ; wall 2.2

    if pxcor = 25 and pycor > 9 and pycor < 17 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 25 and pycor > 17 and pycor < 19 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 25 and pycor > 19 and pycor < 22 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 25 and pycor > 22 and pycor < 24 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 25 and pycor > 24 and pycor < 28 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 25 and pycor > 28 and pycor < 30 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 25 and pycor > 30 and pycor < 34 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 25 and pycor > 34 and pycor < 36[ set pcolor yellow ] ; wall 2.1
    if pxcor = 25 and pycor > 36 and pycor < 43 [ set pcolor gray ] ; wall 2.1
  ;  if pxcor = 25 and pycor > 43 and pycor < 45 [ set pcolor yellow ] ; wall 2.1
    if pxcor = 25 and pycor > 45 and pycor < 50 [ set pcolor gray ] ; wall 2.1

    if pxcor > 0 and pxcor < 20 and pycor = 14 [ set pcolor gray ] ; wall 2.3
    if pxcor > 0 and pxcor < 20 and pycor = 21 [ set pcolor gray ] ; wall 2.3
    if pxcor > 0 and pxcor < 20 and pycor = 25 [ set pcolor gray ] ; wall 2.3
    if pxcor > 0 and pxcor < 20 and pycor = 32 [ set pcolor gray ] ; wall 2.3
    if pxcor > 0 and pxcor < 20 and pycor = 39 [ set pcolor gray ] ; wall 2.3

    if pxcor > 24 and pxcor < 50 and pycor = 5 [ set pcolor gray ] ; wall 2.4
    if pxcor > 24 and pxcor < 50 and pycor = 14 [ set pcolor gray ] ; wall 2.4
    if pxcor > 24 and pxcor < 50 and pycor = 21 [ set pcolor gray ] ; wall 2.4
    if pxcor > 24 and pxcor < 50 and pycor = 25 [ set pcolor gray ] ; wall 2.4
    if pxcor > 24 and pxcor < 50 and pycor = 32 [ set pcolor gray ] ; wall 2.4
    if pxcor > 24 and pxcor < 50 and pycor = 39 [ set pcolor gray ] ; wall 2.4

    ; Setting floor white
    if pcolor = black [ set pcolor white ]
  ]

  ask patches with [ pcolor = gray ] [ ask neighbors with [ pcolor = white ] [set pcolor 9 ]]

end

to setup-patches-old


  ask patches with [pycor <= 79 and pycor >= 0 and pxcor = 0]
    [set pcolor blue]


  ask patches
    [ set pcolor white ]
  ask patches with [ pycor >= -30  and pycor >= 30]
  [ set pcolor grey ]
  ask patches with [ pycor <= -30  and pycor <= 30]
  [ set pcolor grey ]
  ask patches with [ pxcor >= -30  and pxcor >= 30]
  [ set pcolor grey ]
  ask patches with [ pxcor <= -30  and pxcor <= 30]
  [ set pcolor grey ]

  ask patches with [pycor <= 29  and pycor >= 0 and pxcor = 22 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= -11  and pycor >= -16 and pxcor = 03 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= 29  and pycor >= 07 and pxcor = -2 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= 29  and pycor >= 1 and pxcor = -15 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= 1  and pycor >= -6 and pxcor = -21 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= -21 and pycor >= -27 and pxcor = 12 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= -21 and pycor >= -27 and pxcor = -3 ]   ; vertical
    [ set pcolor black ]
  ask patches with [pycor <= -18 and pycor >= -22 and pxcor = -15 ]   ; vertical
    [ set pcolor black ]


  ask patches with [pxcor <= 29  and pxcor >= 04 and pycor = -16 ]   ; horizontal
    [ set pcolor black ]
  ask patches with [pxcor <= 4  and pxcor >= -2 and pycor = 06  ]   ; horizontal
    [ set pcolor black ]
  ask patches with [pxcor <= -15  and pxcor >= -20 and pycor = 1  ]   ; horizontal
    [ set pcolor black ]
  ask patches with [pxcor <= 18  and pxcor >= 12 and pycor = -21  ]   ; horizontal
    [ set pcolor black ]
  ask patches with [pxcor <= 3  and pxcor >= -3 and pycor = -21  ]   ; horizontal
    [ set pcolor black ]
  ask patches with [pxcor <= -15  and pxcor >= -29 and pycor = -22  ]   ; horizontal
    [ set pcolor black ]

  ask patches with [pxcor <= -3  and pxcor >= -14 and pycor = 30 ]   ; horizontal
    [ set pcolor lime ]
  ask patches with [pycor <= -22 and pycor >= -29 and pxcor = -30 ]   ; vertical
    [ set pcolor lime ]
  ask patches with [pycor <= -8 and pycor >= -15 and pxcor = 30 ]   ; vertical
    [ set pcolor lime ]

end


to Go
  if (not any? people with [pcolor != green]) [stop]

  ask people with [pcolor != green] [
    move2
  ]
  ask people with [pcolor = yellow] [move]
  ;ignite resolver problema ignite
  tick
end

to move
  face min-one-of patches with [pcolor = green] [distance myself]

  while [[pcolor] of patch-ahead 1 = gray] [
    right random 30
  ]

  forward 0.3

end

to move2
  face min-one-of patches with [pcolor = yellow] [distance myself]

  while [[pcolor] of patch-ahead 1 = gray] [
    right random 360
  ]

  forward 1.3

end

to-report new-direction
  let direction-quadrant ceiling (towards target / 90)
  if (direction-quadrant = 0) [
    set direction-quadrant 1
  ]

  report random 91 + (90 * (direction-quadrant - 1))
end

to walk
  let hall patches with [pycor <= 0 and pycor >= -10 and pxcor <= 0 and pxcor >= -10 ]
  ask people-on hall
  [ face one-of patches with [pxcor <= -3  and pxcor >= -14 and pycor = 30 ]]
end

to GoB

  ask people
    [face one-of patches with [pycor <= -22 and pycor >= -29 and pxcor = -29 ]
      fd 0.5  ]
  ask fires [

    ask neighbors4 with [pcolor = white ]
      [ ignite ] ]
  tick
end

to GoC
  ask people
    [face one-of patches with [pycor <= -8 and pycor >= -15 and pxcor = 29 ]
      fd 0.5 ]

  ask fires [

    ask neighbors4 with [pcolor = white ]
      [ ignite ] ]
  tick
end

to ignite
  ask fires [
    if count neighbors4 > 0 [
      ask neighbors4 with [pcolor = white or pcolor = yellow]
      [
        sprout-fires 1
        [ set color red ]
        set pcolor black
      ]
    ]
  ]
end

to avoid-walls

  ask people [
    if [pcolor] of patch-ahead 0.5 = black
    [ set heading ( heading ) fd 0.5 ]

    if [pcolor] of patch-ahead 0.5 = grey
    [ set heading ( - heading) fd 0.5 ]
  ]
  tick
end
