// src/App.js
import React, { useState, useEffect } from 'react';
import GastoModel from './model/GastoModel';
import GastoList from './components/GastoList';
import GastoController from './controllers/GastoController';

const App = () => {
  const [expenses, setExpenses] = useState([]);
  const expenseController = new ExpenseController();

  useEffect(() => {
    expenseController.register((updatedExpenses) => {
      setExpenses(updatedExpenses);
    });
  }, []);

  const handleAddExpense = (description, amount) => {
    expenseController.addExpense(description, amount);
  };

  return (
    <div>
      <h1>Controle de Gastos</h1>
      <ExpenseList expenses={expenses} />
      <button onClick={() => handleAddExpense('Comida', 20)}>Adicionar Gasto</button>
    </div>
  );
};

export default App;
