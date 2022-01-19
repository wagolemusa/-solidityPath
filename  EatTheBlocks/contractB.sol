// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// Call function of other contract

contract InterfaceB {
    function helloworld() external pure returns(string memory);
}

contract B {
    function helloworld() external pure returns(string memory) {
        revert() ; // return an error 
        return 'helloworld';
    }

    function foo() external {
        // return msg.sender
    }
}

