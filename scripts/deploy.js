const { ethers } = require("hardhat");

async function main() {
  // Get the contract factory for SportsVoting
  const SportsVoting = await ethers.getContractFactory("SportsVoting");

  // Deploy the contract with the specified constructor arguments
  const teamNames = ["Team A", "Team B", "Team C", "Team D"];
  const sports = ["Football", "Basketball", "Baseball", "Tennis"];
  const durationInMinutes = 10;

  const sportsVoting = await SportsVoting.deploy(teamNames, sports, durationInMinutes);

  // Wait for the contract to be deployed
  await sportsVoting.deployed();

  // Log the contract address
  console.log("Contract address:", sportsVoting.address);
}

// Execute the main function and handle errors
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

