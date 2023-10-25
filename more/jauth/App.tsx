import { Platform, Pressable, Text, View } from 'react-native';
import * as WebBrowser from 'expo-web-browser';

import { supabase } from './lib/supabase';
import { useEffect, useState } from 'react';
import { Session } from '@supabase/supabase-js';

export default function App() {
  const [session, setSession] = useState<Session | null>(null);

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session);
    });

    supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session);
    });
  }, []);

  const onSignIn = async () => {
    if (Platform.OS === 'web') {
      supabase.auth.signInWithOAuth({ provider: 'google' });
      return;
    }

    const {
      data: { url },
    } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: 'jauth://google-auth',
      },
    });

    const result = await WebBrowser.openAuthSessionAsync(
      url!,
      'jauth://google-auth?'
    );

    if (result.type === 'success') {
      const params = new URLSearchParams(result.url.split('#')[1]);

      supabase.auth.setSession({
        access_token: params.get('access_token')!,
        refresh_token: params.get('refresh_token')!,
      });
    }
  };

  return (
    <View
      style={{
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        gap: 20,
      }}>
      <Pressable
        onPress={onSignIn}
        style={{ padding: 10, backgroundColor: '#eef' }}>
        <Text>Sign in</Text>
      </Pressable>
      <Text>{session && session.user ? 'Signed in ✅' : 'Signed out ❌'}</Text>
    </View>
  );
}
