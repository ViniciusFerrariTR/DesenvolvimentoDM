# Aplicação para previsão do tempo

Esta aplicação monolítica fornece informações de previsão do tempo com base em uma cidade específica. Utiliza a API OpenWeatherMap para obter dados climáticos em tempo real. Abaixo estão os principais componentes e funcionalidades:

## Componentes Principais

### Weather Component:

* Responsável por exibir a interface do usuário para inserir uma cidade e exibir a previsão do tempo;
* Utiliza o módulo axios para fazer requisições à API OpenWeatherMap;
* Localizado em src/components/Weather/Weather.js.

### App Component:

* Ponto de entrada da aplicação React Native;
* Renderiza o componente Weather para exibir a interface de previsão do tempo;
* Localizado em App.js.

## Funcionalidades Principais

### Obtenção de Dados Climáticos:

* A função obterDadosClima na pasta api/weatherApi.js utiliza a API OpenWeatherMap para obter informações climáticas;
* A cidade é inserida pelo usuário na interface.

### Interface do Usuário:

* A interface permite que o usuário insira o nome da cidade;
* Ao pressionar o botão "Obter Previsão", a aplicação exibe a temperatura e condição climática da cidade inserida.

## Estilização:
* O estilo da aplicação é definido no arquivo Weather.css, aplicando um design responsivo e amigável.

## Execução e instalação

* Certifique-se de ter o React e React Native instalados globalmente;
* Execute npm install para instalar as dependências;
* Execução Web (React):
** Execute npm run web para iniciar a aplicação React.

## Observações:

* A aplicação utiliza a arquitetura monolítica, facilitando o desenvolvimento e a manutenção de uma única base de código;
* A aplicação React Native permite a execução em plataformas móveis, proporcionando uma experiência de usuário consistente em diferentes dispositivos.