import GlobalNavigation from './src/navigation/GlobalNavigation';
import { SupabaseProvider } from './src/context/SupabaseProvider';

export default function App() {
  return (
    <SupabaseProvider>
      <GlobalNavigation></GlobalNavigation>
    </SupabaseProvider>
  );
}
