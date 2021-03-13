# Ruby Database Project for Epicodus: Volunteer Tracker
#### By: Jon Stump
<img align="center" src="https://avatars2.githubusercontent.com/u/59323850?s=460&u=372c7d529b7379408ae54491ab3449b6e2f4d94d&v=4">

* * *

## Description
This is a website that allows for users to enter information for projects and volunteers related to a non-profit.

![Table Schema](/public/img/volunteer_database_schema.png)
* * *

## Technologies used
* Ruby
* Rspec
* Pry
* Capybara
* Sinatra
* Neovim
* Postgres
* Bootstrap
* HTML
* CSS
* Bundler
* git
* C8H10N4O2

* * *

## Specs
Initial Specs:
| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
| Should allow a user to input a project name  |project name: clean up | Project appears in a clickable list. |
| Should allow a user to input a volunteer that is associated with a project  | name: Jane, project: clean up | volunteer will show up on the project |
| Allow for a project to be updated  | Updated project: "help senoir center with taxes" | "clean up" will be replaced with "help senoir center with taxes" |
| Ability to delete a project  | click Delete on the project page | This removes the project and associated volunteers on from the projects page and DB |

* * *

## Installation :

* Go to ( https://github.com/jonstump/volunteer-tracker ).

* Navigate to the code button on the github website.

* Click on the code button to open the menu.

- Copy the HTTPS code by clicking the clipboard next to the link.

- Within your Bash terminal navigate to your desired location by using cd fallowed by your desired directory.

```bash
 cd Desktop
```

- Once you have chosen your desired directory use the command.
```bash
git clone https://github.com/jonstump/volunteer-tracker
```

<div
  style="
    background-color: #d1ecf1;
    color: grey; padding: 6px;
    font-size: 9px;
    border-radius: 5px;
    border: 1px solid #d4ecf1;
    margin-bottom: 12px"
>
  <span
    style="
      font-size: 12px;
      font-weight: 600;
      color: #0c5460;"
  >
    ⓘ
  </span>
  <span
    style="
      font-size: 12px;
      font-weight: 900;
      color: #0c5460;
      margin-bottom: 24px"
  >
    Note :
  </span>
  If you have any problems make sure your HTTPS code is correct! The example above might not be the most recent HTTPS code!
</div>

* Now that the project is downloaded you will need to run the command 'bundle install' to install all of the gems from the Gemfile.

``` bash
bundle install
```

* In oder to run the tests enter 'rspec' into your terminal.

``` bash
bundle install
```

* If you would like to see the code use the command "editor ." (where editor is your code editor. example code for VScode and vim for Vim) to open the project in your code editor.

``` bash
code .
```
* You will need to have a running version of psql on your computer and tables created for them. To start psql type the following in your terminal.

``bash
psql
``
* To launch a local version of the site in your browser enter the following:

``` bash
ruby app.rb
```
This will launch a local host via Sinatra. You should be able to navigate to http://localhost:4567/ to see the site locally.

## To dos:
* Fix bug for adding Volunteers
* Add Update for Volunteers
* Pass final integration test
* Add update method for Volunteer class
* run bash command to add sql file to project
  - pg_dump volunteer_tracker > database_backup.sql

## Bugs:
* Breaks on adding a Volunteer
  - Possible fix is a route using Projects
  - Other possible fix is to make the project id on the volunteer nil when adding then allowing for them to be updated on the project page.

* * *

## License
> [GPLv3](/LICENSE)\
> Jon Stump &copy; 2021

* * *

## Contact Information
_Jon Stump: [Email](jmstump@gmail.com)_
