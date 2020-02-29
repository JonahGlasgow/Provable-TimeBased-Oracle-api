pragma solidity 0.4.25;
import "./OraclizeAPI_0.4.25.sol";


contract TimeMapper is usingOraclize {
    
string  private currentTime;
uint256 public timestamp;

event newUpdatedTime (string description);
event LogTimeUpdated (uint256 CurrentTime);


function queryTimestamp() public payable {
  emit newUpdatedTime('Oraclized query was sent, standing by for current time');
  oraclize_query(60,"URL", "json(http://api.timezonedb.com/v2.1/get-time-zone?key=O07REL7V77PR&format=json&by=position&lat=52.3065&lng=-114.0973).timestamp");
}


function __callback (bytes32 myid, string result) {
  if (msg.sender != oraclize_cbAddress()) {
  revert();
}
else {
  currentTime = result;
  bytes memory b = bytes(currentTime);
  uint256 uintResult = 0;
for (uint i = 0; i < b.length; i++) { 
if  (b[i] >= 48 && b[i] <= 57) {
  uintResult = uintResult * 10 + (uint(b[i]) - 48); // bytes and int are not compatible with the operator -.
  timestamp = uintResult;
  emit LogTimeUpdated(timestamp);
  
      }
    }
  }
}



}