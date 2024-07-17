# GiftFinder Smart Contract

## Overview

GiftFinder is an Ethereum smart contract designed to manage a point-based system for gift eligibility. The contract allows the owner to check and update points to determine if they qualify for premium, standard, or basic gifts based on predefined thresholds.

## Features

- **Owner Restriction:** Only the contract owner can execute certain functions.
- **Points System:** A simple system to manage and verify points for gift eligibility.
- **Events:** Emission of events when points are updated.

## Prerequisites

- Solidity ^0.8.0
- Ethereum wallet and deployment tool (e.g., Remix, Truffle, Hardhat)

## Deployment

The contract is written in Solidity and designed to be deployed on the Ethereum blockchain. It uses Solidity version ^0.8.0.

## Contract Details

### State Variables

- `uint256 public points`: Stores the current points (default is 0).
- `address public owner`: Stores the address of the contract owner.

### Events

- `event PointsUpdated(uint256 newPoints)`: Emitted when points are updated.

### Modifiers

- `modifier onlyOwner()`: Restricts access to only the owner of the contract.

### Constructor

```solidity
constructor() 
{
    // Set the contract deployer as the owner
    owner = msg.sender;
}
```
- Sets the deployer of the contract as the owner.

### Functions

#### checkForPremiumGift

```solidity
function checkForPremiumGift(uint256 newPoints) external onlyOwner
{
    require(newPoints > 90, "You are not eligible for the premium gift.");

    points = newPoints;
    emit PointsUpdated(newPoints);
}
```
- Checks if `newPoints` is greater than 90 for eligibility for a premium gift.
- Updates the `points` and emits the `PointsUpdated` event if eligible.

#### checkForStandardGift

```solidity
function checkForStandardGift(uint256 newPoints) external onlyOwner
{
    require(newPoints > 70, "You are not eligible for the standard gift.");

    points = newPoints;
    emit PointsUpdated(newPoints);
}
```
- Checks if `newPoints` is greater than 70 for eligibility for a standard gift.
- Updates the `points` and emits the `PointsUpdated` event if eligible.

#### checkForBasicGift

```solidity
function checkForBasicGift(uint256 newPoints) external onlyOwner
{
    require(newPoints > 50, "You are not eligible for the basic gift.");

    points = newPoints;
    emit PointsUpdated(newPoints);
}
```
- Checks if `newPoints` is greater than 50 for eligibility for a basic gift.
- Updates the `points` and emits the `PointsUpdated` event if eligible.

#### checkMinimumPoints

```solidity
function checkMinimumPoints() external view
{
    assert(points >= 30); // This should always be true
}
```
- Asserts that the `points` are always greater than or equal to 30.

#### checkForAnyGift

```solidity
function checkForAnyGift(uint256 newPoints) external onlyOwner
{
    if (newPoints <= 40) {
        revert("You do not have enough points for any gift.");
    }
    points = newPoints;
    emit PointsUpdated(newPoints);
}
```
- Reverts if `newPoints` is less than or equal to 40.
- Updates the `points` and emits the `PointsUpdated` event if eligible.

## Usage

1. **Deploy the Contract:**
   Deploy the `GiftFinder` contract to the Ethereum blockchain using a tool like Remix, Truffle, or Hardhat.

2. **Check and Update Points:**
   The owner can call `checkForPremiumGift`, `checkForStandardGift`, `checkForBasicGift`, and `checkForAnyGift` functions to check eligibility and update points.

3. **Verify Minimum Points:**
   Use the `checkMinimumPoints` function to ensure that the points are above the minimum threshold.

## License

This project is licensed under the MIT License.
