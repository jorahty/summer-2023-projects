import { Button, Text, View } from 'react-native';
import { useSupabase } from '../context/useSupabase';

export default function HomeScreen() {
  const { logout } = useSupabase();
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Welcome!</Text>
      <Button onPress={() => logout()} title="Logout" />
    </View>
  );
}
