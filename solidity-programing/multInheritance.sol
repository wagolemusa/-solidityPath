// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract X {

    function foo() public pure virtual returns (string memory){

        return "Refuge";
    }

    function name() public pure  returns (string memory) {
        return "wise";

    }
    function x() public pure returns (string memory){
        return "x";
    }
}
// Anather contract to inherits
contract Y is X{
    function foo() public pure virtual override returns (string memory){
        return "B";
    }

    function bar() public pure  returns (string memory){
        return "Yes";
    }
}

contract Z is X, Y {
    function zbar() public pure returns (string memory){
        return "yes No";
    }

    function foo() public pure  override(X,Y) returns (string memory){
        return "B";
    }
}