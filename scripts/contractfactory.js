const { ethers } = require("hardhat");

async function main() {

    const PRIVATE_KEY = "0x6069ca97bbbde4b6d076597d44eebb29906d357873a8bcba5bbc3c1c3950c496";

    const wallet = new ethers.Wallet(PRIVATE_KEY, ethers.provider);
    console.log("복원된 지갑 주소:", wallet.address);

    const ContractFactory = await ethers.getContractFactory(
        "skky_0517_1",
        wallet
    );

    const contract = await ContractFactory.deploy("ownuun Token", "OWN", 10n);

    console.log("컨트랙트 배포 완료: ", contract.target);

}

main();