// SPDX-license-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LipToken is ERC721, Ownable {
    uint256 COUNTER;
    uint256 fee = 1 ether;
    struct Lip {
          string name;
          uint256 id;
          uint256 dna;
          uint8 level;
          uint8 rarity;
     }

    Lip[] public lips;

    event NewLip(address owner, uint256 id, uint256 dna);

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
        {}

    function createRandNumber(uint256 _mod) internal view returns(uint256) {
        uint256 randomNum = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender)));
        return randomNum % _mod;
    }   


    function updateFee(uint256 _fee) external onlyOwner(){
        fee = _fee;
    }

    // Creation
    function _creteLip(string memory _name) internal{
        // creating random rarity
        uint8 randRarity = uint8(createRandNumber(100));
        // creating random DNA
        uint256 randDna = createRandNumber(10**16);
       
        Lip memory newLip = Lip(_name,COUNTER, randDna, 1, randRarity);
        lips.push(newLip);
        _safeMint(msg.sender, COUNTER);
        emit NewLip(msg.sender, COUNTER , randDna);
        COUNTER++;
    }

    function withdraw() external payable onlyOwner(){
        address payable _owner = payable(owner());
        _owner.transfer(address(this).balance);
    } 

    function createRandomLip(string memory _name) public payable{
        // require is like an if condition
        // msg.value hold what user sent to the SC
        require(msg.value == fee, "User doesn't have enough fee");
        _creteLip(_name);
    }


    // Getters
    function getLips() public view returns(Lip[] memory){
        return lips;
    }   
}