import R from 'ramda'

export const findMisspellings = (dictionary) => (text) => {
  return R.compose(R.reject(dictionary), R.split(' '))(text)
}
