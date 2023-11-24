import axios from 'axios';

const apiKey = '694b079e4a61424269d8cce0ca544868';

export const obterDadosClima = async (cidade) => {
  try {
    const resposta = await axios.get(`https://api.openweathermap.org/data/2.5/weather`, {
      params: {
        q: cidade,
        appid: apiKey,
        units: 'metric', // Use 'imperial' para Fahrenheit
      },
    });

    return {
      cidade: resposta.data.name,
      temperatura: resposta.data.main.temp,
      condicao: resposta.data.weather[0].description,
    };
  } catch (erro) {
    console.error('Erro ao obter dados de previsão do tempo:', erro);
    throw erro;
  }
};
