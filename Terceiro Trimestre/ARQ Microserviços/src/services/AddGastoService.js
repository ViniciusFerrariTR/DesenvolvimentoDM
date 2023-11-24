import expenseService from './ExpenseService';

class AddGastoService {
    addExpense(description, amount) {
        return expenseService.addExpense(description, amount);
    }
}

const addGastoService = new AddGastoService();
export default addGastoService;
