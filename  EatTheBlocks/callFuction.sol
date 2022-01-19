// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

import 'contractB.sol';

// Call function of other contract

contract A {
    
    address addressB;

    function setAddressB(address _addressB) external {
        address = _addressB;
    }

    // calling a function from  other contract
    function callHelloworld() external view returns(string memory) {
       InterfaceB b = InterfaceB(addressB);
        return b.helloworld();
    }
}

