import { StyleSheet } from 'react-native';

export const colors = {
  blue: '#08f',
  darkGrey: '#aaa',
  white: '#fff',
};

export const styles = StyleSheet.create({
  disabled: {
    opacity: 0.5,
  },
  buttonText: {
    fontWeight: '700',
    color: colors.white,
  },
  button: {
    backgroundColor: colors.blue,
    borderRadius: 15,
    padding: 15,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 10,
    borderWidth: 2,
    borderColor: colors.blue,
  },
  textInput: {
    borderWidth: 2,
    padding: 15,
    borderRadius: 15,
    borderColor: colors.darkGrey,
    backgroundColor: colors.white,
  },
});
