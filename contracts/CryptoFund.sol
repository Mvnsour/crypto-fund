// Get funds from the user
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract CryptoFund {

    uint256 public minUsd = 5e18; // we can also write 5 * 1e18, 5 * (10 ** 18)
    // Array to store addresses of all funders
    address[] public funders;

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
        require(getConversionRate(msg.value) >= minUsd, "didn't send enough ETH"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **(18)
        // Add sender to funders array if not already present
        funders.push(msg.sender);
        // Update the amount funded by this sender
        addressToAmountFunded[msg.sender] += msg.value;
        // Increment the contribution counter for this sender
        ++contributionCounter[msg.sender];
    }

    function withdraw() public {
        
    }

    function getPrice() public view returns(uint256) {
        // we need address and ABI
        // 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // get the latest price of ETH in tems of USD
        (
            /* uint80 roundId */,
            int256 answer,
            /*uint256 startedAt*/,
            /*uint256 updatedAt*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
         return uint256(answer * 1e10);
         /* The ETH price of $2,935.29 is properly converted to wei (2,935,290,000,000,000,000)
        Multiplying by 1e10 converts it back to ETH units
        The comment is accurate and helpful */
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        // How much 1 ETH worth?
        // 2935_29000000000000000
        uint256 ethPrice = getPrice(); // ETH/USD with 18 decimals
        // (2935_29000000000000000 * 1_000000000000000000) / 1000000000000000000
        // $2935.29 = 1 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // ETH to USD
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }


    /* if we want the opposite (USD in ETH) we can do that
    function convertUsdToEth(uint256 usdAmount, uint256 ethPrice) public pure returns(uint256) {
        uint256 ethAmount = (usdAmount * 1e18) / ethPrice;
        return ethAmount;
    } */
}
