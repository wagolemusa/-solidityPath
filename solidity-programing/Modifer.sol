// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;


//  Function modifier - help you to reuse code before and / or after function
//  Basic, inputs, sandwich

contract FunctionModifier{
    bool public paused;
    uint public count;

    function setPaused(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    modifier cap(uint _x){
        require(_x < 100, "x >= 100");
        _;
    }
    function inBy(uint _x) external whenNotPaused cap (_x){
        count += _x;
    }


    modifier sandwich() {
        // code here
        count += 10;
        _;
        // more code here
        count *=2;
    }
    
    function foo() external sandwich {
        count += 1;
    }

}