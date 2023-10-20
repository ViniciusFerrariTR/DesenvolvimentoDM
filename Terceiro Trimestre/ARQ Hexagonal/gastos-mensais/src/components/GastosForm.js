import React, { useState } from 'react';

function GastosForm({ onAddGasto }) {
    const [descricao, setDescricao] = useState('');
    const [valor, setValor] = useState('');

    const handleAddGasto = () => {
        onAddGasto({ descricao, valor: parseFloat(valor) });
        setDescricao('');
        setValor('');
    };

    return (
        <div>
            <h2>Adicionar Gasto</h2>
            <input
                type="text"
                placeholder="Descrição"
                value={descricao}
                onChange={(e) => setDescricao(e.target.value)}
            />
            <input
                type="number"
                placeholder="Valor"
                value={valor}
                onChange={(e) => setValor(e.target.value)}
            />
            <button onClick={handleAddGasto}>Adicionar</button>
        </div>
    );
}

export default GastosForm;
