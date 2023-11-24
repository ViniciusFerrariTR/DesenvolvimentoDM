
class AddGastoService {
    addObserver(observer) {
        this.observer = observer;
    }

    addExpense(description, amount) {
        const newExpense = this.observer.addExpense(description, amount);
        return newExpense;
    }
}

const addGastoService = new AddGastoService();
export default addGastoService;
