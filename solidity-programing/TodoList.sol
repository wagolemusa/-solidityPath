// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract TodoList {

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;


    // function to create todos 
    function create(string calldata _text) external{
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // function to update todos
    function updateText(uint _index, string calldata _text)  external {
        todos[_index].text = _text;
    }

    // function to set complated to true
    function taggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}