// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// 이번엔 solidity에서 error에 관한 내용을 알아보겠습니다.
// solidity에는 기본적으로, 컨트랙트와 상호작용에서 에러가 날경우 3가지의 stance를 취합니다.
// require, revert, assert
// 해당 에러가 발생했을때 gas는 refund되고, state가 없데이트 되는 작용이 있다면, Reverted 됩니다.

contract Error {
  function testRequire(uint _i) public pure {
    require(_i <= 10, "i must greater than 10");

    // _i 가 10보다 작을때의 코드를 작성하면됨.
  }

  function testRevert(uint _i) public pure {
    if (_i > 1) {
      if (_i > 2) {
        // revert는 이 함수처럼 분기가 많을때, 조건이 많을때 해당 조건에 해당 하지 않는다면
        // revert가 나게끔 로직을 구현할때 주로 사용합니다.
        revert("i must greater than 2");
      }
    }
  }
  uint public num = 123;

  function testAssert() public view {
    // assert는 해당 메소드 이후에 조건이 변경되었을때 에러를 감지합니다. Require 은 이전에 감지하는것.
    // assert는 기본적으로 state variable가 accidently하게 변경되었는지를 판단할때 사용.
    assert(num == 123);
  }
  function testRequire2() public view {
    require(num == 123, "num must 123");
  }
  // foo 함수에서 state variable 인 Num은 변하고 있습니다. 이름 감지한 assert는 오류를 반환합니다.
  function foo (uint _i) public {
    // 여기 num 처럼 accidently change가 발생했을 경우, 위의 assert를 다시 호출하면, assert에 걸리게 됨.
    num += 1;
    require(_i <10);
  }

  // custom error => custom error을 사용하면 gas 비를 줄일 수 있음. require, revert보다 훨씬 저렴한 gas
  // require 문 뒤에 나오는 모든 string 값이 돈이라고 생각하면됨.
  error MyError(address caller, uint i);

  function testCustomError (uint _i) public view returns(uint){
    if (_i >10) {
      revert MyError(msg.sender, _i);
    }
    return _i;
  }
}


contract exampleC {
	uint256 public constant maxLimit = 1000;
	mapping(address => bool) public frozenAccount; // frozenAccount를 public으로 정의하고, mapping 해주는데, 주소를 bool로 true or false로 나타냄.

	function checkGas(uint256 amount) external view returns (bool) {
		if (amount < maxLimit) return true;
		return false;
	}
  // https://github.com/ethereum/solidity/issues/1290 이게 지금 오류임.
  // 원래라면, constant가 pure없이 읽혀야 되지만 pure가 없으면 읽히지 않음.

	function validateAccount(address account) internal view returns (bool) { // 이 함수는 계정검증 함수인데, 매개변수로 account가 들어감.
		if (frozenAccount[account]) return true; // frozenAccount는 위에서 매핑으로 설정되어있기에, 매개변수인 account를 bool값으로 나타냄.
		return false;
	}
}