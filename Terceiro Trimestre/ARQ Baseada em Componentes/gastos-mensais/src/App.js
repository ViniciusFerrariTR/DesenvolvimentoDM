import React, { useState } from 'react';
import './App.css';
import GastosForm from './GastosForm';
import GastosList from './GastosList';

function App() {
  const [gastos, setGastos] = useState([]);

  const addGasto = (gasto) => {
    setGastos([...gastos, gasto]);
  };

  return (
    <div className="App">
      <GastosForm onAddGasto={addGasto} />
      <GastosList gastos={gastos} />
    </div>
  );
}

export default App;
