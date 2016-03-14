import R from 'ramda'

export const spellCheck = (dictionary) => (text) => {
  return R.compose(R.reject(dictionary), R.split(' '))(text)
}
