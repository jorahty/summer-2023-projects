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

export default function ForgotPasswordScreen() {
  const navigation = useNavigation();

  const [email, setEmail] = React.useState('');
  const [loading, setLoading] = React.useState(false);
  const [showResultModal, setShowResultModal] = React.useState(false);

  const { forgotPassword } = useSupabase();

  const onFinishTapped = () => {
    setShowResultModal(false);
    navigation.navigate('Login');
  };

  const onSendTapped = async () => {
    try {
      setLoading(true);
      await forgotPassword(email);
      setShowResultModal(true);
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
        <Text>Forgot password?</Text>
        <TextInput
          placeholder="Enter your email"
          onChangeText={(text) => setEmail(text)}></TextInput>
        <Button
          disabled={loading}
          onPress={() => onSendTapped()}
          title={loading ? 'Loading...' : 'Send'}
        />
        <Pressable onPress={() => navigation.navigate('Login')}>
          <Text>If you have an account, Sign in</Text>
        </Pressable>
        {/* <Alert
          isVisible={showResultModal}
          onClose={() => setShowResultModal(false)}
          TitleComponent={<TitleOne>Email sent</TitleOne>}
          ConfirmButtonComponent={
            <Button onPress={() => onFinishTapped()}>Ok</Button>
          }
        ></Alert> */}
      </ScrollView>
    </SafeAreaView>
  );
}
