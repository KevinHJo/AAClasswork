import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();
    window.store = store;
    window.store.getState();
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
});

console.log('hello');