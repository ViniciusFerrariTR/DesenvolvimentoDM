import React from 'react';

function GastosList({ gastos, totalGastos }) {
    return (
        <div>
            <h2>Lista de Gastos</h2>
            <ul>
                {gastos.map((gasto, index) => (
                    <li key={index}>
                        {gasto.descricao}: R$ {gasto.valor}
                    </li>
                ))}
            </ul>
            <p>Total de Gastos: R$ {totalGastos}</p>
        </div>
    );
}

export default GastosList;
