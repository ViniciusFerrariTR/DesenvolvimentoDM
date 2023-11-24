# App de Receitas
Este é um aplicativo React Native que permite aos usuários buscar receitas com base nos ingredientes que possuem e visualizar os detalhes das receitas encontradas. O aplicativo utiliza a API Spoonacular para obter informações sobre as receitas.

## Modelo de Dados
O modelo de dados ModeloReceita é usado para representar uma receita e contém os seguintes campos:

* ID: Um identificador único para a receita.
* Título: O título da receita.
* Ingredientes que Faltam: Uma lista de ingredientes que estão faltando.
* Imagem: URL da imagem da receita.
* Ingredientes Utilizados: Uma lista de ingredientes que foram utilizados na receita.

## ViewModel
O ViewModel ViewModelReceita fornece métodos para buscar receitas por ingredientes. Ele utiliza a biblioteca Axios para fazer solicitações à API Spoonacular. Para autenticação, é necessário fornecer uma chave de API da Spoonacular (CHAVE_API_SPOONACULAR).

## View

### Tela Detalhes da Receita
Exibe os detalhes de uma receita, incluindo o título, ingredientes que faltam e a imagem.

### Tela Inicial
Permite aos usuários inserir uma lista de ingredientes separados por vírgulas.
Ao pressionar o botão "Buscar Receitas," o aplicativo chama o método buscarReceitasPorIngredientes do ViewModel.
Exibe uma lista de receitas resultantes em forma de botões que, quando clicados, navegam para a Tela Detalhes da Receita.

## Configuração de Navegação
A configuração de navegação é realizada usando a biblioteca React Navigation. As telas Tela Inicial e Tela Detalhes da Receita são definidas como componentes navegáveis. O aplicativo é inicializado com a Tela Inicial.

##  Como executar?
Para executar o aplicativo, apenas rode `npm run web`.

Antes, baixe as dependências:
* npm install.

Nota: Lembre-se de substituir a chave da API Spoonacular (CHAVE_API_SPOONACULAR) pela sua própria chave ao usar o aplicativo.
