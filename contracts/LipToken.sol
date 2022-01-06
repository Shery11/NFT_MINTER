// SPDX-license-Identifier: MIT

pragma solidity ^0.8.0;
 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract LipToken is ERC721, Ownable {
        uint256 COUNTER= 1;

      constructor(string memory _name, string memory _symbol)
       ERC721(_name, _symbol)
    {}

    function mintMyNft(address _to) public onlyOwner(){
        _safeMint(_to, COUNTER);
        COUNTER++;
    }
}