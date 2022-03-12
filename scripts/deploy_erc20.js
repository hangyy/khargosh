async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());
    
    const Carrot = await ethers.getContractFactory("Carrot");
    const carrot = await Carrot.deploy(deployer.address);
    console.log("Carrot address:", carrot.address)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });