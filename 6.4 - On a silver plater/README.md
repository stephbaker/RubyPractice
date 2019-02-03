# On a Silver Platter

Join the [Github classroom assignment](https://classroom.github.com/a/NkKr6-dz).

"If it eats like a food, then it's a food" Ok, it doesn't have the same ring as the "quacks like a duck" saying, but we can still have some fun with food for this exercise on duck typing.

1. Define the following classes:

  * `Fruit`, which implements a custom `to_s` method
  * `Apple`, which extends `Fruit`, overrides the `to_s` method and implements an `eat` method
  * `Banana`, which extends `Fruit`, overrides the `to_s` method and implements an `eat` method
  * `Cheese`, which implements a custom `to_s` method as well as an `eat` method
  * `Sausage`, which implements a custom `to_s` method as well as an `eat` method

2. Under the class definitions, create a variable called `silver_platter` that stores a list of at least one instance of each class you defined above. Then, iterate through the list using `each`, first printing out the object using its `to_s`, then calling the `eat` method. Did you run into any problems? Why or why not? (Include your written answer in your PR description.)

3. Remove the error by updating what is in your `silver_platter` list. What did you have to remove, and why? (Include your written answer in your PR description.)

4. Finally, add whatever you removed back to the list, and use `respond_to?` to fix the error.
