# quiz_master

## Install
1. Clone or [download](https://github.com/tobiasgh/quiz_master/archive/master.zip) repo:

  ```
  $ git clone git@github.com:tobiasgh/quiz_master.git
  ```

2. Set up development environment:

  **Note**: Make sure you have `rbenv` installed. Ruby version is **2.4.0**.
  ```
  $ bundle install
  ```
  ```
  $ bundle exec rake db:migrate
  ```
  ```
  $ bundle exec rake db:seed
  ```

## Usage
1. Run server:

  ```
  bundle exec rails s
  ```
  
2. Sign in details:

  - **Email:** *teacher@quizmaster.com* or *student@quizmaster.com*
  - **Password:** *quizmaster*
