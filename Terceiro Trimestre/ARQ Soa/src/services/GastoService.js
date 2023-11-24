class GastoService {
    constructor() {
        this.expenses = [];
    }

    getExpenses() {
        return this.expenses;
    }

    addExpense(description, amount) {
        const id = this.expenses.length + 1;
        const newExpense = { id, description, amount };
        this.expenses.push(newExpense);
        return newExpense;
    }
}

const gastoService = new GastoService();
export default gastoService;
