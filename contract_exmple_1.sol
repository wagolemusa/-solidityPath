
pragma solidity >= 0.5.0<0.6.0;

contract ZombieFactory{
	event NewZombie(uint ZombieId, string _name, uint _dna);

	uint dnaDigits = 16;
	uint dnaModulus = 10**dnaDigits;

	struct Zombie{
	uint age;
	string name ;
	}

	Zombie[] public zombies;

	function _createZombie(string memory _name, uint _dna) private {
	uint id = zombies.push(Zombie(_name, _dna)) - 1; (the error is on this line)
	emit NewZombie(id, _name, _dna);

	}

	function _generetaRandomDna(string memory _str) private view returns (uint) {
	uint rand = uint (keccak256(abi.encodePacked(_str)));
	return rand % dnaModulus;
	}
	
	function _generetaRandomZombie(string memory _name) public{
	uint randDna =  (_generetaRandomDna(_name));
	_createZombie(_name, randDna);
	}
}