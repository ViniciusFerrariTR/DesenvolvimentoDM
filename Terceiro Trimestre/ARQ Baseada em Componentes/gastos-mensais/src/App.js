import React, { useState } from 'react';
import './App.css';
import GastosForm from './GastosForm';
import GastosList from './GastosList';

function App() {
  const [expenses, setExpenses] = useState([]);

  const addExpense = (expense) => {
    setExpenses([...expenses, expense]);
  };

  return (
    <div className="App">
      <GastosForm onAddExpense={addExpense} />
      <GastosList expenses={expenses} />
    </div>
  );
}

export default App;
