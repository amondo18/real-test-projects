// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;

library Helper {
    function add(uint a, uint b) internal pure returns(uint){
        return (a+b);
    }
    function decide(uint a, uint b) internal pure returns(uint) {
        return a >= b ? a : b;
    }


}

contract Test {
    using Helper for uint;
    People[] public peopleAge;
    uint ageLimit = 18;

    struct People{
        uint age;
    }

    function register(uint age) external {
        peopleAge.push(People(age));
    }
    function registered() public view returns(People[] memory){
        return peopleAge;
    }

    function Math(uint firstNumber, uint secondNumber) external pure returns(uint){
        return Helper.add(firstNumber, secondNumber);
    }

}
