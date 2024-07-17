// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GiftFinder 
{
    uint256 public points = 0;
    address public owner;

    // Event to notify when points are updated
    event PointsUpdated(uint256 newPoints);

    // Modifier to restrict access to the owner
    modifier onlyOwner() 
    {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor() 
    {
        // Set the contract deployer as the owner
        owner = msg.sender;
    }

    // Function to check eligibility for premium gift
    function checkForPremiumGift(uint256 newPoints) external onlyOwner 
    {
        require(newPoints > 90, "You are not eligible for the premium gift.");

        points = newPoints;
        emit PointsUpdated(newPoints);
    }

    // Function to check eligibility for standard gift
    function checkForStandardGift(uint256 newPoints) external onlyOwner 
    {
        require(newPoints > 70, "You are not eligible for the standard gift.");

        points = newPoints;
        emit PointsUpdated(newPoints);
    }

    // Function to check eligibility for basic gift
    function checkForBasicGift(uint256 newPoints) external onlyOwner
    {
        require(newPoints > 50, "You are not eligible for the basic gift.");

        points = newPoints;
        emit PointsUpdated(newPoints);
    }

    // Function to check the minimum points required for any gift
    function checkMinimumPoints() external view 
    {
        assert(points >= 30); // This should always be true
    }

    // Function to revert if points are not sufficient for any gift
    function checkForAnyGift(uint256 newPoints) external onlyOwner {
        if (newPoints <= 40) {
            revert("You do not have enough points for any gift.");
        }
        points = newPoints;
        emit PointsUpdated(newPoints);
    }
}
