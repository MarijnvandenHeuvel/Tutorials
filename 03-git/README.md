# Git Overview:

## What is version control? Why do we need it?

When working on code, we have the following requirements:

* For us developers, source code is our most valuable asset, we should treat it with care
* We should always have a backup of our code
* We want to make changes to source code over time as a team in a managed way, with minimum disruption to other team members
* Team members should be able to work on features individually and concurrently without overwriting each others changes
* There should be a history of changes that we can trace and possibly link to other systems (for example linking to changes in an issue tracker)
* We should be able to revert those changes

Version control software is a piece of software that operates as a stand-alone application, independent of our programming language of choice that tries to solve these problems.

Version control does not only apply to software development. Word processors and spreadsheet applications often have this ability too. 

If you're having trouble understanding the concept, think about Wikipedia. It has a feature called _page history_ that shows the order in which changes were made to any editable Wikipedia page and the difference between any two versions. Can you see why this is useful or maybe even essential to an application like Wikipedia? Perhaps now you can better understand why those same features would also be very desirable for managing source code?

A similar feature can be found in modern applications like Google Docs. Imagine you have deleted something you do not want to delete. Luckily, Google Docs keeps track of your change history, and it is easy to roll back to a point where you did not yet perform the delete.

## Why Git?

There are many existing version control systems (e.g. Subversion, Mercurial, Perforce, Darcs, ClearCase, Bitkeeper, Bazaar, etc.). We will learn how to use Git. But why Git?

* **Fast**: Git does most of the performance-intensive operations on your local machine (as opposed to a remote server in some other systems), and it was initially built primarily for managing the Linux kernel source code, so it was built for large repositories from day one.
* **Free and Open Source Software**: Git is released under an open-source license, meaning that it will always be free for you to use in both your personal and enterprise projects. It is maintained by a large community of contributors.
* **Mature and actively maintained**
* **Secure**: Git ensures cryptographic integrity of your entire codebase. 
* **Widespread use**: Git is one of the most popular version control systems in use right now. Learning git will give you an advantage in nearly every future software project.
* **Battle tested**: Used internally by large software companies (Google, Facebook, Microsoft, Netflix, etc.) and for big open-source projects (Linux kernel, Android, PostgreSQL, Ruby on Rails, etc.) 
* **Powerful**: Relatively easy to learn thanks to excellent online resources, plus plenty of flexibility/power for advanced users
* **Distributed**: Git is known as a Distributed Version Control System (DVCS). Essentially, this means that all users own a complete copy of the repository on their local machine, and that you don't need a server/internet/remote to reap the benefits of version control.

## Basic concepts

Below is an introduction to some of the most common terms of the Git vocabulary:

|Term|   |
|---|---|
|Repository| A repository contains all project files including documentation and stores the revision history of all the files. |
|Branch| This is a parallel version of repository. It is contained within the repository, but doesn't affect the master branch to enable you to work freely on a copy of the project without disrupting the live/main version. |
|Merge| Takes the changes from one branch and apply them into another branch of the repository. |
|Clone| This feature creates a copy of the repository locally on your computer |
|Commit| An individual change to a file or set of files. It saves all changes into the history of the repository. |
|Fork| A personal copy of another user's repository. The feature is generally used when working on public repositories. |
|Diff| The difference in changes between two commits. |
|Fetch| Refers to getting the latest changes from a remote repository without merging them in. Ideal for reviewing changes before merging. |
|Pull| Fetches the latest changes from the remote repository and automatically merges them. |
|Push| Transfers your local commits to the remote repository |
|SHA| SHA key is a unique identifier key for each commit. |
|Remote| A non-local mirror of a code repository. |
|Tag| Allows you to tag specific points in history as being important. Ideal for marking milestones or releases. |
|HEAD| Pointer to the last commit made. |

## Online introduction

Let's get our feet wet! [Complete the Github git tutorial!](https://try.github.io)

## Create a GitHub Account

Create an account on [GitHub](http://www.github.com). GitHub is currently the most popular online service for hosting public and private Git repositories. Public repositories are completely free of charge.

While GitHub's main purpose is to host repositories, it has allowed coding to become a more social and fun experience. Be sure to check it out in your spare time!

## Complete the GitImmersion tutorial

The GitImmersion tutorial takes you through the most common things you will do with Git on a daily basis.

Some things to keep in mind however:

* The tutorial uses a Ruby hello world program as an example. You can freely ignore the Ruby aspect of this entire tutorial. Treat the files as if they were merely text-files. When asked to run the example hello world app, ignore the instruction.
* Some of the labs instruct you on setting up your environment. Don't worry about this, we've already installed Git for you and set up your environment accordingly.
* Finally, if you ever get stuck or have to start over, the Cegeka School repository has several lab folders, and you can jump to each of them at any time to continue along with the tutorial.

Start the tutorial [here](http://gitimmersion.com/lab_01.html).

### Remarks for GitImmersion

* All file paths use Unix-style (`/` instead of `\`)
* Lab 8: Environmental variable setup: not required?
* Lab 11: Aliases necessary
* Lab 21: Not necessary and on top of that confusing because of rakefile
* Lab 30: Performance merge tool? Remove?
* Lab 31: This appears to be empty? Could be removed...
* Lab 50: Setting up Git server may be a little too much
* Lab 52: Do we need any more of these topics?

## How to Git
[![How to Git, according to xkcd](https://explainxkcd.com/wiki/images/4/4d/git.png "How to Git, according to xkcd")](https://explainxkcd.com/wiki/index.php/1597:_Git)

## Workflow Cheat Sheet
Below is a short overview of a basic git workflow: 

![Git workflow](img/workflow-cropped.jpg "Git workflow")

## More info and tutorials:

### Basic:

* [An interactive tutorial on the specifics of Git branching](http://learngitbranching.js.org)
* [A basic interactive tutorial on learning git from Code Academy](https://www.codecademy.com/learn/learn-git)
* [Another tutorial, this time using Bitbucket, a competing service like GitHub](https://www.atlassian.com/git/tutorials/learn-git-with-bitbucket-cloud)
* [Collection of Git tutorials by GitHub](https://guides.github.com/)
* [Collection of Git tutorials by Atlassian](https://www.atlassian.com/git/tutorials/)


### Advanced:

* [Telling stories through your commits](http://blog.mocoso.co.uk/talks/2015/01/12/telling-stories-through-your-commits/)
* [Pro Git, a free online book (also available as physical edition)](https://git-scm.com/book/en/v2)
* [Gitref, a concise reference](http://gitref.org/)
* [Official Git documentation](https://git-scm.com/doc)

## Collaboration models

People have been working with git for a long time now, and have discovered different models/workflows of working as a team on a git repository.

These describe some of those models you and your team could use to efficiently collaborate on your projects:

* [https://github.com/blog/1124-how-we-use-pull-requests-to-build-github](https://github.com/blog/1124-how-we-use-pull-requests-to-build-github)
* [http://scottchacon.com/2011/08/31/github-flow.html](http://scottchacon.com/2011/08/31/github-flow.html)
* [http://nvie.com/posts/a-successful-git-branching-model/](http://nvie.com/posts/a-successful-git-branching-model/)
* [https://www.atlassian.com/git/tutorials/comparing-workflows/centralized-workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/centralized-workflow)
