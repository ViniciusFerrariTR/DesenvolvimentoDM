# Aplicativo de Busca de Fotos com React Native
Este é um aplicativo React Native simples que permite aos usuários buscar fotos com base em palavras-chave. A aplicação utiliza a API gratuita do Unsplash para recuperar imagens e exibi-las na interface de usuário.

## Requisitos
* Node.js e npm (ou yarn) instalados em seu sistema.
* Registro e obtenção de uma chave de API no Unsplash (https://unsplash.com/developers).

## Configuração
Clone o repositório ou inicie um novo projeto React Native.

Instale as dependências usando o comando: `npm install`

Configure sua chave de API do Unsplash no arquivo buscarFotos.js no diretório src/services. Substitua `SUA_CHAVE_DE_API_DO_UNSPLASH` pela chave de API que você obteve.

## Uso

Utilize o comando `npm run web`.

## Funcionalidades
* Insira uma palavra-chave na barra de pesquisa;
* Toque no botão "Buscar Fotos" para buscar imagens relacionadas à palavra-chave;
* As imagens são exibidas em uma lista rolável;
* Toque em uma imagem para ver em tela cheia ou implemente funcionalidades adicionais.

## Estrutura de Pastas
A estrutura de pastas do projeto está organizada da seguinte forma:

* src/: Contém o código-fonte do aplicativo.
** components/: Contém os componentes de interface de usuário, incluindo o componente de busca de fotos.
** services/: Contém a função para buscar fotos da API do Unsplash.
* App.js: É o ponto de entrada principal da aplicação.

## Personalização
Você pode personalizar a aplicação adicionando recursos como navegação entre telas, estados de carregamento, tratamento de erros e funcionalidades adicionais para melhor atender às suas necessidades.