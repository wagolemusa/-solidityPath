// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;
// declearing contractor
// difference with regular functions
// admin patten
// calling other functions
// calling parent constructors 

contract MyParentContract {
    constructor(uint a) public{
        // do some stuff
    }
}

contract MyConstructor {
    uint a;
    address admin;
    constructor(uint _a) MyParentContract(_a) public {
        admin = msg.sender;
        foo();
    }

    function foo() public {
        a = 2;
    }
}