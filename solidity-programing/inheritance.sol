// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract A {

    function foo() public pure virtual returns (string memory){

        return "Refuge";
    }

    function name() public pure  returns (string memory) {
        return "wise";

    }

    function baz() public pure returns (string memory){
        return "A";
    }
}

// Anather contract to inherits
contract B is A{
    function foo() public pure  override returns (string memory){
        return "B";
    }

    function bar() public pure  returns (string memory){
        return "Yes";
    }
}