;Define tipo
breed [fires fire]
breed [people person]

;Define variaveis do agente people
people-own
[
  points
  state
  target
]

;Define um procedimento
to setup
  ca
  reset-ticks
  setup-patches
  setup-people
  setup-fires
end

;Insere pessoa
to setup-people
  set-default-shape people "person"
  ask n-of n-people (patches with [pcolor = white]) [sprout-people 1]
  ask people [ set color cyan ]
  ask people [ set points 2 ]
end

;Insere fogos
to setup-fires
  set-default-shape fires "fire"
  ask n-of 2 (patches with [pcolor = white or pcolor = yellow]) [sprout-fires 1]
  ask fires [ set color red set ycor 49]
end

;Desenhando o DEMAC
to setup-patches
  ask patches
  [
    ; Paredes Externas
    if pycor = 0 or pycor = 50 or pxcor = 50 or pxcor = 0 [ set pcolor gray ] 

    ; Saídas
    if pxcor = 50  and pycor > 0 and pycor < 5 [ set pcolor green] ; Saída à direita
    if pycor = 50  and pxcor > 20 and pxcor < 25 [ set pcolor green  ] ; Saída no topo

    ; Paredes Internas na Vertical no Lado Esquerdo
    if pxcor = 20 and pycor > 1 and pycor < 7 [ set pcolor gray ] 
    if pxcor = 20 and pycor > 9 and pycor < 17 [ set pcolor gray ] 
    if pxcor = 20 and pycor > 19 and pycor < 22 [ set pcolor gray ] 
    if pxcor = 20 and pycor > 24 and pycor < 28 [ set pcolor gray ] 
    if pxcor = 20 and pycor > 30 and pycor < 34 [ set pcolor gray ] 
    if pxcor = 20 and pycor > 36 and pycor < 43 [ set pcolor gray ] 
    if pxcor = 20 and pycor > 45 and pycor < 50 [ set pcolor gray ] 

    ; Paredes Internas na Vertical no Lado Direito
    if pxcor = 25 and pycor > 5 and pycor < 7 [ set pcolor gray ] 
    if pxcor = 25 and pycor > 9 and pycor < 17 [ set pcolor gray ]  
    if pxcor = 25 and pycor > 19 and pycor < 22 [ set pcolor gray ] 
    if pxcor = 25 and pycor > 24 and pycor < 28 [ set pcolor gray ] 
    if pxcor = 25 and pycor > 30 and pycor < 34 [ set pcolor gray ] 
    if pxcor = 25 and pycor > 36 and pycor < 43 [ set pcolor gray ] 
    if pxcor = 25 and pycor > 45 and pycor < 50 [ set pcolor gray ] 

    ; Paredes Internas na Horizontal no Lado Esquerdo
    if pxcor > 0 and pxcor < 20 and pycor = 14 [ set pcolor gray ] 
    if pxcor > 0 and pxcor < 20 and pycor = 21 [ set pcolor gray ] 
    if pxcor > 0 and pxcor < 20 and pycor = 25 [ set pcolor gray ] 
    if pxcor > 0 and pxcor < 20 and pycor = 32 [ set pcolor gray ] 
    if pxcor > 0 and pxcor < 20 and pycor = 39 [ set pcolor gray ] 

    ; Paredes Internas na Horizontal no Lado Direito
    if pxcor > 24 and pxcor < 50 and pycor = 5 [ set pcolor gray ] 
    if pxcor > 24 and pxcor < 50 and pycor = 14 [ set pcolor gray ] 
    if pxcor > 24 and pxcor < 50 and pycor = 21 [ set pcolor gray ] 
    if pxcor > 24 and pxcor < 50 and pycor = 25 [ set pcolor gray ] 
    if pxcor > 24 and pxcor < 50 and pycor = 32 [ set pcolor gray ] 
    if pxcor > 24 and pxcor < 50 and pycor = 39 [ set pcolor gray ] 

    ;Corredor
    if pxcor = 22 and pycor > 1 and pycor < 50 [ set pcolor yellow ] 
    if pxcor = 23 and pycor > 1 and pycor < 50 [ set pcolor yellow ] 
    if pxcor > 22 and pxcor < 50 and pycor = 3 [ set pcolor yellow ] 
    if pxcor > 22 and pxcor < 50 and pycor = 2 [ set pcolor yellow ] 
    
    ; Salas terão a cor branca
    if pcolor = black [ set pcolor white ]
  ]

  ask patches with [ pcolor = gray ] [ ask neighbors with [ pcolor = white ] [set pcolor 9 ]]
end

;Pessoas fugindo
to Go
  if (not any? people with [pcolor != green and pcolor != black and pcolor != red]) [stop]

  ;Se pessoas chegaram no amarelo elas vão pra saída
  ask people with [pcolor = yellow] [move2]
  
  ;Se pessoas não chegaram no amarelo elas vão pro corredor
  ask people with [pcolor != green] [
    move
  ] 
  ;Fogo
  ignite
  tick
end

; Pessoas fogem para o Corredor
to move
  face min-one-of patches with [pcolor = yellow] [distance myself]

  while [[pcolor] of patch-ahead 1 = gray] [
    right random 360
  ]
  forward 1.3
end

; Pessoas fogem para a saída
to move2
  face min-one-of patches with [pcolor = green] [distance myself]

  while [[pcolor] of patch-ahead 1 = gray] [
    right random 30
  ]
  forward 0.3
end

;Incendio
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

;Evitar paredes
to avoid-walls
  ask people [
    if [pcolor] of patch-ahead 0.5 = black
    [ set heading ( heading ) fd 0.5 ]

    if [pcolor] of patch-ahead 0.5 = grey
    [ set heading ( - heading) fd 0.5 ]
  ]
  tick
end
