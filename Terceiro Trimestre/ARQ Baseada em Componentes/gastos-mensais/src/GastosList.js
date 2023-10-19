import React from 'react';

function GastosList({ expenses }) {
    return (
        <div>
            <h2>Lista de Despesas</h2>
            <ul>
                {expenses.map((expense, index) => (
                    <li key={index}>
                        {expense.description} - R$ {expense.amount} - {expense.date}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default GastosList;
