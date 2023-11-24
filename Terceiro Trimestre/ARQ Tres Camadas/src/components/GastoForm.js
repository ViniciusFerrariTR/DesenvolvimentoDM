import React, { useState } from 'react';

const GastoForm = ({ onAddExpense }) => {
    const [description, setDescription] = useState('');
    const [amount, setAmount] = useState('');

    const handleSubmit = (e) => {
        e.preventDefault();
        if (description && amount) {
            onAddExpense(description, parseFloat(amount));
            setDescription('');
            setAmount('');
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Descrição:
                <input type="text" value={description} onChange={(e) => setDescription(e.target.value)} />
            </label>
            <label>
                Valor:
                <input type="number" value={amount} onChange={(e) => setAmount(e.target.value)} />
            </label>
            <button type="submit">Adicionar Gasto</button>
        </form>
    );
};

export default AddExpenseForm;
