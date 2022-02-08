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
	 // Total supply of the coin
	 uint256 supply = 1_000_000;

    constructor() {
        owner = msg.sender;
    }

	 // getTotalsupply returns the contract's supply of money.
    function getTotalSupply() public view returns (uint256) {
        return supply;
    }

	 // depositCoin allows user to store coins to the contract
    function depositCoin() public payable {
		  accounts[msg.sender] += msg.value;
          supply += msg.value;
    }

    modifier ownerOnly {
        require(msg.sender == owner, "Only owner can do this action");
        _;
    }

    mapping(address => uint256) accounts;

    function getCurrentBalance() public view returns(uint256) {
        return accounts[msg.sender];
    }

    // Move `amount` coins from current account to `to`
    function transfer(address to, uint256 amount) public {
		  require(amount < accounts[msg.sender]);
		  accounts[msg.sender] -= amount;
		  accounts[to] += amount;
    }

    // burn destroys `amount` coins 
    function burn(uint256 amount) public ownerOnly{
		  require(amount <= supply);
		  supply -= amount;
    }

    // mint creates new `amount` of coins and store it to the contract.
    function mint(uint256 amount) public ownerOnly{
		  supply += amount;
    }

	 // give sends coins from contract to address `to`.
	 function give(address to, uint256 amount) public ownerOnly {
          require(amount <= supply);
		  supply -= amount;
		  accounts[to] += amount;
	 }
}
