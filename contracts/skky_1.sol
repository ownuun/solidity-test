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
        storeData = 10;
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
    
    uint256 public storeData;
    uint256[] private storedArray;
    uint256 private answer = 42;



    function inputArray(uint256 val) external {
        storedArray.push(val);
    }


    function getArray() external view returns(uint256[] memory) {
        return storedArray;
    }



    function guessNumber(uint256 input) external view returns (string memory){
        if (input > answer){
            return unicode"큽니다";
        } else if (input < answer){
            return unicode"작습니다";
        } else{
            return unicode"맞습니다";
        }
    }

    function multiplyStore(uint256 x) external view returns(uint256 ) {
        return storeData*x;
        
    }

}
