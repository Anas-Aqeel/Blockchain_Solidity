/// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
struct TodoItem{
    uint id;
    string text;
    string desc;
}
contract Todo{
 uint _id = 1;
 event TodoEvent(string, TodoItem);
 mapping(address => mapping(uint => TodoItem)) Todos;
 function AddTodo(string calldata _text, string calldata _desc) public{
    TodoItem memory newTodo = TodoItem(
        _id,
        _text,
        _desc
    );
    Todos[msg.sender][_id] = newTodo;
    emit TodoEvent('Todo Added', newTodo);
    _id++;
 }
 function DeleteTodo(uint id) public {
    emit TodoEvent ('Todo Deleted',Todos[msg.sender][id]);
    delete Todos[msg.sender][id];
 }
 function getTodo(uint id) view public returns( TodoItem memory){
     return Todos[msg.sender][id];
 }
function updateTodo(uint id, string calldata _text, string calldata _desc) public{
    TodoItem memory newItem = TodoItem(id, _text, _desc);
    Todos[msg.sender][id] = newItem;
    emit TodoEvent('Todo Updated', newItem);
}
}