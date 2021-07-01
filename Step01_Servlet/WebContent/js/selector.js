/*
    js/selector.js file의 내용

    - web page에 loading할 javascript를 따로 준비해놓을 수 있다.
*/

function $(selector){
    const result = document.querySelector(selector);
    return result;
}