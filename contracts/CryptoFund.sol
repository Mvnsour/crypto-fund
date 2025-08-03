// Get funds from the user
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PriceConverter} from "./PriceConverter.sol";

contract CryptoFund {

    using PriceConverter for uint256;

    uint256 public minUsd = 5e18; // we can also write 5 * 1e18, 5 * (10 ** 18)
    
    address[] public funders; // Array to store addresses of all funders

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Mapping to track how much each funder has contributed (address => amount)
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    mapping(address funder => uint256 amountContributed) public contributionCounter;

    function contributionCount(address funder)public view returns(uint256) {
        return contributionCounter[funder];
    }

    function fund() public payable {
        // Allow user to send $
        // Have a minimum $ sent
        // To send ETH to this contract
        //if the condition is false, revert with the error message
        require(msg.value.getConversionRate() >= minUsd, "didn't send enough ETH"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **(18)
        // Add sender to funders array if not already present
        funders.push(msg.sender);
        // Update the amount funded by this sender
        addressToAmountFunded[msg.sender] += msg.value;
        // Increment the contribution counter for this sender
        ++contributionCounter[msg.sender];
    }

    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0); // reset the array to empty
        // actually withdraw the funds with 3 differents ways
        // transfer
        // payable(msg.sender).transfer(address(this).balance); // msg.sender = address | payable(msg.sender) = payable address
        // send
        // bool sent = payable(msg.sender).send(address(this).balance);
        // require(sent, "Failed to send Ether");
        // call
        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Failed to send Ether");
    }

    modifier onlyOwner() {
        // if _ is above that means 'we execute the code first
        require(msg.sender == owner, "You must be the owner");
        _; // _ is a placeholder for the rest of the function
    }

}