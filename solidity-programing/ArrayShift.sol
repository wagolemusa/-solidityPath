// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract ArrayShift {

    uint[] public arr;

    function example() public {
        arr = [1,2,3];
        // When you delete an array of index it return to 0 like [1,0,3] and we want to return 
        // [1,3] so here we are going to shift the number that we want to delete at the last 
        // the we just pop it.
        delete arr[1]; // [1, 0 ,3]
    }

    // [1,2,3] -- remove(1) --> [1,3,3] --- return --[1,3]
    // [1, 2,3,4,5,6 ] -- remove(2) --> [1,2,3,4,5,6] ---> return to [1,2,4,5,6]
    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }
        arr.pop();

    }

    // We are writting the test
    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        // we will get [1,2,4,5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);

        assert(arr.length == 4);
    }
}   