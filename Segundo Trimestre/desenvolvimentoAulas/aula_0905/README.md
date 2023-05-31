# Conteúdo
* Todo APP geralmente precisa salvar dados; Operações para manipular dados - CRUD; Relação CRUD com Widget.

# Pontos principais:
    * Formulário - recursos necessários
            Para que serve? Diferença e semelhanças entre Form e Container;
            Sintaxe, semântica e exemplificação prática;
            Campo: sintaxe, rótulo e dica do campo. Demostração prática;
            Botão: sintaxe, rótulo e definindo ação. Demostração prática;
            Mensagem (ScaffoldMessenger): sintaxe, por qual motivo precisa-se do context e outros parâmetros. Demonstração prática;

    * Como recuperar o valor de um campo e apresentar na mensagem;
            Editor do campo (TextEditingController): sintaxe, semântica, demonstração prática;
            Associando o editor ao campo;

    * Definindo restrições
            Validação reativa e passiva: conceitos, diferenças, quando utilizar, como funciona e cuidados necessários;
            Validações do campo (validate): sintaxe, semântica, cuidados e demonstração prática;
            Definindo mensagem de erro;

    * Validação passiva do formulário - demostração prática
            Passos necessários e a sequência lógica correta para validar campos;
            Por qual motivo precisamos ter a referência do formulário?
            Como ter a referência de um formulário - GlobalKey;
            Por qual motivo tipar uma chave (GlobalKey)?
            GlobalKey - sintaxe, definição, associação ao Form;
            Invocando validações dos campos no clique do botão (currentState.validate);

    * KeyboardType
            Importância, usabilidade, sintaxe e demonstração prática;
            Como definir o tipo numérico, telefone, e-mail e outros (TextInputType);

    * Restrigindo quantidade de caracteres (maxLength);

    * Validação de entrada, máscara e formatação
            Conceitos entre permissão, restrição e formato definido.
            Restrição pela entrada de dados (inputFormatters)
            Definindo campo numérico (FilteringTextInputFormatter.digitsOnly)
            Definindo campo com a entrada do que é permitido (FilteringTextInputFormatter.allow)
            Definindo campo com a entrada do que não é permitido (FilteringTextInputFormatter.deny)
            Trabalhando com Expressões Regulares - FilteringTextInputFormatter.allow(RegExp(r'[1235465]')

    * Definindo campo com formato definido - CPF, CNPJ, CEP e outros (MaskTextInputFormatter)
            Conceitos de plugin;
            Repositório oficional (pub.dev);
            Como escolher um plugin;
            Instalação do plugin no projeto. Compatibilidade de versões. Inserção da referência manual. Inserção por meio do comando;
            Demonstração prática: definindo máscara, inserindo a máscada no campo;