import React from 'react';

const GastosList = ({ expenses }) => (
  <div>
    <h2>Lista de Despesas Mensais</h2>
    <ul>
      {gastos.map(gastos => (
        <li key={gastos.id}>
          {gastos.description} - R$ {gastos.amount}
        </li>
      ))}
    </ul>
  </div>
);

export default GastosList;