# README

If you're here it usually means you want to join our talented team of developers here at Webbernet. This is one of the test applications that we use in our recruitment process to further understand the way you solve problems with code.

## Submitting your work
1. Discuss with us which task(s) you are going to submit
2. Download the project as a zip, and create a separate personal repo in Github with the contents. Don't fork the repo as your submission is viewable to everyone.
3. Send a link to 'applications@webbernet.com.au' with the pull request URLs for the task(s)

## This project
This application we use internally to post status updates from our teams to our customers. This system allows for teams like ours to post updates 'called Releases' to various projects. Customers can subscribe to these updates via email and the system will send them out each day.

You will need to following to run this application:
* Ruby 3.0.3
* Postgres 12

### Steps to setup
1. `$ bundle install`
2. `$ bundle exec rake db:setup` to setup your database locally
3. Login to the team `localhost:3000` with `a@b.com` and `password`

### Specs

* Run specs with `$ rspec`

## Tasks

### Task 1 (Add category column)
When a user logs and views the Releases index (/projects/:id/releases), can the user please see an indication of which Category each release belongs to.

When there is no category, simply display '-'

### Task 2 (Modify how the time is displayed)
On the release index (/projects/:id/releases), split the date/time out into two columns. Make the date dd/mm/yyyy, and the time in 12 hour time.

The timezone for this should be Australia/Brisbane time.

### Task 3 (Add filter to index)
Users have asked to be able to filter the release index (/projects/:id/releases) based on category.

### Task 4 (Modify project permission system)
We've had an issue with the projects permissions feature (/projects/:id/settings/project_users) in the system. When a new project is created, by default, all admin users in that team can view that project and use it. We wish to remove this behaviour as users do not expect this and it's caused confusion.

We'd like it so that only the user that created the release can see the project. If they choose to add more users to the project than that's fine.

### Task 5 (Investigate API searching bug)
A user from Team ID 2 has registered a bug where they cannot some of their releases are not showing when searching via the API. They said they are able to see them in the GUI but not in the API results.

For information on the API head to `/api_settings`

Their API team has sent through a copy of the request they are making:

```shell
curl -X GET \
        'http://releasenet.com/api/projects/12312cacadsasadas11/releases?search=act' \
        -H 'x-api-key: fd123aaa'
```

Identify the problem and implement a fix with tests.

### Task 6 (New feature: Multiple API keys)
This system has an API that can be used to access to releases in the system (/api_settings)

Users would like to be able to setup multiple API keys and manage those accordingly.

This feature should result in the following

* Allow for new APIs to be generated
* Allow for old API keys to be revoked, and as a result, should no longer be able to be used

