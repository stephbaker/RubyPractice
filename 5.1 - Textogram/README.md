# Exercise 5.1 - Textogram
Join the [Github classroom](https://classroom.github.com/a/cdo64udc) assignment.

For this exercise, you are going to make a histogram of characters that are found in a given string of text. A [histogram](https://www.mathsisfun.com/data/histograms.html) is like a bar chart for ranges of data.

## Part One
1. Write a class that satisfies the following requirements:

   * The user can specify various options when asking for the histogram: whether to count characters in a case-sensitive manner or not, whether to include special (i.e. non-alphanumeric) characters, and one further option of your choice. Options will be passed into a method using keyword arguments with default values.

   * The class should have a method that returns a hash representing the histogram (each key being a character, and each value a count), and a `to_s` method that can be used to print the histogram. 

   * The characters should be sorted in the printout, which would look something like this for the string `"HELLO World!"` when the user sets the case-sensitive option to `false` and the special characters option to `true`:

```
!  *
d  *
e  *
h  *
l  ***
o  **
r  *
w  *
```

2. At the bottom of the file, write code that checks that the class works as expected on small examples of text that you write out yourself. Be sure to try out some edge cases (empty strings are just one example!).

## Part Two
3. Now you will adjust your class to fit a new requirement: you want to be able to get a histogram for not just letters, but one for words as well. Update your class how you see fit to make this possible.

4. Write code at the bottom of the file to check that the new type of histogram works.

5. Once you are satisfied, choose a text from [Project Gutenberg](https://www.gutenberg.org/) to test with. Read the file into your program, clean it up as you see fit (e.g. stripping unnecessary whitespace), and build a histogram for the text. Display the hash representing the histogram as well as print out the visually formatted histogram.

Remember to make your printouts easy to follow for the grader! Add lines to your printout that explain what you are doing in the code if it's not obvious when running the program.

Include all code and the chosen Project Gutenberg file in your PR.
