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
  ask n-of 2 (patches with [pcolor = white]) [sprout-fires 1]
  ask fires [ set color red set ycor 49]
end

to setup-patches
  ask patches
  [
    ; Setting the external walls
    if pycor = 0 or pycor = 50 or pxcor = 50 or pxcor = 0 [ set pcolor gray ] ; baundry walls

    ; Setting 3 exits
    if pxcor = 50  and pycor > 10 and pycor < 21 [ set pcolor green ] ; right exit
    if pxcor = 0  and pycor > 0 and pycor < 11 [ set pcolor green ] ; left exit
    if pycor = 50  and pxcor > 10 and pxcor < 22 [ set pcolor green ] ; top exit

    ; Setting interal walls
    if pxcor > 0 and pxcor < 25 and pycor = 12 [ set pcolor gray ] ; wall 1.1
    if pxcor = 24 and pycor > 11 and pycor < 18 [ set pcolor gray ] ; wall 1.2

    if pxcor = 10 and pycor > 30 and pycor < 50 [ set pcolor gray ] ; wall 2.1
    if pxcor = 7 and pycor > 20 and pycor < 30 [ set pcolor gray ] ; wall 2.2
    if pxcor > 6 and pxcor < 11 and pycor = 30 [ set pcolor gray ] ; wall 2.3
    if pxcor > 6 and pxcor < 11 and pycor = 20 [ set pcolor gray ] ; wall 2.4

    if pxcor = 22 and pycor > 30 and pycor < 50 [ set pcolor gray ] ; wall 3.1
    if pxcor > 21 and pxcor < 27 and pycor = 30 [ set pcolor gray ] ; wall 3.2

    if pxcor > 35 and pxcor < 50 and pycor = 9 [ set pcolor gray ] ; wall 4.1

    if pxcor = 41 and pycor > 20 and pycor < 51 [ set pcolor gray ] ; wall 5.1

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
  let hall patches with [pycor <= 0 and pycor >= -10 and pxcor <= 0 and pxcor >= -10 ]

   ask people
   [face one-of patches with [pycor <= 5 and pycor >= -5 and pxcor <= 5 and pxcor >= -5 ] fd 0.5 ]
   ask people-on hall
   [ face one-of patches with [pxcor <= -3  and pxcor >= -14 and pycor = 30 ]]
  people-move
   ignite

  tick
end

to people-move
  ask people [
    ifelse [pcolor] of patch-here = green
    [ set state "exited"]
    [
      ifelse [pcolor] of patch-here = 9
      [][]
      if patch-ahead 0 != nobody [
        ifelse [pcolor] of patch-ahead 0 = 9 [
        ]
        [
          face min-one-of (patches with [pcolor = green ]) [distance myself]
          fd 1
        ]
        pd
      ]
    ]



  ]

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
      ask neighbors4 with [pcolor = white ]
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
    [ set heading ( - heading ) fd 0.5 ]

    if [pcolor] of patch-ahead 0.5 = grey
    [ set heading ( - heading) fd 0.5 ]
  ]
  tick
end
