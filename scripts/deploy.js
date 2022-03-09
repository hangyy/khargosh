async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());

    const KhargoshNFT = await ethers.getContractFactory("KhargoshNFT");
    const khargoshNFT = await KhargoshNFT.deploy();

    console.log("khargoshNFT address:", khargoshNFT.address)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });