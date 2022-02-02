// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract ValueTypes {
    bool public b = true;
    uint public u = 123; // uint =  uint256 0 to 2 ** 256 - 1
                         //         uint8  0 to 2 ** 8 - 1 
                        //          uint16 0 to 2 ** 16 - 1
    int public i = -123;  // int = int256 - 2 ** 255 to 2 ** 255 - 1
                        //  int = int128  - 2**127 to 2 ** 127 -1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x5B35446C654654cbc66n232352387235236346214356;
    bytes32 public b32 = 0x89C7675634JHDGHWQ6542367235423HGSDG54235SGDGFSD54;
}

