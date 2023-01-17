// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LocalVariables {
    // state variables 라고부름. Contract에서 선언하면 영구적으로 상태가 남게 되는 변수.
    uint public i;
    uint public x1;
    bool public b;
    address public myAddress;

    function foo() external {
        // LocalVariables 라고 부르고, Contract에서 함수의 호출이 발생할때만 사용하게되는 변수.
        uint x = 123;
        bool f = false;
        x1 = x;

        x += 456;
        x1 = x;
        f = true;

        i += 123;
        b = true;
        myAddress = address(3321);
    }
}