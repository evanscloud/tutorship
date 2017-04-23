# Contributing
We love pull requests from everyone. By participating in this project, you
agree to abide by the tutorship [code of conduct].

[code of conduct]: ./CODE_OF_CONDUCT.md


Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code ( **no patch is too small** : fix typos, add comments, clean up inconsistent whitespace )
* by refactoring code
* by closing [issues][]
* by reviewing patches

[issues]: https://github.com/tutorship/tutorship/issues

## Project setup

You are going to need the following dependencies installed:

- [Ruby](ruby-lang.org) (>= 2.4)
- [Bundler](http://bundler.io/) (>= 1.13)
- [PostgreSQL](https://www.postgresql.org) (>= 9.4)
- [Node](https://nodejs.org) JS (v6.x)
- [Yarn](https://yarnpkg.com/) package manager
- [Git](https://git-scm.com)


## Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a [Gist][]
that includes a stack trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## Submitting a Pull Request
1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Implement your feature or bug fix.
4. Mention how your changes affect the project to other developers and users in the [`CHANGELOG.md`][changelog] file.
5. Add yourself as a [contributor](#add-yourself-as-a-contributor)
6. Add, commit, and push your changes.
7. [Submit a pull request.][pr]

[changelog]: ./CHANGELOG.md

## Add yourself as a contributor

This project follows the all contributors specification. To add yourself to the
table of contributors on the README.md, please use the automated script as part
of your PR:

        $ yarn run add-contrib <YOUR_GITHUB_USERNAME>

Follow the prompt. If you've already added yourself to the list and are making
a new type of contribution, you can run it again and select the added
contribution type.

## Notes
* Please add tests if you changed code. Contributions without tests won't be accepted.
* If you don't know how to add tests, please put in a PR and leave a comment
  asking for help. We love helping!

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/
