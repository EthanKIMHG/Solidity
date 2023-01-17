// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariables {
  function  globalVars() external view returns (address, uint, uint, uint) {
    address sender = msg.sender;

    uint timestamp = block.timestamp;
    uint blockNum = block.number;

    // 시간을 계산할때 30 days처럼 원하는 timestamp 값을 얻을 수 있다. 다만 unix 기법으로, 변환이 필요.
    uint previousTime = timestamp - 30 days;

    return (sender, timestamp, blockNum, previousTime);
    // address: 0xe758F5b3F2355d7c8ad323A7B51E9616132DEAcB
    // 1673969318
    // 46
    // 1671377318

  }
}