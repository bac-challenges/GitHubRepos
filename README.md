XING iOS Coding Challenge
=========================

Welcome to the XING Coding Challenge! This challenge will give us an idea about your coding skills. You get access to this repository for 24 hours. Please plan around 3 hours for this challenge.


Prerequisites
----------------

- Do not use Storyboards or xib files.
- Use Objective-C for this challenge.
- Important for us is code efficiency, following of best practices & code readability.
- Do not focus too much on the design.
- The usage of third party libraries (e.g. with CocoaPods) is explicitly allowed.
- Provide a comprehensive git history.
- Commit directly to master and do not open a PR, then we can efficiently transfer the repo back to our GitHub Enterprise.
- If your API request limit exceeds, you can generate and use a personal access token [here](https://github.com/settings/applications) and add `?access_token=<YOUR_ACCESS_TOKEN>` to the request URLs.


Goals
-----

1. Clone this repository. Use it as your working directory.
2. Bootstrap a new empty application.
3. Request the GitHub API to show [XING's public repositories][1] and parse the JSON response. You can find documentation to the call [here][3].
4. Display a list of repositories in a **UICollectionView**, each entry showing
    - name of repository
    - description
    - login of the owner
5. Show a light green background if the repository is forked and a white one otherwise.


Bonus Goals
------------

- Write unit tests.
- Cache the data so it is available offline.
- Implement a load more mechanism. The load more should be triggered when the scrolling is close to reaching the end of the list. Check out the [pagination documentation][2] for more infos.

  [1]: https://api.github.com/users/xing/repos
  [2]: https://developer.github.com/v3/#pagination
  [3]: https://developer.github.com/v3/repos/#list-organization-repositories
