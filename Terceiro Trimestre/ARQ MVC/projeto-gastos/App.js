// App.js
import React, { useState } from 'react';
import GastosLista from './components/GastosLista';
import GastosForm from './components/GastosForm';

const App = () => {
  const [gastos, setGastos] = useState([]);

  const addGastos = gasto => {
    setGastos([...gastos, { ...gasto, id: Date.now() }]);
  };

  return (
    <div>
      <ExpenseList gastos={gastos} />
      <ExpenseForm addGastos={addGastos} />
    </div>
  );
};

export default App;
