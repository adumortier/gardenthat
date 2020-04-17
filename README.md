<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://gardenthat.herokuapp.com/">
    <img src="http://pureimg.com/public/uploads/large/241498764339cigllzrqdmwcdvdfqlnvthbmmfjytjttwf0qxzg2b5p6kevggmjzkyixvbv7nhdj3qhz3xyvydqcyjp85mietxfj9mvbs1bgytyl.jpg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Gard(in) That!</h3>

<p align="center">
Gard(in) That is an application meant for ANY gardener. Search a selection of fruit and vegetable bearing plants. Add your favorite plants to your Garden. Automated calendar notifications tell you when to expect your first harvest.


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
  * [Schema](#schema)
* [Getting Started](#getting-started)
  * [Installation](#installation)
* [Usage](#usage)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

<a href="https://ibb.co/fpgZSxG"><img src="https://i.ibb.co/FwrcWDq/Screen-Shot-2020-04-16-at-5-27-44-PM.png" alt="Screen-Shot-2020-04-16-at-5-27-44-PM" border="0"></a>

Gard(in) That was built on a rails framework that is linked with two different Sinatra microservices. Our plant microservice houses a database of basic plant information and is tied to GrowStuff's API (see acknowledgments section below). Our second microservice ties into Google Calendars. OAuth is also through Google. 

Our Plant MicroService can be found here: https://github.com/nkeller1/plant_search

Our Notification MicroService can be found here: https://github.com/adumortier/notifications

<p align="center">
![alt text](app/assets/images/demo_gardenthat.gif)

### Built With

* Ruby on Rails
* Sintra
* Deployed With Heroku
* PostgreSQL
* Bootstrap
* RSpec
* RackTest
* Travis CI
* A forge of amazing RubyGems

### Schema

![alt text](app/assets/images/schema.png)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Installation

1. Clone the repo
```sh
git clone https://github.com/adumortier.git
```
2. Install the Gem File
```sh
bundle install
```
3. Create your environment
```sh
rails db:create
rails db:migrate
```
4. Install Figaro
```sh
bundle exec figaro install
```
5. You will need to set up your application.yml file with your google API information
```sh
GOOGLE_CLIENT_ID: <YOUR KEY HERE>
GOOGLE_CLIENT_SECRET: <YOUR KEY HERE>
TEST_USER_GOOGLE_TOKEN: <YOUR KEY HERE>
TEST_USER_GOOGLE_REFRESH_TOKEN: <YOUR KEY HERE>
```


<!-- USAGE EXAMPLES -->
## Usage

As a visitor, you can search for and browse the plants we currently have available. If you want to create a garden, sign up! You may create as many gardens as you wish.  If you find a plant that you want to add to a garden, navigate to the plant's detail page and click 'Add plant to my garden'. Once the plant has been added our background workers will automatically add the estimated best time to harvest your plant to your calendar. 

Future iterations will include: 
* a watering schedule for the plants in your garden(s). 
* recommendations based on your location
* suggestions based on the plants you already have in your garden
* a 'Tips' section on how to get the most out of your garden
* an entire Gard(in) That community!


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [GrowStuff.org](https://www.growstuff.org/)
* [Google Dev](https://console.developers.google.com/)

## Developer GitHub Profiles

Paul Debevec - [GitHub](https://github.com/PaulDebevec) <br>
Alex Dumortier - [GitHub](https://github.com/adumortier)<br>
Nathan Keller - [GitHub](https://github.com/nkeller1)<br>
Will Kunz - [GitHub](https://github.com/willkunz13)<br>

Deployed Application on Heroku: [Gard(in) That!](https://gardenthat.herokuapp.com/)
