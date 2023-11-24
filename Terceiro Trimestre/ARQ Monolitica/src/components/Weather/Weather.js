import React, { useState } from 'react';
import { obterDadosClima } from '../../api/weatherApi';
import './Weather.css';

const Weather = () => {
    const [cidade, setCidade] = useState('');
    const [dadosClima, setDadosClima] = useState(null);

    const obterClima = async () => {
        try {
            const dados = await obterDadosClima(cidade);
            setDadosClima(dados);
        } catch (erro) {
            // Tratar o erro conforme necessário
        }
    };

    return (
        <div className="weather-container">
            <h2>Previsão do Tempo</h2>
            <label>
                Cidade:
                <input type="text" value={cidade} onChange={(e) => setCidade(e.target.value)} />
            </label>
            <button onClick={obterClima}>Obter Previsão</button>

            {dadosClima && (
                <div className="weather-info">
                    <h3>{dadosClima.cidade}</h3>
                    <p>Temperatura: {dadosClima.temperatura}°C</p>
                    <p>Condição: {dadosClima.condicao}</p>
                </div>
            )}
        </div>
    );
};

export default Weather;
