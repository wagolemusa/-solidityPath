// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract Enum {
    
    enum Status {
        None,
        Pending,
        Shipped,
        Rejected,
        Canceled
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    // Array
    Order[] public orders;

    // Function which get the status
    function get() view external returns(Status){
        return status;
    }

    // set input 
    function set(Status _status) external {
        status = _status;
    }

    // function to update a specific value to be shipped
    function ship() external {
        status = Status.Shipped;
    }

    // reset Status to its default value
    function reset() external {
        delete status;
    }

}