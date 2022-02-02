// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract functionIntro {
    function add(uint x, uint y) external pure returns(uint) {
        return x + y;
    }
    function sub(uint x, uint y) external pure returns(uint){
        return x - y;
    }
}