// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contracf MyContract {

    // Declear enum
    // use enum
    // Accepts enum as argement

    enum STATE { INACTIVE, ACTIVE} // option
    STATE state; // Declear valaibler in enum 

    //  use enum in struct
    struct User{
        STATE state

    }

    function setToActive() external {
        state = STATE.ACTIVE;
    }

    // Read enum
    function foo() external {
        if(state == STATE.ACTIVE) {
            // Do sometthing
        }
    }

    // Declear enum in function as aggurment
    function bar(STATE _state)
}