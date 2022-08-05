// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList{
    struct TodoObj {
        string text;
    }
    event TaskCreate(string);
    // event GetUsersTodo(address);
    TodoObj[] public todos;
    mapping(address => TodoObj[]) todoMap;

function addTodo(string calldata _text) public{
todos.push(TodoObj(_text));
todoMap[msg.sender]=todos;
emit TaskCreate(_text);
}

function getOneUsersTodo() public view returns(TodoObj[] memory){
return todoMap[msg.sender];
}


function deleteUsersOneTodo(uint256 _index) public {
 delete todoMap[msg.sender][_index];
}

function deleteUsersAllTodo() public {
    delete todoMap[msg.sender];
}

function UpdateUserTodo(uint256 _index, string calldata _text) public {
  todoMap[msg.sender][_index].text=_text;
}

} 
