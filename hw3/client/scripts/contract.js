// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
const ContractJson = require("../artifacts/contracts/Contract.sol/Contract.json")

// The ABI is very important -- it's the interface to your contract, including
// the different available functions that are exposed for other contracts,
// accounts, etc. to call.
const abi = ContractJson.abi;

async function main() {
    const provider = new ethers.JsonRpcProvider(process.env.API_URL);
    const userWallet = await provider.getSigner();

    // Get the deployed contract. We need both the specific CONTRACT_ADDRESS
    const newContract = new hre.ethers.Contract(
        process.env.CONTRACT_ADDRESS,
        abi,
        userWallet
    )

    const setTx1 = await newContract.addUser("alice", 17, false);
    await setTx1.wait();
    console.log("done");

    const setTx2 = await newContract.addUser("bob", 18, true);
    await setTx2.wait();
    console.log("done");

    const setTx3 = await newContract.removeUser("alice");
    await setTx3.wait();
    console.log("done");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
}); 