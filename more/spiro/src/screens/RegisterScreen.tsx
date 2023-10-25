import React from 'react';
import {
  Button,
  Pressable,
  SafeAreaView,
  ScrollView,
  Text,
  TextInput,
} from 'react-native';
import { useNavigation } from '@react-navigation/native';

import { useSupabase } from '../context/useSupabase';

export default function RegisterScreen() {
  const navigation = useNavigation();

  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [loading, setLoading] = React.useState(false);

  const { register } = useSupabase();

  const onSignUpTapped = async () => {
    try {
      setLoading(true);
      await register(email, password);
      navigation.navigate('Login');
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <ScrollView
        contentContainerStyle={{ padding: 20, gap: 20 }}
        keyboardDismissMode="on-drag">
        <Text>Sign up</Text>
        <TextInput
          placeholder="Enter your email"
          onChangeText={(text) => setEmail(text)}></TextInput>
        <TextInput
          placeholder="Enter your password"
          secureTextEntry={true}
          onChangeText={(text) => setPassword(text)}></TextInput>
        <Button
          disabled={loading}
          onPress={() => onSignUpTapped()}
          title={loading ? 'Loading...' : 'Sign up'}
        />
        <Pressable onPress={() => navigation.navigate('Login')}>
          <Text>If you have an account, Sign in</Text>
        </Pressable>
      </ScrollView>
    </SafeAreaView>
  );
}
