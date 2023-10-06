import React, { useState } from 'react';

const GastosForm = ({ addExpense }) => {
    const [description, setDescription] = useState('');
    const [amount, setAmount] = useState('');

    const handleSubmit = e => {
        e.preventDefault();
        if (!description || !amount) return;
        addGastos({ description, amount: parseFloat(amount) });
        setDescription('');
        setAmount('');
    };

    return (
        <div>
            <h2>Adicionar Despesa</h2>
            <form onSubmit={handleSubmit}>
                <label>
                    Descrição:
                    <input
                        type="text"
                        value={description}
                        onChange={e => setDescription(e.target.value)}
                    />
                </label>
                <br />
                <label>
                    Valor:
                    <input
                        type="number"
                        value={amount}
                        onChange={e => setAmount(e.target.value)}
                    />
                </label>
                <br />
                <button type="submit">Adicionar Despesa</button>
            </form>
        </div>
    );
};

export default GastosForm;