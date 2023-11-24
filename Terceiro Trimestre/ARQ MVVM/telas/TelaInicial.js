import React, { useState, useEffect } from 'react';
import { View, Text, Button, FlatList, TextInput } from 'react-native';
import ViewModelListaReceitas from '../src/viewmodel/ViewModelListaReceitas';

function TelaInicial({ navigation }) {
    const [ingredientes, setIngredientes] = useState([]);
    const [receitas, setReceitas] = useState([]);

    const buscarReceitas = async () => {
        if (ingredientes.length > 0) {
            const novasReceitas = await ViewModelListaReceitas.buscarReceitasPorIngredientes(ingredientes);
            setReceitas(novasReceitas);
        }
    };

    return (
        <View>
            <Text>Receitas por Ingredientes</Text>
            <TextInput
                placeholder="Digite os ingredientes (separados por vírgula)"
                onChangeText={(texto) => setIngredientes(texto.split(','))}
            />
            <Button title="Buscar Receitas" onPress={buscarReceitas} />
            <FlatList
                data={receitas}
                keyExtractor={(item) => item.id.toString()}
                renderItem={({ item }) => (
                    <Button
                        title={item.titulo}
                        onPress={() => navigation.navigate('DetalhesReceita', { receita: item })}
                    />
                )}
            />
        </View>
    );
}

export default TelaInicial;
