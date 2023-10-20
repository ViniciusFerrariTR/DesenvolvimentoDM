import React, { useState } from 'react';

function GastosForm({ onAddGasto }) {
    const [description, setDescription] = useState('');
    const [amount, setAmount] = useState('');
    const [date, setDate] = useState('');

    const handleAddGasto = () => {
        onAddGasto({
            description,
            amount: parseFloat(amount),
            date,
        });
        setDescription('');
        setAmount('');
        setDate('');
    };

    return (
        <div>
            <h2>Adicionar Despesa</h2>
            <input
                type="text"
                placeholder="Descrição"
                value={description}
                onChange={(e) => setDescription(e.target.value)}
            />
            <input
                type="number"
                placeholder="Valor"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
            />
            <input
                type="date"
                value={date}
                onChange={(e) => setDate(e.target.value)}
            />
            <button onClick={handleAddGasto}>Adicionar</button>
        </div>
    );
}

export default GastosForm;
