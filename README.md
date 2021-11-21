# Recriando tela do App TodoMovies

## Descrição do Projeto 🚀
Recriando tela de detalhes do filme escolhido e listagem dos filmes semelhantes utilizando Swift 5.0.

<img src="https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/97/0e/e2/970ee217-13cf-1674-b016-461aca657663/pr_source.png/460x0w.png" width=250>

Foi utilizado a API [The Movie Database](https://www.themoviedb.org/) para trazer os detalhes do filme e os filmes similares.

## Status 🏁
Status do Projeto: Em desenvolvimento ⚠

## Tabela de Conteúdos 📌
   * [Descrição do Projeto](#descricao-projeto)
   * [Status](#status)
   * [Features](#features)
   * [Dados - API](#dados-api)
   * [Arquitetura e padroes de projeto](#arquitetura-e-padroes-de-projeto)
   * [Como rodar](#como-rodar)
   * [Como testar](#como-testar)
   * [Linguagens, libs e frameworks](#linguagens-libs-e-frameworks)
   
## Features 🛠
- [x] Tela de detalhes do filme escolhido construida com ViewCode e SwiftUI
- [x] Tela de listagem de filmes similares ao escolhido com ViewCode e SwiftUI
- [X] Consumir API [The Movie Database](https://www.themoviedb.org/) para trazer as informações do filme
- [ ] Melhoria no loading da TableView
- [ ] Utilizar uma lib para carregar as imagens trazidas pela API
- [ ] Layout responsivo em outros versões do Iphone
- [ ] Utilizar lib do Alamofire para consumir dados da rota do [The Movie Database](https://www.themoviedb.org/)
- [ ] Utilizar lib do RxSwift para construir o layout da tela
- [ ] Criacao de testes unitarios
- [ ] Adicionar efeito na banner do filme

## Dados - API 📚
Foi utilizado a API [The Movie Database](https://www.themoviedb.org/).

- View detalhes do filme - [Endpoint](https://developers.themoviedb.org/3/movies/get-movie-details)
- View filmes similares - [Endpoint](https://developers.themoviedb.org/3/movies/get-similar-movies)
- Listagem dos generos dos filmes - [Endpoint](https://developers.themoviedb.org/3/genres/get-movie-list)
- ID do filme escolhido: 550

## Arquitetura e padroes de projeto 🗺
Foi utilizada a arquitetura MVVM e principios do SOLID.
A estrutura de pasta conta com uma pasta chamada lib, que possui arquivos para reutilizacao de componentes na tela.

![Captura de Tela 2021-11-21 às 19 24 08](https://user-images.githubusercontent.com/55067295/142781760-637be958-1208-40dc-9b8f-16ed02c1fbdc.png)

## Como rodar 💻
Necessario possuir a IDE [Xcode](https://developer.apple.com/xcode/) instalado.
O projeto foi desenvolvido com a versão 12.4. da IDE.

No terminal, clone o projeto:

    SSH: git clone git@github.com:luizaccarvalho/AppTodoMovies4.git
    
Entre na pasta do projeto

    cd AppTodoMovies4
    
No terminal dentro da pasta do projeto digite

    xed .
    
Esse comando abre o arquivo do projeto direto na IDE Xcode.
Se caso nao der certo, abra a pasta do projeto AppTodoMovies4 e clique no arquivo `AppTodoMovies4.xcworkspace`

ATENÇÃO: 
No projeto possui a dependencia cocoapods e instalado as libs Alamofire e RxSwift, atualmente o projeto não as utiliza.
A utilizacao das libs Alamofire e RxSwift sao features a serem feitas para contribuir ainda mais com a utilizacao do projeto.

## Como testar 📱
Com o projeto aberto pela IDE do Xcode,
antes de rodar o projeto, escolher o modelo Iphone 8.
Em seguida rodar pelo compilador do Xcode, irá carregar a primeira e unica tela
com detalhes do filme Fight Club - Clube da Luta - (1999) e uma tabela com a listagem dos filmes similares a ele.

![Captura de Tela 2021-11-21 às 19 20 48](https://user-images.githubusercontent.com/55067295/142781778-cb4ad87a-f54a-4f8e-ba8f-5330b99f5042.png)

🚨 obs: É necessario clicar na tabela e arrastar para baixo para que sejam carregado os filmes similares.

## Linguagens, libs e frameworks ⚙
- [Swift](https://developer.apple.com/documentation/swift): versão 5.3.2 
- [SwiftUI](https://developer.apple.com/documentation/swiftui/)
- Em breve - [Cocoapods](https://cocoapods.org/): versão 1.11.2 
- Em breve - [Alamofire](http://cocoadocs.org/docsets/Alamofire/4.5.1/): versão xx.xxx 
- Em breve - [RxSwift](https://github.com/ReactiveX/RxSwift): versão 5 
