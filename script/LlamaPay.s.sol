// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/MyToken.sol";
import "../src/LlamaPay.sol";

contract LlamaPayScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployer);
        
        MyToken myToken = new MyToken();
        console.log("myToken: " + myToken);
        // LlamaPay llamaPay = new LlamaPay(myToken.address);

        vm.stopBroadcast();
    }
}