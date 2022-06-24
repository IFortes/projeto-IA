# Sistema multiagente para detecção de incêndio
Projeto final de IA

O principal objetivo do trabalho é fazer uma simulação de um ambiente em que possa ocorrer incêndios, e a IA seria responsável por tomar alguma atitude ao detectar algum deles, podendo acionar um alerta, mandar um sinal ou telefonema para os agentes ambientais, polícia ambiental ou corpo de bombeiros mais próximo do ambiente alertando sobre o incêndio, proporções, localização e área afetada. A IA também poderia emitir alertas aos aplicativos de trânsito, evitando rotas de viagem pela área atingida, diminuindo assim o tráfego no local e auxiliando a ação dos bombeiros.

A técnica de inteligência artificial para aplicação será trabalhar com a ideia de agentes e sistemas multiagentes. Agentes são entidades que estão em constante interação com o ambiente, recebendo informações através de sensores e podendo agir sobre ele através de efetuadores. Os agentes racionais podem ser capazes de fazer a melhor escolha possível no momento de tomada de decisão, escolhendo segundo seu conhecimento prévio, as ações que satisfazem seu objetivo.

Para modelar o problema descrito utilizando os conceitos de IA, utilizaremos a plataforma NetLogo.

Foi modelado dois cenários. Sendo um de ambiente aberto (floresta) e outro de ambiente fechado.
O Departamento de Estatística, Matemática Aplicada e Computação da UNESP Rio Claro representa um ambiente fechado e com muitas condições que poderiam auxiliar na propagação do incêndio por todo o local, assim poderia-se simular como as pessoas se orientariam para sair do departamento em segurança. Nele iremos representar, 4 laboratórios didáticos que possuem computadores, mesas e cadeiras, elementos que podem alastrar o incêndio e 4 laboratórios temáticos,um com elementos de robótica, um como elementos de hardware (peças de microprocessadores), um com elementos de redes e um com elementos de eletrônica, o fogo que irá se expandir por todo o DEMAC e as pessoas, que será um número variável.

O cenário de floresta é ideal para simular como um agente sinalizador atuaria recebendo informações de aumento de temperatura e aumento de substâncias tóxicas no ar, como por exemplo, o CO2 e também como ele poderia enviar um sinal representativo para que autoridades locais possam perceber o início do incêndio. Deste modo, iremos simular um ambiente que representará a vegetação da floresta, o fogo que irá queimá-la e um sinalizador.

Portanto, cada cenário será simulado no NetLogo, cada um com sua característica própria. O cenário do DEMAC será desenvolvido a partir do modelo desenvolvido por Muhammad Tausif [1], enquanto o cenário da floresta terá como base um modelo disponibilizado pela biblioteca do Netlogo [2]  para seu desenvolvimento.

#Referências
[1]NetLogo Modeling Commons. (2022). fire-evacuation-updated. [Online].
Disponível: http://modelingcommons.org/browse/one_model/6137#model_tabs_browse_info
Acesso em 14 de Junho, 2022.

[2]NetLogo. (2022). Fire - NetLogo Models Library. [Online].
Disponível: https://ccl.northwestern.edu/netlogo/models/Fire
Acesso em 14 de Junho, 2022.
