// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Necron Tombworld Awakening Protocol
/// @notice Immutable registry of Necron tombworld awakenings across the galaxy.
/// @dev No payable functions, no external calls, no owner, fully safe for public use.
contract NecronTombworldAwakening {

    /// @notice Maximum allowed size for each text field (1000 characters).
    uint256 public constant MAX_TEXT_SIZE = 1000;

    /// @notice A single awakening entry.
    struct Awakening {
        string tombworld;       // Name or designation of the tombworld
        string dynasty;         // Necron dynasty associated with the awakening
        string awakeningStage;  // Dormant, Stirring, Active, Fully Awakened
        string detectedUnit;    // Type of Necron unit detected
        address cryptek;        // Address that submitted the awakening report
        uint256 timestamp;      // Block timestamp of the entry
    }

    /// @notice Public array storing the entire awakening registry.
    Awakening[] public awakenings;

    /// @notice Emitted whenever a new awakening is recorded.
    event AwakeningRecorded(
        string tombworld,
        string dynasty,
        address indexed cryptek,
        uint256 indexed timestamp
    );

    /// @notice Record a new Necron awakening event.
    function recordAwakening(
        string calldata tombworld,
        string calldata dynasty,
        string calldata awakeningStage,
        string calldata detectedUnit
    ) external {
        require(bytes(tombworld).length <= MAX_TEXT_SIZE, "Tombworld text too large");
        require(bytes(dynasty).length <= MAX_TEXT_SIZE, "Dynasty text too large");
        require(bytes(awakeningStage).length <= MAX_TEXT_SIZE, "Stage text too large");
        require(bytes(detectedUnit).length <= MAX_TEXT_SIZE, "Unit text too large");

        Awakening memory entry = Awakening({
            tombworld: tombworld,
            dynasty: dynasty,
            awakeningStage: awakeningStage,
            detectedUnit: detectedUnit,
            cryptek: msg.sender,
            timestamp: block.timestamp
        });

        awakenings.push(entry);

        emit AwakeningRecorded(
            tombworld,
            dynasty,
            msg.sender,
            block.timestamp
        );
    }

    /// @notice Returns the total number of awakening reports.
    function totalAwakenings() external view returns (uint256) {
        return awakenings.length;
    }
}
