import React from 'react';

function GastosList({ gastos }) {
    return (
        <div>
            <h2>Lista de Despesas</h2>
            <ul>
                {gastos.map((gasto, index) => (
                    <li key={index}>
                        {gasto.description} - R$ {gasto.amount} - {gasto.date}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default GastosList;
