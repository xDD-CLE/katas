import R from 'ramda'

export const findMisspellings = (isWord) => {
  return R.compose(R.reject(isWord), R.split(' '))
}
