// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Storage for Bankroll
 */

struct GameStorage {
    mapping(address => bool) isGame;
    mapping(address => bool) isTokenAllowed;
    address[] allowedTokens; //Can be used to iterate through all tokens in bankroll to determine it's value
    address wrappedToken;
    mapping(address => uint256) suspendedTime;
    mapping(address => bool) isPlayerSuspended;
}

library LibStorage {
    bytes32 constant GAME_STORAGE_POSITION = keccak256("zkasino.storage.game");

    function gameStorage() internal pure returns (GameStorage storage gs) {
        bytes32 position = GAME_STORAGE_POSITION;
        assembly {
            gs.slot := position
        }
    }
}

contract WithStorage {
    function gs() internal pure returns (GameStorage storage) {
        return LibStorage.gameStorage();
    }
}
