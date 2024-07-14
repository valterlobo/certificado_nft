// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract CertificateNFT is ERC721, ERC721Burnable, Ownable {
    struct Certificate {
        string studentName;
        string completionDate;
        string grade;
    }

    string courseName;
    string institution;
    string img;
    uint256 private _nextTokenId = 1;

    mapping(uint256 => Certificate) private certificates;

    event CertificateMinted(address indexed to, uint256 indexed tokenId);

    constructor(
        address IssuerCertificate,
        string memory nm,
        string memory symbol,
        string memory _courseName,
        string memory _institution,
        string memory _img
    ) ERC721(nm, symbol) Ownable(IssuerCertificate) {
        courseName = _courseName;
        institution = _institution;
        img = _img;
    }

    function mintCertificate(address to, string memory studentName, string memory completionDate, string memory grade)
        public
        onlyOwner
    {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        certificates[tokenId] = Certificate(studentName, completionDate, grade);
        emit CertificateMinted(to, tokenId);
    }

    function getCertificateInfo(uint256 _id) public view returns (Certificate memory) {
        return certificates[_id];
    }

    // Following functions are overrides required by Solidity.
    function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {
        bytes memory metadata = "{";

        bytes memory metadataParcial;

        Certificate memory cert = certificates[tokenId];

        metadataParcial = abi.encodePacked('"', "name", '": "', cert.studentName, '",');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadataParcial = abi.encodePacked('"', "description", '": "', "Certificate:", courseName, '",');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadataParcial = abi.encodePacked('"', "image", '": "', img, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadata = abi.encodePacked(metadata, ",");
        //attributes
        metadata = abi.encodePacked(metadata, '"attributes": [');

        //studentName
        metadata = abi.encodePacked(metadata, "{");
        metadataParcial = abi.encodePacked('"', "trait_type", '": "', "Student", '",');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadataParcial = abi.encodePacked('"', "value", '": "', cert.studentName, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadata = abi.encodePacked(metadata, "}");

        metadata = abi.encodePacked(metadata, ",");

        //Grade
        metadata = abi.encodePacked(metadata, "{");
        metadataParcial = abi.encodePacked('"', "trait_type", '": "', "Grade", '",');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadataParcial = abi.encodePacked('"', "value", '": "', cert.grade, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadata = abi.encodePacked(metadata, "}");

        metadata = abi.encodePacked(metadata, ",");

        //courseName
        metadata = abi.encodePacked(metadata, "{");
        metadataParcial = abi.encodePacked('"', "trait_type", '": "', "Course", '",');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadataParcial = abi.encodePacked('"', "value", '": "', courseName, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadata = abi.encodePacked(metadata, "}");

        metadata = abi.encodePacked(metadata, ",");

        //institution
        metadata = abi.encodePacked(metadata, "{");
        metadataParcial = abi.encodePacked('"', "trait_type", '": "', "Institution", '",');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadataParcial = abi.encodePacked('"', "value", '": "', institution, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadata = abi.encodePacked(metadata, "}");

        metadata = abi.encodePacked(metadata, " ] }");

        string memory attributes64 = Base64.encode(metadata);
        return string(abi.encodePacked("data:application/json;base64,", attributes64));
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
