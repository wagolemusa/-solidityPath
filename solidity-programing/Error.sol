// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

// rerquire, revert, assert
// - gas refound state updates are reverted
// custom error - save gas

contract Error {
    //  Working with Require Error
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10");
    }

    //  Working with Revert error
    function testRevert(uint _i) public pure  {
        if(_i > 10){
            revert("i > 10");
        }
    }

    //  Working with assert error
    uint public num = 123;
    function testAssert() public view {
        assert(num == 123);
    }

    function foo(uint _i) public {
        num += 1;
        require(_i < 10);
    }

    //  Working with customer Error
    error MyError(address caller, uint i);
    function testCustommerError(uint _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }


}