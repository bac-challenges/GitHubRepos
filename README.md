XING iOS Coding Challenge
=========================

This challenge will give us an idea about your coding skills. You get access to this 
repository for 24 hours. Please plan around 3 hours for this challenge.


Steps
-----

1. Clone this repository. Use it as your working directory.
2. Bootstrap a new empty application.
3. Request the GitHub API to show [XING's public repositories][1] and parse the JSON
   response.
4. Display a list of repositories in a collection view, each entry should show
    - repo name
    - description
    - login of the owner
5. Request only 10 repos at a time. Implement a load more mechanism. The
   load more should be triggered when the scrolling is close to reaching the end of the
list. Check the [pagination documentation][2].
6. Cache the repos.
7. Show a light green background if the `fork` flag is false or missing, a white one
   otherwise.


Additional Notes
----------------

- Do not use Storyboards or xib files.
- Important for us is code efficiency, following of best practices & code readability.
- Do not focus too much on the design.
- The usage of third party libraries (e.g. with CocoaPods) is explicitly allowed.
- Provide a comprehensive git history.


Bonus Points
------------

- Write unit tests.


  [1]: https://api.github.com/users/xing/repos
  [2]: https://developer.github.com/v3/#pagination
