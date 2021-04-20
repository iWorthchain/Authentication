/**
 *Submitted for verification at
*/

pragma solidity ^0.6.4;

contract Authentication {
    //Administrator address
    address public manager;
    //User hash
    string[] public userHash;
    //Block height
    uint public blockHeight = 0;

    // The height of the user obtains the user's identity authentication id
    mapping (uint => string) userCertificationuint;
    // The height of the user obtains the user's identity authentication id
    mapping (string => uint) userCertificationstring;


    constructor () public {
        manager = msg.sender;
    }

    // User information on the chain
    function setuserCertification(string memory hash) public  onlyOwner{
        blockHeight++;
        userCertificationuint[blockHeight] = hash;
        userCertificationstring[hash] = blockHeight;
        userHash.push(hash);
    }


    function getuserCertificationuint(uint height) public view returns (string memory) {

        return userCertificationuint[height];
    }
    function getuserCertificationstring(string memory hash) public view returns (uint) {

        return userCertificationstring[hash];
    }

    //Get the height of the chain
    function getblockHeight() public view returns (uint) {
        return blockHeight;
    }

    //Return to the administrator address
    function getManager() public view returns (address) {
        return manager;
    }
    //Get the total number of users
    function getUserCount() public view returns (uint256) {
        return userHash.length;
    }
    modifier onlyOwner {
        require(manager == msg.sender);
        _;
    }
}