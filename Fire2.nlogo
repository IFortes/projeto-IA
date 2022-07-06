;Globais
globals [
  initial-trees   ;; Arvores - verdes
  burned-trees    ;; Arvores queimdas
  setup-patches
]

; Tipos
breed [fires fire]    ;; Fogo - vermelho
breed [embers ember]  ;; Brasa - preto

to setup
  clear-all
  set-default-shape turtles "square"
  ; Aumentar densidade da floresta
  ask patches with [(random-float 100) < density]
    [ set pcolor green ]
  ; Arvores em chamas
  ask patches with [pxcor = min-pxcor]
    [ ignite ]
  ask patches
  [
     if pxcor >  100 and pxcor < 120  and pycor > 100 and pycor < 120
    [set pcolor yellow]
  ]
  ; Contagem de arvores
  set initial-trees count patches with [pcolor = green]
  set burned-trees 0
  reset-ticks

end

;Iniciar incendio
to go
  if not any? turtles  ;; Fogo ou brasa
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

; Fogo
to ignite  
  sprout-fires 1
    [ set color red ]
  set pcolor black
  set burned-trees burned-trees + 1
end

; Efeito para o fogo enquanto queima
to fade-embers
  ask embers
    [ set color color - 0.3  ;Vermelho mais escuro 
      if color < red - 3.5     ;; Quase no preto
        [ set pcolor color
          die ] ]
end
;Sinal amarelo
to signal
  ask patches
  [
     if pxcor >  100 and pxcor < 120  and pycor > 100 and pycor < 120 and pcolor = yellow
    [set pcolor orange]
  ]
end
;Sinal vermelho
to signal2
  ask patches
  [

    if pxcor >  100 and pxcor < 120  and pycor > 100 and pycor < 120 and pcolor = orange
    [set pcolor yellow]
  ]
end
; Copyright 1997 Uri Wilensky.
; See Info tab for full copyright and license.
