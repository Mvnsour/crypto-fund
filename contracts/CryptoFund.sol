// Get funds from the user
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract CryptoFund {

uint256 public minUsd = 5;

    function fund() public payable {
        // Allow user to send $
        // Have a minimum $ sent
        // To send ETH to this contract
        require(msg.value >= minUsd, "didn't send enough ETH"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **(18)
        //if the condition is false, revert with the error message
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

    function getConversionRate() public {

    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}