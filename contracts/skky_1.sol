// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract skky_1 {
    int256 public cnt;
    uint256 public num;

    address public ownerAddress;

    constructor(uint256 initValue) {
        num = initValue;
        cnt = 0;
        ownerAddress = msg.sender;
    }

    function getOwner() public view returns (address) {
        return ownerAddress;
    }

    function increaseCnt() public {
        cnt++;
    }

    function decreaseCnt() public {
        cnt--;
    }

    function getCnt() public view returns (int256) {
        return cnt;
    }

    function setCnt(int256 number) external {
        cnt = number;
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    function sumArrayMem(
        uint256[] memory data
    ) external pure returns (uint256 sum) {
        for (uint256 i = 0; i < data.length; i++) {
            sum += data[i] * 2;
        }
    }

    function sumArrayCall(
        uint256[] calldata data
    ) external pure returns (uint256 sum) {
        for (uint256 i = 0; i < data.length; i++) {
            sum += data[i];
        }
    }
}
