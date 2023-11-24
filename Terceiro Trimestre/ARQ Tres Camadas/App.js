import React, { useState, useEffect } from 'react';
import ExpenseService from './services/ExpenseService';
import ExpenseList from './components/ExpenseList';
import AddExpenseForm from './components/AddExpenseForm';

const App = () => {
  const [expenses, setExpenses] = useState([]);

  useEffect(() => {
    setExpenses(ExpenseService.getExpenses());
  }, []);

  const handleAddExpense = (description, amount) => {
    ExpenseService.addExpense(description, amount);
    setExpenses(ExpenseService.getExpenses());
  };

  return (
    <div>
      <h1>Controle de Gastos</h1>
      <ExpenseList expenses={expenses} />
      <AddExpenseForm onAddExpense={handleAddExpense} />
    </div>
  );
};

export default App;
