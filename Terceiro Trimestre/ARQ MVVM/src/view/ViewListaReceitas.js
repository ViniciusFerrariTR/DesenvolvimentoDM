import React from 'react';
import { View, Text } from 'react-native';

function TelaDetalhesReceita({ route }) {
    const { receita } = route.params;

    return (
        <View>
            <Text>Título: {receita.titulo}</Text>
            <Text>Ingredientes que faltam: {receita.ingredientesFaltando.map((ingrediente) => ingrediente.original).join(', ')}</Text>
            <Text>Imagem: {receita.image}</Text>
            {/* Adicione aqui a exibição de outros detalhes da receita, se necessário */}
        </View>
    );
}

export default TelaDetalhesReceita;
