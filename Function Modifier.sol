// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Modifier {
  // function modifier는 code를 refactoring 할때도 쓰이고,
  // Modifier을 이용해 어떠한 제약을 걸어줄 떄도 쓰인다.
  // 먼저 Basic 을 알아보자.
  uint public count;
  bool public paused;

  function setPause (bool _paused) external {
    paused = _paused;
  }

  function inc() external {
    require(!paused, "paused");
    count += 1;
  }
  function dec() external {
    require(!paused, "paused");
    count -= 1;
  }

  // 위의 inc, dec의 require문은 동일한 메시지를 담고, 조건또한 동일하다 이를 modifier로
  // refactoring 을 한다면,
  modifier whenNotPaused () {
    require(!paused, "paused");
    _;
  }

  //이후에 inc, dec external 옆에 해당 함수를 작성하면됨.
  function inc2 () external whenNotPaused {
    count +=1;
  }
  function dec2 () external whenNotPaused {
    count -=1;
  }

  // 또다른 예시 Input값을 Modifier로 조정할 수 있다.
  modifier cap (uint x) {
    require(x < 100, "x > 100");
    _;
  }

  function incBy(uint _x) external whenNotPaused cap(_x) {
    count+=_x;
  }

  // sandwich modifier을 알아보자ㅣ.

  modifier sandwich () {
    // 일단 먼저 10을 더해주고
    count+= 10;
    _; // foo 함수를 호출하여 실행시킨다.
    count *=2; // 이후 count 에 *2를 해준다.
  }

  function foo () external sandwich {
    count += 1;
  }
}