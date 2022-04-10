// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Storage {
    
    uint starageDate;

    function setdata(uint x) public {
        starageDate = x;
    }

    function getData()view public returns(uint) {
        return starageDate;
    }
}