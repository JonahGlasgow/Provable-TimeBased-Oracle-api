# Provable-TimeBased-Oracle-api
Provable Ethereum Oracle Api - Time based validation 

This contract is a basic demonstration of off chain time validation based on real world positioning using latitude and longitude. Timestamp can be called using Oraclized callback function to return an accurate Unix time also known as Epoch time which is widely used in Unix systems. 

### Getting Started

&nbsp;

Thanks to this __Ethereum API__, enriching your smart-contracts with external data using __Provable__ is very easy!

In Solidity it is as simple as inheriting the __`usingProvable`__ contract that you'll find in this repository.

This will provide your contract with functions like __`provable_query(...)`__, which make it trivial for you to leverage our oracle technology straight away.

If you're using the __[Remix IDE](http://remix.ethereum.org)__ it's even easier still - simply import __Provable__ into your contract like so:

```solidity

import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.25.sol";

```

To learn more about the Provable technology, please refer to our __[documentation here](https://docs.oraclize.it)__.

&nbsp;

***

&nbsp;

If you have any addition question about getting started please refer to [The Provable blockchain documentation](https://docs.provable.xyz/) Or [The Provable blockchain GitHub](https://github.com/provable-things/ethereum-api)

### TimeOraclized.sol

The general motivation was to convert the callback functions string values to uint256 so it can be used later appropriately to execute further instruction. 

```
function __callback (bytes32 myid, string result) {
  if (msg.sender != oraclize_cbAddress()) {  // @dev (security) the callback sender must be oraclizeAPI_0.4.25.sol _cbAddress or anyone could deploy a new contract with a new api thus changing the return value to be converted.
  revert();
}
else {
  currentTime = result; // @dev callback returns string value 
  bytes memory b = bytes(currentTime); // @dev string conversion starts here 
  uint256 uintResult = 0;
for (uint i = 0; i < b.length; i++) { 
if  (b[i] >= 48 && b[i] <= 57) {
  uintResult = uintResult * 10 + (uint(b[i]) - 48); // @dev bytes and int are not compatible with the operator -.
  timestamp = uintResult;   // @dev string conversion ends here and is now displayed in uint256.
  emit LogTimeUpdated(timestamp);
  
      }
    }
  }
}

```

This solution is very clunky and not recommended for production however is should display enough of an example where the conversion should take place before being used further.


### References 

* [Solidity 0.4.25 documentation](https://solidity.readthedocs.io/en/v0.4.25/)
* [The Provable blockchain documentation](https://docs.provable.xyz/)
* [Truffle Suite - SMART CONTRACTS MADE SWEETER](https://www.trufflesuite.com/truffle)


