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
            "http://pkd/01.jpg"
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
        nft.mintCertificate(to, "LOBO DEV", "10/06/2024", "98");
        vm.stopBroadcast();
    }
}
