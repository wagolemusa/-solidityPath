// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// state valiable store data on a blockchain

contract StateVailables {
    uint public myUint = 123; // this are state variables store data on a blockchain

    function foo() external {
        uint notStateVariable = 569; // this a local variable 
    }

}