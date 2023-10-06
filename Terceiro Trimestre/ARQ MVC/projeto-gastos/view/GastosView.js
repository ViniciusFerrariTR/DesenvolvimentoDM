// components/GastosView.js
import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';

const GastosView = () => {
  const [gastos, setGastos] = useState([]);
  const [description, setDescription] = useState('');
  const [amount, setAmount] = useState('');

  const addGastos = () => {
    if (!description || !amount) {
      return;
    }

    const newGastos = {
      id: Date.now(),
      description,
      amount: parseFloat(amount),
    };

    setGastos([...gastos, newGastos]);
    setDescription('');
    setAmount('');
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Controle de Gastos Mensais</Text>
      <View style={styles.inputContainer}>
        <Text style={styles.label}>Descrição:</Text>
        <TextInput
          style={styles.input}
          value={description}
          onChangeText={(text) => setDescription(text)}
          placeholder="Descrição"
        />
      </View>
      <View style={styles.inputContainer}>
        <Text style={styles.label}>Valor:</Text>
        <TextInput
          style={styles.input}
          value={amount}
          onChangeText={(text) => setAmount(text)}
          keyboardType="numeric"
          placeholder="Valor"
        />
      </View>
      <Button title="Adicionar Despesa" onPress={addGastos} />
      <View style={styles.gastoList}>
        <Text style={styles.listTitle}>Lista de Despesas:</Text>
        {gastos.map((gasto) => (
          <View key={gasto.id} style={styles.GastosItem}>
            <Text>{gasto.description}</Text>
            <Text>R$ {gasto.amount.toFixed(2)}</Text>
          </View>
        ))}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  inputContainer: {
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    marginBottom: 5,
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 5,
    paddingHorizontal: 10,
    height: 40,
  },
  gastoList: {
    marginTop: 20,
  },
  listTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  gastoItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 5,
  },
});

export default GastosView;
