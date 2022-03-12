async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());

    feed_token = "0x84148141123b8dd16c158c56740191d427560731"
    const KhargoshNFT = await ethers.getContractFactory("KhargoshNFT");
    const khargoshNFT = await KhargoshNFT.deploy(feed_token);

    console.log("khargoshNFT address:", khargoshNFT.address)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });