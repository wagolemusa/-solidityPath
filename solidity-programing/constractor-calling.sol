// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;


contract S {
    string public name;

    constructor(string memory _name){
        name _name;
    }
}

contract T {
    constructor(string memory _text){
        text = _text;
    }
}

// Calling parent contractors
contract U is S("s), T("t") {

}

contract V is S, T {
    // danamic input of constractors
    constructor(string memory _name, string memory _text) S(_name) T(_text){

    }
}