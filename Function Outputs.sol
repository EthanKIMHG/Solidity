// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// function 의 리턴은 다수를 리턴해줄 수 있고, 다양한 방법으로 할 수 있는데

contract FunctionOutputs {
  // 첫번째로 basic multiple outputs에대해 알아보자.
  function returnMany () public pure returns(uint, bool) {
    return (1, false);
  }

  // 두번째로 datatype을 지정해서 리턴하는것을 넘어서서 named된 리턴값을 알아보자.
  function returnNamed () public pure returns(uint x, bool b) {
    return(1, true);
  }

  // 세번째로 return 값을 assigned해서 return 을 따로 적지 않고도 값을 리턴한은 방법인데
  // 이 방법은 가스비가 위의 2개의 함수보다 절약된다.
  function assigned () public pure returns(uint x, bool b) {
    x = 1;
    b = true;
  }

  // 네번째로 destructuring assignment 이다.
  function destructingAssignments() public pure {
    // 이런식으로 destructing 해서 returnMany를 실행시키고, x=1, b=false
    (uint x, bool b) = returnMany();
    // 2번째 return 값만 필요할때.
    (, bool c) = returnMany();
  }
}