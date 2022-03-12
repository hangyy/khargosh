require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config({path:__dirname+'/.env'})

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

module.exports = {
  solidity: "0.8.1",
  networks: {
    ropsten: {
      url: `${process.env.ROPSTEN_URL}`,
        accounts: [`${process.env.ROPSTEN_PRIVATE_KEY}`]
    },
    kovan: {
      url: `${process.env.KOVAN_URL}`,
        accounts: [`${process.env.KOVAN_PRIVATE_KEY}`]
    },
    hardhat: {
      forking: {
        url: `${process.env.MAINNET_URL}`,
        accounts: [`${process.env.DEV_PRIVATE_KEY}`]
      }
    }
  },
  etherscan: {
    apiKey: {
        kovan: `${process.env.ETHERSCAN_API_KEY}`,
        ropsten: `${process.env.ETHERSCAN_API_KEY}`,
    }
  }
};
