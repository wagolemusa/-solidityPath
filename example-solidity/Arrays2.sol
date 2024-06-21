// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract DynamicArray{

    // Declearing State variables;
    uint [] private arr;

    uint [] public getNu;

    // function to add data in dynamic array
    function addData(uint num) public {
        arr.push(num);
    }

    // function to return data in an array
    function getData() public view returns(uint[] memory){
        return arr;
    }

    // function to return sum of elements of dynamic array
    function getSum() public view returns(uint){
        uint i;
        uint sum = 0;

        for (i = 0; i < arr.length; i++)
            sum = sum + arr[i];
        return sum;
        
    }

    // Function to search an element in dynamic array
    function search(uint num) public {
        uint i;
        for (i=0; i < arr.length; i++){
            if(arr[i] == num){
                // push number to an array
                getNu.push(num);
             
            } 
            
             if(i >= arr.length)
                revert("Something bad happened");
        }
    }

    // Methods to retrive the pushed number in array
    function getSearched() public view returns(uint [] memory){
        return getNu;
    }
        

}