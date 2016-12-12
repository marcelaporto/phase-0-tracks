
# Git Definitions

----
## Oh yeah

** Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
  * Version control is a tool that allows you to track progress, review and revert changes, and create backups in your code. Version control is usefull to track changes in your code and manage multiple authors when you have a project that has more than one contributor. 

* What is a branch and why would you use one? 

  * Creating a branch in Git gives you a "copy" of your project to work on. You could switch between branches depending on what you felt like working on. Once a given change was complete, you could merge it back into the original project. 

* What is a commit? What makes a good commit message?
  * Commits are "saving points" in Git. Before you can check out a new branch or move to an existing branch, all files must be committed. Once files are committed, you have a save point and you can go back to this point later if needed. Each commit has: A Unique ID; Author; Date; Message (of what was done). A good commit message should be concise, specific, and answer the question: why is the change necessary, and what side effects does this change have? 

* What is a merge conflict?
  * Merge conflict usually occurs when your current branch and the branch you want to merge into the current branch have diverged. That is, you have commits in your current branch which are not in the other branch, and vice versa. Merge conflicts occur most notably when changing the same file. 