// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Itest{
    function getCount() external view returns(uint256);
    function increment() external;
    function setAddress(address) external;
    function getAddress() external view returns(address);
}

contract testInterface is Itest{
    uint256 private count;
    address private add;

    constructor(){
        count =0;
    }

    function increment()external override{
        count +=1;
    }

    function getCount() external view override returns(uint256) {
        return count;
    }

    function setAddress(address _add) external override{
        add= _add;
    }
    function getAddress() external view override returns(address){
        return add;
    }

}