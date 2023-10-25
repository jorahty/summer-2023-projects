import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { TextInput, ScrollView } from 'react-native';
import { Session } from '@supabase/supabase-js';
import { colors, styles } from '../theme/theme';
import Button from './common/Button';

export default function Account({ session }: { session: Session }) {
  const [loading, setLoading] = useState(true);
  const [username, setUsername] = useState('');
  const [website, setWebsite] = useState('');
  const [avatarUrl, setAvatarUrl] = useState('');

  useEffect(() => {
    if (session) getProfile();
  }, [session]);

  async function getProfile() {
    try {
      setLoading(true);
      if (!session?.user) throw new Error('No user on the session!');

      let { data, error, status } = await supabase
        .from('profiles')
        .select(`username, website, avatar_url`)
        .eq('id', session?.user.id)
        .single();
      if (error && status !== 406) {
        throw error;
      }

      if (data) {
        setUsername(data.username);
        setWebsite(data.website);
        setAvatarUrl(data.avatar_url);
      }
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message);
      }
    } finally {
      setLoading(false);
    }
  }

  async function updateProfile({
    username,
    website,
    avatar_url,
  }: {
    username: string;
    website: string;
    avatar_url: string;
  }) {
    try {
      setLoading(true);
      if (!session?.user) throw new Error('No user on the session!');

      const updates = {
        id: session?.user.id,
        username,
        website,
        avatar_url,
        updated_at: new Date(),
      };

      let { error } = await supabase.from('profiles').upsert(updates);

      if (error) {
        throw error;
      }
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message);
      }
    } finally {
      setLoading(false);
    }
  }

  return (
    <ScrollView
      keyboardDismissMode="on-drag"
      contentContainerStyle={{
        gap: 20,
        padding: 20,
      }}>
      <TextInput
        placeholder="Email"
        value={session?.user?.email}
        editable={false}
        placeholderTextColor={colors.darkGrey}
        style={[styles.textInput, styles.disabled]}
      />
      <TextInput
        placeholder="Username"
        value={username || ''}
        onChangeText={(text) => setUsername(text)}
        placeholderTextColor={colors.darkGrey}
        style={styles.textInput}
      />
      <TextInput
        placeholder="Website"
        value={website || ''}
        onChangeText={(text) => setWebsite(text)}
        placeholderTextColor={colors.darkGrey}
        style={styles.textInput}
      />
      <Button
        title={loading ? 'Loading ...' : 'Update'}
        onPress={() =>
          updateProfile({ username, website, avatar_url: avatarUrl })
        }
        disabled={loading}
      />
      <Button title="Sign Out" onPress={() => supabase.auth.signOut()} />
    </ScrollView>
  );
}
