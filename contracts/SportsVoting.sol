// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SportsVoting {
    struct Team {
        string name;
        string sport;
        uint256 voteCount;
    }

    Team[] public teams;
    address owner;
    mapping(address => bool) public voters;

    uint256 public votingStart;
    uint256 public votingEnd;

    constructor(string[] memory _teamNames, string[] memory _sports, uint256 _durationInMinutes) {
        require(_teamNames.length == _sports.length, "Team names and sports lengths must match.");
        for (uint256 i = 0; i < _teamNames.length; i++) {
            teams.push(Team({
                name: _teamNames[i],
                sport: _sports[i],
                voteCount: 0
            }));
        }
        owner = msg.sender;
        votingStart = block.timestamp;
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can perform this action.");
        _;
    }

    function addTeam(string memory _name, string memory _sport) public onlyOwner {
        teams.push(Team({
            name: _name,
            sport: _sport,
            voteCount: 0
        }));
    }

    function vote(uint256 _teamIndex) public {
        require(!voters[msg.sender], "You have already voted.");
        require(_teamIndex < teams.length, "Invalid team index.");

        teams[_teamIndex].voteCount++;
        voters[msg.sender] = true;
    }

    function getAllTeams() public view returns (Team[] memory) {
        return teams;
    }

    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet.");
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return votingEnd - block.timestamp;
    }
}
