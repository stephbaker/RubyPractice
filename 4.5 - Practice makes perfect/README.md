# Exercise 4.5 - Practice Makes Perfect

Join the [Github Classroom](https://classroom.github.com/a/NfqGESuu) assignment.

[Learning research tells us](https://www.amazon.ca/Make-Stick-Science-Successful-Learning/dp/0674729013/) that we shouldn’t practice something in large, focussed chunks of time. Instead, we should space out our practice, leaving just enough time in between so we forget what we’re learning just enough to make recalling it take some effort. You will simulate the process in this exercise.

1. Create a method called `simulate_studying`. Have it simulate having a student practice in a spaced manner as described above (you are empowered to interpret what this means exactly). For the actual studying part, `yield` to a block, passing in an argument representing the current study session number (e.g. first, second, third, …) and saving a return value representing how effective the study session was. Use the effectiveness return value somehow in deciding when studying is complete. Make a commit.

2. Write code that calls `simulate_studying` at least twice to check if it works, each time passing along a block that represents a different kind of studying (such as studying for a spelling test vs practising a musical piece). Each block should use the incoming argument (the study session number) differently, and compute the return value (effectiveness) differently. Be sure that the output of the testing code illustrates that your method and blocks are working as intended. Make a commit.
