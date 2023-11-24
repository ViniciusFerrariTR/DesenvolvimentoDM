
import React, { useState, useEffect } from 'react';
import ExpenseService from './services/ExpenseService';
import AddExpenseService from './services/AddExpenseService';
import ExpenseList from './components/ExpenseList';

const App = () => {
  const [expenses, setExpenses] = useState([]);

  useEffect(() => {
    setExpenses(ExpenseService.getExpenses());

    AddExpenseService.addObserver({
      addExpense: (description, amount) => {
        const newExpense = ExpenseService.addExpense(description, amount);
        setExpenses([...expenses, newExpense]);
      },
    });
  }, [expenses]);

  const handleAddExpense = (description, amount) => {
    AddExpenseService.addExpense(description, amount);
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
