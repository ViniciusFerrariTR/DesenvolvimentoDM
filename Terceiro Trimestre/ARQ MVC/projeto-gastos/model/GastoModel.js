
class GastoModel {
  constructor() {
    this.gastos = [];
  }

  async addGasto(description, amount) {
    if (!description || !amount) {
      throw new Error('Descrição e valor são obrigatórios.');
    }

    const newGasto = {
      id: Date.now(),
      description,
      amount: parseFloat(amount),
    };

    this.gastos.push(newGasto);
  }

  getGastos() {
    return this.gastos;
  }
}

export default GastoModel;
