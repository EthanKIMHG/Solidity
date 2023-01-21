// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract FindMonth {
    uint public currentTime;
    uint storage previousTime = currentTime;

    function current () external returns(uint) {
      currentTime = block.timestamp;
      return currentTime;
    }
    
    function gap () external view returns(uint) {
      uint gap1 = block.timestamp - currentTime;
      return gap1;
    }
  
}