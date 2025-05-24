const { ethers } = require("ethers");

async function main() {
    const wallet = ethers.Wallet.createRandom();
    console.log("생성된 지갑 주소:", wallet.address);
    console.log("비밀 키:", wallet.privateKey);
}

main();


