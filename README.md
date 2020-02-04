# XING iOS Coding Challenge

Welcome to the XING Coding Challenge! This challenge will give us an idea about your coding skills. You get access to this repository for 48 hours.  We expect this challenge to take you between 4 and 6 hours so please plan accordingly.


## Prerequisites

* Use Swift for this challenge.
* Do not use Storyboards or xib files.
* We evaluate the pull request you send based on the [quality checklist](quality_checklist.md).
* Do not focus too much on the design.
* The usage of third party libraries (e.g. with CocoaPods) is explicitly allowed.
* Provide a comprehensive git history.
* If you want to use different branches, please make sure that they’ll be merged into master branch when you’ll finish the task.
* If your API request limit exceeds, you can generate and use a personal access token [here](https://github.com/settings/applications) and add `?access_token=<YOUR_ACCESS_TOKEN>` to the request URLs.


## Goals

1. Clone this repository. Use it as your working directory.
2. Bootstrap a new empty application.
3. Request the GitHub API to show [XING's public repositories](https://api.github.com/orgs/xing/repos) and parse the JSON response. You can find documentation to the call [here](https://developer.github.com/v3/repos/#list-organization-repositories).
4. Display a list of repositories, each entry showing
	* name of repository
	* description
	* login of the owner
5. Show a light green background if the repository is forked and a white one otherwise.
6. The business logic should be tested by unit tests.



## Bonus Goals

* Cache the data so it is available offline.
* Implement a load more mechanism. The load more should be triggered when the scrolling is close to reaching the end of the list. Check out the [pagination documentation](https://developer.github.com/v3/#pagination) for more info.
* On a long click on a list item show a dialog to ask if should go to repository html_url or owner html_url which is then opened in the browser.
* Display owner’s avatar image and cache it accordingly.

---
Now, let's get started. We wish you good luck!
