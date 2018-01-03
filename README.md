# README

My place for practicing Data Structures and Algorithm problems.

And a peek at a typical day during my job search.

```JavaScript
function typicalDay(hasPhoneScreen, hasOnSiteInterview, hasCodingChallenge) {

  if (hasPhoneScreen || hasOnSiteInterview) { return crushInterview(); }

  //Morning
  drinkCoffee().then( () => haveBreakfast() );
  var applicationSubmitted = 0;
  while (applicationSubmitted < 10) {
    applicationSubmitted++;
  }

  //Afternoon
  haveLunch();
  var topics = ["dataStructures", "algorithm", "python"];
  for (var i = 0; i < topics.length; i++) {
    study(topics[i]);
  }

  //Evening
  familyTime();
  if (hasCodingChallenge) {
    doCodingChallenge();
  }
  else {
    studyMore();
  }
  exercise();

  return sleep();
}
```
