 // SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

interface IAnotherContract{
    function pause() external;
    function resume() external;
}

contract emergency {

    address public owner;
    address public mainContract;
    bool public paused;


    modifier onlyOwner() {
        require(msg.sender == owner, "only owner");
        _;
    }

    constructor(address _pausableContract) {

        mainContract = _pausableContract;
        owner = msg.sender;
        paused = false;

    }

    function pauseContract() public onlyOwner {
        paused = true;
        IAnotherContract(mainContract).pause();
    }

    function resumeContract() public onlyOwner {
        paused = false;
        IAnotherContract(mainContract).resume();
    }

    function emergencyWithdraw() public onlyOwner {
        require(paused, "only when paused withdraw");
        payable(owner).transfer(address(mainContract).balance);
    }

    function killContract() public onlyOwner {
        selfdestruct(payable(owner));
    }
}
