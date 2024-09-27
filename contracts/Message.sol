// SPDX-Lincense-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Message{

address public owner;

string public Message;

constructor() {
    owner = msg.sender;
}

event MessageSet(address setter, string Message);
event OwnershipTransfered(address previousOwner, address newOwner);

function setMessage(string memory _message) public {
    require(msg.sender != address(0), " you can't set your own Message");
    require(msg.sender == owner, " you aren't the owner");
    Message = _message;


}

function getMessage() public view returns (string memory){
    return Message;
}
function transferOwnership(address _newOwner) public {
    require(msg.sender == owner, "You aren't the owner");
    require(_newOwner != address(0), "You can't transfer ownership to the Zero address");
    owner = _newOwner;
    emit OwnershipTransfered(owner, _newOwner);
}
}