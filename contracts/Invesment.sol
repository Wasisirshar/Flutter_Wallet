// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Investment {
    uint256 blanceAmount;
    uint256 depositValue;
    uint256 thresholdAmount;
    uint256 returnOnInvesment;

    event BalanceChange(uint depositAmount, uint blanceAmount);

    constructor() {
        thresholdAmount = 12;
        returnOnInvesment = 3;
    }

    function getWallet()
        public
        view
        returns (uint256 _blanceAmount, uint256 _depositview)
    {
        return (_blanceAmount = blanceAmount, _depositview = depositValue);
    }

    function addDepositAmount(uint256 deposit) public {
        depositValue += deposit;
        blanceAmount += deposit;

        if (depositValue >= thresholdAmount) {
            blanceAmount += returnOnInvesment;
        }
        emit BalanceChange(depositValue, blanceAmount);
    }

    function withdrawAmount(uint256 withdraw) public {
        require(blanceAmount > withdraw, "not enough blanace");
        blanceAmount -= withdraw;
        depositValue -= withdraw;

        emit BalanceChange(depositValue, blanceAmount);
    }
}
