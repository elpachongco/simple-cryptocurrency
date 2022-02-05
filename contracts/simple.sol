// simple.sol is a smart contract for a simple cryptocurrency
// that allows transfers, burning, and minting.
// Only the deployer of the contract can burn and mint.
// SPDIX-License-Identifier: GPLv3
pragma solidity >0.7.0;

contract simpleCryptoCurrency {
    address owner;
    string name = "Simple";
    string ticker = "SIMP";
    string author = "Glowie";

    constructor() {
        owner = msg.sender;
    }

    uint256 private coin_amount = 0;
    function getCoinAmount() public view returns (uint256) {
        return coin_amount;
    }

    function addCoin() public payable {
        coin_amount += msg.value;
    }

    modifier ownerOnly {
        require(msg.sender == owner, "Only owner can do this action");
        _;
    }

    mapping(address => uint256) balances;

    // Move `amount` coins from current account to `to`
    function transfer(address to, uint256 amount) public {
        balances[]
    }

    // Destroy `amount` coins 
    function burn(uint256 amount) public ownerOnly{

    }

    // Create new `amount` coins and store it to `to`
    function mint(uint256 amount, address to) public ownerOnly{
        
    }

}