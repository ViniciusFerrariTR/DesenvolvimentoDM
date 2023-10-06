// controllers/GastoController.js
import GastoModel from '../model/GastoModel'; // Substitua pelo nome do modelo real que você tenha

class GastoController {
  model = new GastoModel(); // Substitua pelo nome do modelo real que você tenha

  async addGasto(description, amount) {
    try {
      await this.model.addGasto(description, amount);
    } catch (error) {
      throw error;
    }
  }

  getGastos() {
    return this.model.getGastos();
  }
}

export default GastoController;
