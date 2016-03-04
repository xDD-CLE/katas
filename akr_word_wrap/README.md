### Notes from meetings

##### 2016-03-04
- Started doing sad path testing.
- Sad path tends to be secondary in terms of design.
- Throwing an exception allowed us to short circuit the API, this is punting on the problem, which is not cool. Someone has to deal with it at some point.
- Throwing a lot of exceptions in ruby is usually a bad practice because there's not a system to handle it.
- Should work handling bad data into the design instead of the API