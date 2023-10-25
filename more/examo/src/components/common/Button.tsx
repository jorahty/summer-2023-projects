import { TouchableOpacity, Text } from 'react-native';
import { styles } from '../../theme/theme';

interface Props {
  title: string;
  onPress?: () => void;
  disabled?: boolean;
}

export default function Button({ title, onPress, disabled }: Props) {
  return (
    <TouchableOpacity
      style={styles.button}
      onPress={onPress}
      disabled={disabled}>
      <Text style={styles.buttonText}>{title}</Text>
    </TouchableOpacity>
  );
}
