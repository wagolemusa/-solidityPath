// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// visibility
// private - only inside contract
// internal - only inside contract and child  contracts
// public  - inside and outside contract
// external - only from outside contract

/* -----------------
' A                  '
' Private pri()                 '
' internal   (inter) '
' public     (pub)   '
' external    ext()  '      
'                    '
'--------------------'

/* ------------------
' B is A             '                 '
' inter()            '      
' pub()              '      
'                    '
'--------------------'

*/
contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint){
        return 0;
    }

    function internalFunc() internal pure returns (uint){
        return 100;
    }
    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externalFunc() external pure returns (uint) {
        return 300;
    }

    function exampleFuc() external view{
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}