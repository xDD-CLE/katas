#include "MockHashCalculator.h"

MockHashCalculator::MockHashCalculator() : HashCalculator(), failed(false) {

}

Hash MockHashCalculator::calculate(string word){
  if(!failed && !to_hash.empty() && ! to_return.empty()){
    if(word == to_hash.front()){
      to_hash.pop();
      Hash return_value = to_return.front();
      to_return.pop();
      return return_value;
    }
    failed = true;
  }
  failed = true;
}

void MockHashCalculator::add_verify_and_return(string word, Hash hash){
  to_hash.push(word);
  to_return.push(hash);
}

bool MockHashCalculator::verify_calls(){
  return !failed && to_hash.empty() && to_return.empty();
}
