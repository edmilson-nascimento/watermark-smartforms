# Marca da para smartforms (test mode) #

Em desenvolvimento...

[![N|Solid](https://wiki.scn.sap.com/wiki/download/attachments/1710/ABAP%20Development.png?version=1&modificationDate=1446673897000&api=v2)](https://www.sap.com/brazil/developer.html)

~~Quando Deus der coragem~~ Futuramente eu vou melhorar o codigo e mudar com uma boa documentação.
Exibição de marca da água para smartforms usando em formulários de modo de teste.

## Apresentar problema / Necessidade ##
De acordo com os Pedidos de Compras (que são acessados pela `ME23N`), será criada _Entrada de Mercadoria_ pela transação `MIRO` e depois a _Nota Fiscal_ (que pode ser acessada pela transação `J1B3N`). Houve a necessidade de que, antes disso, seja feita apenas uma simulação e os dados da _Nota Fiscal_ fossem recuperados para uma verificação, entender se esta da maneira esperada a configuração de Impostos ~~ou sei la mesmo porque o funcional inventou isso viu~~.

## Tecnologias adotada ##
- Smartforms
- Imagens
- Classes
- Upload
- 
~~A criação da classe sera para atender a necessidade e provera os dados de _Nota Fiscal_ caso seja preciso alguma validação referente a impostos.~~

## Solução (Solucoes possíveis) ##
.


## Solução proposta (SRP) ##
.

## Descrição dos passos ##



- Apresentar problema
- Solucoes possíveis
- Solução proposta (SRP)
- Descrição dos passos
- Topicos e fases
- Desenvolvimento e justificativa
- 

Este é problema que eu já me deparei com ele anteriormente. Desde primeira vez que eu encontrei isso, eu não tinha achado uma solução com a qual eu estava realmente confortável com o apresentado. Algumas limitações dos smartforms fazem com que eu fique limitado como inserir objetos na diagonal e também inserir algumas imagens com fundo transparente em alguns ambientes. Vide limitação de cada ambiente.

A coisa mágica de trabalhar com tecnologia é: ver como pessoas diferentes usam os mesmos recursos para criar soluções diferentes. Eu adoro trabalhar com tecnologia e adoro ver soluções diferentes baseadas no mesmo conhecimento que eu já tenho. Aqui vai uma das soluções que eu achei mais interessantes para termos levando em conta a utilização de um fundo transparente como uma marca da água.

A priori essa necessidade foi feita para, quando está fazendo testes em ambientes que não são de produção, possamos imprimir documentos e esses documentos não vão chegar por engano na mão das pessoas durante os nossos dias. Algumas das pessoas podem confundir isso e transportar esse documento para outras áreas da empresa assim que saiba que isso não tem nenhum valor fiscal. Como medida de segurança interessante que formulários terem uma marca da água ou algum tipo de informação que deixa específico que aquele documento não tem nenhum valor fiscal, ou para tomada de decisão, servindo apenas para base de teste e desenvolvimentos.

A primeira solução proposta, foi feito usando apenas uma janela na horizontal e assim poderia ser impressa alguma coisa do tipo: test machine. Eu entendo que uma mensagem mais clara do tipo a palavra “teste“ impressa na diagonal com a marca da água na página pode ser mais interessante para visualização rápida sobre a falta de veracidade daquele documento para tomada de decisões.

Ao conversar com um amigo (Marcio Pupak) fui informado de uma possível solução que pode ser interessante usando a opção de background da página. Depois de alguns testes notei que apesar de uma limitação (quando não precisar usar essa imagem mesmo usando dinâmico, eu devo passar algum tipo de imagem, pois o próprio algoritmo do smarforms não permite passar a imagem dinâmica com o campo vazio como deveria ser desconsiderado) eu devo colocar duas imagens diferentes para atender a necessidade de fundo de página. Em resumo a partir da hora que eu utilizar fundo de background como imagem, eu sempre devo passar uma imagem existente no ambiente isso deve ser verificado para que a gere `dump` na chamada do smartphone.
