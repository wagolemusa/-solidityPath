// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract SimpleStorage {

    string public text;

    // function set call data
    function set(string calldata _text) external {
        text = _text;
    }

    // function which get the  data
    function get() external view returns (string memory){
        return text;
    }
}