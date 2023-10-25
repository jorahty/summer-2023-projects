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
import * as WebBrowser from 'expo-web-browser';
import * as SecureStore from 'expo-secure-store';

import { useSupabase } from '../context/useSupabase';

export default function LoginScreen() {
  const { login, getGoogleOAuthUrl, setOAuthSession } = useSupabase();
  const [email, setEmail] = React.useState('');
  const [password, setPassword] = React.useState('');
  const [loading, setLoading] = React.useState(false);
  const navigation = useNavigation();

  React.useEffect(() => {
    WebBrowser.warmUpAsync();

    return () => {
      WebBrowser.coolDownAsync();
    };
  }, []);

  const onSignInTapped = async () => {
    try {
      setLoading(true);
      await login(email, password);
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  const onSignInWithGoogle = async () => {
    setLoading(true);
    try {
      const url = await getGoogleOAuthUrl();
      if (!url) return;

      const result = await WebBrowser.openAuthSessionAsync(
        url,
        'spiro://google-auth?',
        {
          showInRecents: true,
        }
      );

      if (result.type === 'success') {
        const data = extractParamsFromUrl(result.url);

        if (!data.access_token || !data.refresh_token) return;

        setOAuthSession({
          access_token: data.access_token,
          refresh_token: data.refresh_token,
        });

        // You can optionally store Google's access token if you need it later
        SecureStore.setItemAsync(
          'google-access-token',
          JSON.stringify(data.provider_token)
        );
      }
    } catch (error) {
      // Handle error here
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  const extractParamsFromUrl = (url: string) => {
    const params = new URLSearchParams(url.split('#')[1]);
    const data = {
      access_token: params.get('access_token'),
      expires_in: parseInt(params.get('expires_in') || '0'),
      refresh_token: params.get('refresh_token'),
      token_type: params.get('token_type'),
      provider_token: params.get('provider_token'),
    };

    return data;
  };

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <ScrollView
        contentContainerStyle={{ padding: 20, gap: 20 }}
        keyboardDismissMode="on-drag">
        <Text>Sign in</Text>
        <TextInput
          placeholder="Enter your email"
          onChangeText={(text) => setEmail(text)}
        />
        <TextInput
          placeholder="Enter your password"
          secureTextEntry={true}
          onChangeText={(text) => setPassword(text)}
        />
        <Pressable onPress={() => navigation.navigate('ForgotPassword')}>
          <Text>Forgot Password?</Text>
        </Pressable>
        <Button
          disabled={loading}
          onPress={() => onSignInTapped()}
          title={loading ? 'Loading...' : 'Sign in'}
        />
        <Pressable onPress={() => navigation.navigate('Register')}>
          <Text>Have an account? Sign up</Text>
        </Pressable>
        <Button
          disabled={loading}
          onPress={() => onSignInWithGoogle()}
          title={loading ? 'Loading...' : 'Sign in with Google'}
        />
      </ScrollView>
    </SafeAreaView>
  );
}
