
import React from 'react';

const GastoList = ({ expenses }) => {
    return (
        <div>
            <h2>Lista de Gastos</h2>
            <ul>
                {expenses.map((expense) => (
                    <li key={expense.id}>
                        {expense.description}: R$ {expense.amount}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default GastoList;
