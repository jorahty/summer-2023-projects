import 'react-native-url-polyfill/auto';
import { useState, useEffect } from 'react';
import { supabase } from './src/lib/supabase';
import Auth from './src/components/Auth';
import Account from './src/components/Account';
import { SafeAreaView, Text } from 'react-native';
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

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <Text>session: {String(session != null)}</Text>
      {session && session.user ? (
        <Account key={session.user.id} session={session} />
      ) : (
        <Auth />
      )}
    </SafeAreaView>
  );
}
