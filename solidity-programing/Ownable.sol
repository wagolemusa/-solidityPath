// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// state variables 
// globle variables
// function modifier
// function
// error handling

contract Ownable {

    address public owner;

    constractor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {
        // code
    }

    function anyOneCanCall() external {
        // code
    }
}