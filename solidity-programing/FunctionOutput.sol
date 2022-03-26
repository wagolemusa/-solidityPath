// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// Return multiple outputs
// Name outputs
// Destructuring Assigment

contract FunctionOutputs {

    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    function named() public pure returns( uint _x, bool b){
        return (1, true);
    }

    function assigned() public pure returns( uint x, bool b){
        x =1;
        b = true;
    }

    function destracturingAssigments() public pure {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany()
    }


}