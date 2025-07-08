// Get funds from the user
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract CryptoFund {

    function fund() public payable {
        // Allow user to send $
        // Have a minimum $ sent
        // To send ETH to this contract
        require(msg.value >= 1e18, "didn't send enough ETH"); //1e18 = 1 ETH = 1000000000000000000 = 1 * 10 **(18)
        //if the condition is false, revert with the error message
    }

    function withdraw() public {
        
    }

    function getPrice() public {
        // we need address and ABI
    }

    function getConversionRate() public {

    }

}