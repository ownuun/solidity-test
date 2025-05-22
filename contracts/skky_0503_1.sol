// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract skky_0503{
    uint256 public cnt;
    bool public isActive;

    constructor(){
        cnt = 0;
        isActive = false;
    }

    event check_isActive_Called(address indexed caller, bool isActive, uint256 timestamp);

    modifier check_isActive(){
        require(isActive, "Available only when isActive is true");
        _;
        emit check_isActive_Called(msg.sender, isActive, block.timestamp);
    }

    function increaseCnt_assert() public check_isActive {
        cnt++;
        assert(cnt<0);
        
    }
    function increaseCnt() public check_isActive{
        cnt++;
    }

    function isActivate_require() public view returns (string memory){
        require(isActive, "isActive is false");
        return "isActive is true";
    }
    function isActivate_revert() public view returns(string memory){
        if (!isActive){
            revert("isActive is false");
        }
        return "isActive is true";
    }
    function toggle_isActive() public{
        isActive = !isActive;
    }
}