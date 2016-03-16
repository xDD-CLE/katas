import R from 'ramda'

export const findMisspellings = (isWord) => (text) => {
  return R.compose(R.reject(isWord), R.split(' '))(text)
}
