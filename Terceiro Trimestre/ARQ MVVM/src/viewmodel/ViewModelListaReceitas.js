import axios from 'axios';
import ModeloReceita from '../model/ModeloReceita';

const CHAVE_API_SPOONACULAR = '795ea7d4fb8249de9b0c3512e0b7487f'; // Substitua pela sua chave de API

class ViewModelReceita {
    async buscarReceitasPorIngredientes(ingredientes) {
        try {
            const resposta = await axios.get(
                `https://api.spoonacular.com/recipes/findByIngredients?ingredients=${ingredientes.join(',')}&number=10&apiKey=${CHAVE_API_SPOONACULAR}`
            );

            const receitas = resposta.data.map((receita) => {
                return new ModeloReceita(
                    receita.id,
                    receita.title,
                    receita.missedIngredients,
                    receita.image,
                    receita.usedIngredients
                );
            });

            return receitas;
        } catch (erro) {
            console.error('Erro ao buscar receitas por ingredientes:', erro);
            return [];
        }
    }
}

export default new ViewModelReceita();
