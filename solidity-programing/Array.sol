// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract Array {
    uint [] public nums = [1,2,3];
    uint[] public numsFixed = [4,5,6];

    function examples() external {
        nums.push(4); //[1,2,3,4] it have pushed 4 to the array
        uint x = nums[1];
        nums[2] = 777; //it added to placed to index 2 [1,2,777,3,4]
        delete nums[1]; // it deletes the index 0 [1,0,777,3,4]
        nums.pop(); // [1,0,777,3] it remove the last number
        uint len = nums.length;

        // create array in momery
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }
    
}