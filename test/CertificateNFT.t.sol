// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {CertificateNFT} from "../src/CertificateNFT.sol";

contract CertificateNFTTest is Test {
    CertificateNFT public nft;

    address owner = vm.addr(0x1);
    address student = vm.addr(0x2);

    function setUp() public {
        nft = new CertificateNFT(
            owner,
            "CERTIFICADO DIO BLOCKCHAIN",
            "CERTBLCK",
            "Blockchain Developer with Solidity",
            "DIO",
            "http://pkd/01.jpg"
        );
    }

    function test_mintCertificate() public {
        vm.prank(owner);
        nft.mintCertificate(student, "WOLF DEV", "10/06/2024", "92");
        assertEq(1, nft.balanceOf(student));
        vm.stopPrank();
    }

    function test_tokenURI() public {
        vm.prank(owner);
        nft.mintCertificate(student, "WOLF DEV", "10/06/2024", "92");
        CertificateNFT.Certificate memory n = nft.getCertificateInfo(1);
        assertEq("WOLF DEV", n.studentName);
        string memory uri = nft.tokenURI(1);
        console.log(uri);
    }
}
