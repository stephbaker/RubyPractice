# Exercise 5.4 - Test the Teacher
Join the [Github Classroom](https://classroom.github.com/a/mgthN6qV) assignment.

For this exercise, you are going to write Minitest tests to check code written by one of our instructors.

You will be testing Gail's solution for Advent of Code 2017, Day 4. We have prepared an updated, testable version of her quick and dirty code [originally found on her personal Github account](https://github.com/gailcarmichael/adventofcode2017). The problem statement is [partially available on the Advent of Code website](https://adventofcode.com/2017/day/4), but because you have to finish Part 1 to see Part 2, we will include the full problem below.

1. Read through the problem and the provided solution code.

2. Write a set of Minitest tests that demonstrate whether the code works for all cases (it might not!). Include the cases suggested in the problem as well as more of your own. Be sure that each test checks one and only one thing.

Include in your PR all code and input files you use along with your tests.

## Advent of Code 2017, Day 4: High-Entropy Passphrases
### Part One
A new system policy has been put in place that requires all accounts to use a passphrase instead of simply a password. A passphrase consists of a series of words (lowercase letters) separated by spaces.

To ensure security, a valid passphrase must contain no duplicate words.

For example:
* `aa bb cc dd ee` is valid.
* `aa bb cc dd aa` is not valid - the word `aa` appears more than once.
* `aa bb cc dd aaa` is valid - `aa` and `aaa` count as different words.

The system's full passphrase list is available as your puzzle input. How many passphrases are valid?

### Part Two
For added security, yet another system policy has been put in place. Now, a valid passphrase must contain no two words that are anagrams of each other - that is, a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.

For example:
* `abcde fghij` is a valid passphrase.
* `abcde xyz ecdab` is not valid - the letters from the third word can be rearranged to form the first word.
* `a ab abc abd abf abj` is a valid passphrase, because all letters need to be used when forming another word.
* `iiii oiii ooii oooi oooo` is valid.
* `oiii ioii iioi iiio` is not valid - any of these words can be rearranged to form any other word.

Under this new system policy, how many passphrases are valid?
