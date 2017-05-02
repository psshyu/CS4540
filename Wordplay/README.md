# Assignment 1
Due:  11:59pm on Friday, February 3rd.


# Overview

This assignment has several goals:

1.  Introduce you to writing your first Ruby program, including getting familiar with iterators, blocks, instance variables, classes, and methods.
2.  Get familiar with writing code in the Cloud9 IDE.
3.  Gain experience in using github as a source code repository.
4.  Use Rubocop to apply standardization rules.


# What you need to do to complete this assignment:

1.  Create an account on Cloud9.  I suggest you make the account name the same as your Github account name.
2.  Create an account on Github.
3.  Accept the assignment url when it's sent to you.
4.  Clone your repository into your Cloud9 environment.
5.  Create a branch in your local repository.
6.  Change to that branch to do your work.
7.  Do whatever is necessary to ensure that all the tests in game_helper_test.rb pass.  
8.  Commit your work to the local repository.  (add + commit)
9.  Push your local repository to your Github repository.
10. Execute a pull request on Github and include a note directed to me with
the comment "grade this" in it.  Specifically, you'll need to add a note of 
this form:
``` 
  @davidlbean grade this
```
I'll use that note to find the PR you want graded, and I'll grab the most recent one
up to the turn-in date/time.  What that means is that if you do the PR at 7pm 
on the due date and then you release you forgot something, you can push another
batch of code and do another PR at, say, 11pm, and the grading bot will pay
attention to the 11pm PR and ignore the 7pm PR.  
11. To make this all work, we need to know how to map from your Github username
to your University ID.  Register this via the Google form that Ash setup.

# Rubric

Task | Value
You successfully accept the assignment link and your repository
is created on Github under the class account. | 10%
Your repository contains at least one non-master branch. | 10%
You execute a PR with the correct format to trigger the grader bot. | 10%
All the tests run to completion. | 20%
Your Ruby code passes all Rubocop tests. | 20%
You register your Github username with your U-number with us.  | 10%



# Task 7

Using the supplied code, your job is to add functionality so that the 
following lines are executed without exceptions and return the correct
results given a specific input file.

## Test Case 1
Find all words of length five that begin with 'e' and do not contain 'x'.
This test can be completed using the supplied code file, and a test
has already be provided to show you how this happens.
```
gh = GameHelper.new   # load the default data file
gh.all_words.with_word_length(5).begins_with('e').does_not_contain('x')
```

## Test Case 2
Find all words of length 6 that begin with either an 'e' or an 'a' and
do not contain 'y' nor 'i'.  
This test can be completed using the supplied code file, and a test
has already be provided to show you how this happens.
```
gh = GameHelper.new   # load the default data file
gh.all_words.with_word_length(6).begins_with('e','a').does_not_contain('y','i')
```

## Test Case 3
Find all words of length 6 that begin with an 'e', do not contain another 'e',
and do not contain a 'y'.  To do this, create a new member function called
char_count_less_than() that accepts two parameters -- a char and a count.
```
gh = GameHelper.new   # load the default data file
gh.all_words.with_word_length(6).begins_with('e').char_count_less_than('e',2).does_not_contain('y')
```


## Test Case 4
Find all words of length 4 or 5 that contain a 'y' but do not end with a 'y'.
Note that you will have to ensure that the with_word_length() function can accept more than one parameter.  (Yes, there are other ways of doing this, but we will be testing for this specific functionality.)  You will also need to 
create a does_not_end_with() function that takes a variable number of arguments,
i.e. characters.
```
gh = GameHelper.new   # load the default data file
gh.all_words.with_word_length(4,5).contain('y').does_not_end_with('y')
```

# Misc Notes

An excellent article on how we'll be using Github.

http://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/