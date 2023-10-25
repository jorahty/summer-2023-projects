// temporary dirty hack to suppress the annoying gotrue warning
const originalWarn = console.warn;
console.warn = (message, ...args) => {
  if (message.startsWith('@supabase/gotrue-js')) return;
  originalWarn(message, ...args);
};

import 'react-native-url-polyfill/auto';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { createClient } from '@supabase/supabase-js';
import { Platform } from 'react-native';

const supabaseUrl = 'https://qxnwxuqhslvsjabbzwgu.supabase.co';
const supabaseAnonKey =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF4bnd4dXFoc2x2c2phYmJ6d2d1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEyMDkwMDcsImV4cCI6MjAwNjc4NTAwN30.gm49DnOEmr0fhDhjdsSDUq_o3ZBEdhIvPUAAtvZhIOo';

export const supabase = createClient(
  supabaseUrl,
  supabaseAnonKey,
  Platform.OS === 'web'
    ? undefined
    : {
        auth: {
          storage: AsyncStorage,
          autoRefreshToken: true,
          persistSession: true,
          detectSessionInUrl: false,
        },
      }
);
