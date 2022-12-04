# Advent of Code - 2022

We're writing some ruby (again). I'll document some things. Can't wait

## Day 1 - Calorie counting
Nice to be back into it. Nice warm up exercise. I brought across a number of utility functions that I used in previous years. Found that adding an Elf abstraction that could return the "total_calories" held by that elf was really useful because I could use it to sort, sum, map etc.

## Day 2 - Rock, paper, scissors
This was a nice example of why I choose to tackle these problems using the method that I do. It is a common occurence in software engineering to have to iterate on changing assumptions and it's a test of your application to be able to do that as minimal friction as you can manage.
The core change in this problem was how we calculate the game choice that you make, the rest of the score calculations stay the same. I was able to achieve this by abstracting the choice calculation into it's own class and being able to specify which strategy we wanted to use.

## Day 3 - Backpacks and groups of backpacks
The key to this one was that the core functionality was being able to compare any number of strings and find a common char. This was easily done using ruby's intersect operator `&`. The string splitting of part 1 is actually more of a mislead.