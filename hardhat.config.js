require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  defaultNetwork: "mainnet",
  networks: {
    mainnet: {
      url: "https://eth-mainnet.g.alchemy.com/v2/zUWQevGwAr_jvkL1LKyWd_GKQynqNZAQ",
      accounts: [
        "ba302e32fd6694a2f40ae87713b550edcbd10545ba96537e72f404ce57f39591"
      ]
    }
  },
  solidity: "0.8.0"
};

