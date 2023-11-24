import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import TelaInicial from './telas/TelaInicial';
import TelaDetalhesReceita from './src/view/ViewListaReceitas';

const Stack = createStackNavigator();

function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="TelaInicial">
        <Stack.Screen name="TelaInicial" component={TelaInicial} />
        <Stack.Screen name="DetalhesReceita" component={TelaDetalhesReceita} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
