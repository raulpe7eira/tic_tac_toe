# Tic-Tac-Toe (vlab for [https://pluga.co/](https://pluga.co/))

Um pequeno projeto para testar minhas habilidades.

![frontend-scshot](../master/scshot/frontend-scshot.png)

## Instalação

### Pré-requisitos

Ter instalado localmente (apenas p/ Desenvolvimento e Teste):
- [Git](https://git-scm.com/)
- [Ruby](https://ruby-lang.org)
- [Bundle](http://bundler.io/)
- [RubyGems](https://rubygems.org/)

### Instalando dependências

```bash
$ git clone https://github.com/raulpereira/tic_tac_toe.git
$ cd tic_tac_toe
$ bundle install
```

## Subir & Rodar

### Ambiente de desenvolvimento

```bash
$ ruby -ILib bin/console
```
![dsv-scshot](../master/scshot/dsv-scshot.png)

### Ambiente de teste

```bash
$ rspec
```

![tst-scshot](../master/scshot/tst-scshot.png)

### Ambiente de produção

`Os testes precisam ser finalizados para geração de uma Gem pública` :disappointed_relieved:

## Considerações

### Linguagem

**[Ruby](https://ruby-lang.org)**: Foi uma escolha determinada pelo desafio, decidi encarar mesmo tendo pouca domínio com essa linguagem e mais uma vez tive boas surpresas no estudo de caso.

### Estrutura

**[RubyGems](https://rubygems.org/)**: A primeira decisão para organizar o código inicial foi coloca-lo em uma nova Gem, o intuito inicial era apenas usar alguma Gem para testes automáticos, mas depois gostei da idéia de publicar o código numa conta pública, além de forçar a organização inicial.

### Frontend

**[ANSI Color codes](https://en.wikipedia.org/wiki/ANSI_escape_code)**: Para melhorar a interface com o usuário, resolvi adotar cores e criar um simulador para a jogada do computador, porém essa parte especificamente deveria estar mais isolada do código, esta muito misturado com a lógica do jogo, como melhoria da organização, separaria toda interface até para implementar internacionalização ou customizações de cores por parte do usuário.

### Testes

**[RSpec](http://rspec.info/)**: Toda a estrutura criada para as peças e jogadores estão cobertas, única entidade que ficou faltando cobrir foi o jogo em si (`game.rb`), fator que determinou a não publicação do código em produção no momento.

## Conclusão

Apesar de não ter concluído o teste como gostaria, aprendi diversos conceitos que a linguagem proporciona e que não tinha reparado nos projetos [Rails](http://rubyonrails.org/) que havia desenvolvido anteriormente. Outro ponto positivo deste trabalho foi o primeiro contato com ferramentas de testes automatizados para a linguagem, sem dúvida este foi o tópico que mais dediquei meu tempo e graças a esta dedicação encontrei alguns bugs que iriam passar desapercebido. Continuo feliz no estudo da linguagem, sinal que continuará sendo minha fonte de estudos atual.

**VAMOS QUE VAMOS!** :muscle:
