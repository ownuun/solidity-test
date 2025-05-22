// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract testContract_0412 {
    uint256 public cnt;
    bool public isActive;

    constructor(){
        cnt = 0;
    }

    function increaseCnt_asset() public {
        cnt++;
        assert(cnt<0);
    }

    function increaseCnt() public {
        cnt++;    
    }

    function isActivate_require() public view returns(string memory){
        require(isActive, "isActive is false");
        return "isActive is true";
    }

    function isActivate_revert() public view returns(string memory){
        if(!isActive){
            revert("isActive is false");
        }
        return "isActive is true";

    }

    function toggle_isActive() public {
        isActive = !isActive;
        
    }

}