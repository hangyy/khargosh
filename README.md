# khargosh

Carrot token address: 0x84148141123b8dd16c158c56740191d427560731
khargoshNFT address: 0x388d675721e3DFc4BdD3AddbDe44A9405579aB5B

## Deployment

1. npx hardhat run scripts/deploy_erc721.js --network kovan
1. npx hardhat flatten ./contracts/KhargoshNFT.sol > flatten_nft.sol
1. npx hardhat verify --contract contracts/Carrot.sol:Carrot --network kovan 0x84148141123b8DD16c158C56740191d427560731 "0x9530E590f6E3C5b31f4f8E086d097c55646BC51B"
