// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../src/CertificateNFT.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address owner = vm.envAddress("OWNER_CONTRACT");
        CertificateNFT nft = new CertificateNFT(
            owner,
            "CERTIFICADO DIO BLOCKCHAIN",
            "CERTBLCK",
            "Blockchain Developer with Solidity",
            "DIO",
            "ipfs://bafybeidnjgaggvuaug4wwwxwyw5pusm43qjxmcuujjo4ca2gorfn5q2k6y/c8fb448d-5ca4-41b2-b22a-07eadb658eac.png"
        );
        console.log(address(nft));
        vm.stopBroadcast();
    }
}

contract Mint is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address tkContract = vm.envAddress("TK_CONTRACT");
        CertificateNFT nft = CertificateNFT(payable(tkContract));
        address to = payable(vm.envAddress("TO_MINT"));
        nft.mintCertificate(to, "JOAO WEB3", "10/07/2024", "90");
        vm.stopBroadcast();
    }
}
