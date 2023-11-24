class GastoController {
  constructor() {
    this.expenses = [];
    this.callbacks = [];
  }

  addExpense(description, amount) {
    const id = this.expenses.length + 1;
    const newExpense = { id, description, amount };
    this.expenses.push(newExpense);
    this.notify();
  }

  register(callback) {
    this.callbacks.push(callback);
  }

  notify() {
    this.callbacks.forEach((callback) => callback(this.expenses));
  }
}

export default GastoController;
