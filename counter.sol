// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter {
  // public 변수를 선언할 경우, Counter 컨트랙트를 배포하면, public 변수를 읽을 수 있음.
  // StateVariable

  uint public count;
  // external 함수를 사용할 경우 Counter 컨트랙트를 배포하고나서 이 함수를 호출 할 수 있음.
  // inc 함수는 count 를 읽고, count를 Modify하여 write하기 때문에 view나 pure에 해당할 수 없음.
  function inc () external {
    count += 1;
  }
  // dec 함수는 count 를 읽고, count를 Modify하여 write하기 때문에 view나 pure에 해당할 수 없음.
  function dec () external {
    count -= 1;
  }

  // view 함수를 만들어보자.
  function plus (uint x) external view returns (uint) {
    return count + x;
  }

}