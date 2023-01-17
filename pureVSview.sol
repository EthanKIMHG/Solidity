// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// View 와 Pure 의 차이
// 둘다 선언할 경우 blockchain에 쓸 수 없음.
// View 는 block chain 에서 data를 읽을 수 있음
// whereas Pure 은 blockchain에서 그 어떠한 것도 읽을 수없음.

contract ViewAndPureFunctions {
  uint public num;
  // 아래의 viewFunc는 view function 이다.
  // 이유는, stateVariable로 선언된 Num을 바꾸지도 않고, blockchain에 어떠한 것도 write하지 않기 때문에.
  // It just read some kind of the data from the blockchain. in this case the stateVariable;
  function viewFunc() external view returns (uint) {
    return num;
  }
  // 아래의 pureFunc는 pure function이다.
  // 이유는, blockchain에 그 어떤것도 바꾸지않고, 새롭게 쓰지 않고있으며,
  // stateVariable 마저 읽지 않고 return 1만 해준다. 
  function pureFunc() external pure returns (uint) {
    return 1;
  }
  // 아래의 addToNum 함수는 view fucntion이다.
  // 이유는 blockchain에 일단 write 않고 있으며 stateVariable을 읽어서 x와 더해주는 작업을 하기 때문.
  function addToNum(uint x) external view returns (uint) {
    return num + x;
  }
  // 아래의 add 함수는 pure function 이다.
  // 이유는 blockchain에 일단 write 하지 않고 stateVariable을 읽지 않을 뿐더러, 새로운 매개변수 2개를
  // 받아 그 2개의 값을 리턴해주는 함수 이기 때문임.
  function add(uint x, uint y) external pure returns (uint) {
    return x + y;
  }
}