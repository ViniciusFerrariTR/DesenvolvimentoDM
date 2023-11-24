class ExpenseService {
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
    }
}

const expenseService = new ExpenseService();
export default expenseService;
