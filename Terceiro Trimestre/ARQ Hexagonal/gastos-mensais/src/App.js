import React, { useState } from 'react';
import GastosForm from './components/GastosForm';
import GastosList from './components/GastosList';
import GastosServices from './services/GastosServices';

function App() {
  const [gastos, setGastos] = useState([]);
  const gastoService = new GastosServices();

  const addGasto = (gasto) => {
    gastoService.adicionarGasto(gasto);
    setGastos([...gastos, gasto]);
  };

  return (
    <div>
      <h1>Meus Gastos Mensais</h1>
      <GastosForm onAddGasto={addGasto} />
      <GastosList gastos={gastos}/>
    </div>
  );
}

export default App;
