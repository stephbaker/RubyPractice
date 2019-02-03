# Exercise 2.3 - Song

Join the [Song](https://classroom.github.com/a/swnkwLbk) GitHub Classroom assignment.

Read and run the code provided in [song.rb](song.rb) so you understand what it’s doing.

The code is currently in a procedural style; so you will need to make it more object-oriented. However, the main point of this exercise is to practice your encapsulation skills. You will need to make sure that the data and behaviour is well encapsulated in the right places.

**Remember to create a new branch for your work on this exercise.**

1. Add a `play` method to the `Note` class, which outputs a string with the details of that note. Refactor the existing code to use this method, and then make a commit.

> e.g. `Playing a 196.0 hz note for 400 milliseconds.`

2. Create a `Song` class to encapsulate the code that links the notes together. Your class should keep track of the first note in the song. It should have an initializer that can set the first note of the song. It should also have the following methods:

* `play`, which plays each of the notes in the song in order. Refactor the existing to use this method, check that everything still works as expected and then make a commit.

* `duration_ms`, which returns the length of the song. Refactor the existing to use this method, check that everything still works as expected and then make a commit.

* `last_note`, which returns the last note in the song. Refactor the existing to use this method, check that everything still works as expected and then make a commit.

* `add_note`, which adds a note to the end of the song. Refactor the existing to use this method, check that everything still works as expected and then make a commit.

3. Create a PR and answer the following questions in the description of your PR:

* How is the code is now better encapsulated with the changes you made?
* What changes could you make to further improve the encapsulation?

Submit the link to your PR on Canvas.

**Sample Output**

``` text
Playing a 196.0 hz note for 400 milliseconds.
Playing a 329.6 hz note for 400 milliseconds.
This song is 800 milliseconds long.
The last note is 329.6 hz.
Playing a 196.0 hz note for 400 milliseconds.
Playing a 329.6 hz note for 400 milliseconds.
Playing a 261.6 hz note for 400 milliseconds.
This song is 1200 milliseconds long.
```
