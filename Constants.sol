// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// Constant에 대해 알아보자.
// 일반적으로 Constant를 쓰는 이유는 Gas fee 를 절약하기 위해서 사용한다.

// 아래 두개의 컨트랙트를 보자.
// 하나는 변수에 constant를 설정하여 변하지 않는 값으로 만들어 주고
// 128125 gas사용.
contract Constant {
  uint public constant UINT = 3241;

  function read () external view returns (bool) {
    if (UINT > 3000) return true;
    return false;
  }
    function read2 () external pure returns (bool) {
    if (UINT > 3242) return true;
    return false;
  }
}
// 다른 하나는 constatnt가 없이 선언해주었다.
// 128942 gas 사용.
contract Variable {
  address public ADDRESS = 0x1d0d8b15C13E8793d9f7dBbb7BcC4eC2d76abc52;
}