import React, { useState } from 'react';
import { ScrollView, Text, TextInput, View } from 'react-native';
import { supabase } from '../lib/supabase';
import Button from './common/Button';
import { colors, styles } from '../theme/theme';

export default function Auth() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);

  async function onSignIn() {
    setLoading(true);
    const { error } = await supabase.auth.signInWithPassword({
      email: email,
      password: password,
    });

    if (error) alert(error.message);
    setLoading(false);
  }

  async function onSignUp() {
    setLoading(true);
    const { error } = await supabase.auth.signUp({
      email: email,
      password: password,
    });

    if (error) alert(error.message);
    setLoading(false);
  }

  return (
    <ScrollView
      contentContainerStyle={{
        flex: 1,
        gap: 20,
        padding: 20,
      }}
      keyboardDismissMode="on-drag">
      <TextInput
        style={styles.textInput}
        onChangeText={(text) => setEmail(text)}
        value={email}
        placeholder="Email Address"
        placeholderTextColor={colors.darkGrey}
        autoCapitalize={'none'}
      />
      <TextInput
        style={styles.textInput}
        onChangeText={(text) => setPassword(text)}
        value={password}
        secureTextEntry={true}
        placeholder="Password"
        placeholderTextColor={colors.darkGrey}
        autoCapitalize={'none'}
      />
      <Button title="Sign in" disabled={loading} onPress={() => onSignIn()} />
      <Button title="Sign up" disabled={loading} onPress={() => onSignUp()} />
    </ScrollView>
  );
}
