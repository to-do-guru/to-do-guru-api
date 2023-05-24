<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">To Do Guru</h3>
  
  ![logo-green](https://github.com/to-do-guru/to-do-guru-api/assets/108768349/d6091c8a-c1c6-47db-beaa-ca09923b0252)


  <p align="center">
    <br />
    <br />
    <a href="https://github.com/to-do-guru/to-do-guru-api/issues">Report Bug</a>
    ·
    <a href="https://github.com/to-do-guru/to-do-guru-api/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#api contract">API Contract</a></li>
    <li><a href="#schema">Schema</a></li>
    <li><a href="#issues">Issues</a></li>
    <li><a href="#postman">Postman</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contributors">Contributors</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

![welcome](https://github.com/to-do-guru/to-do-guru-api/assets/108768349/f2e27c52-a2a6-4022-b5ef-bd21ad9655c1)


Have you ever felt like your household chores aren't divided evenly? 

Like you're carrying the weight of the entire job on your shoulders? 

Like dividing your housework is a chore by itself?

So did we!
 
So we created To Do Guru, the app that will divide your chores as evenly as possible across all members of your household.

Our goal is to make sure that one person doesn't shoulder the whole burden, and that includes the planning and scheduling.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This section should list any major frameworks/libraries used to bootstrap your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

* [![Ruby on Rails][Rails]][Rails-url]
* [![Ruby Gems][Ruby-gems]][Ruby-gems-url]
* [![GraphQL][graphql-badge]][graphql-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

* Ruby 3.1.1
* Rails 7.0.4.3

### Installation

1. Clone the repo
    ```sh
    git clone git@github.com:to-do-guru/to-do-guru-api.git
    ```
1. Install gems
    ```sh
    bundle install
    ```
1. Set up the database
    ```sh
    rails db:{create,migrate,seed}
    ```
1. Run the RSpec Tests
    ```sh
    bundle exec rspec
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- API CONTRACT -->
## API Contract

[To Do Guru API Contract](https://gist.github.com/hamouj/c70f384ddce446cca675367dbbc5a6d2)

<!-- add a try it now section with the FE SITE? -->

<!-- SCHEMA -->
## Schema

![to-do-guru-db (4)](https://github.com/to-do-guru/to-do-guru-api/assets/108768349/6cbe73fb-850e-4d45-87e8-fc3217a9fe11)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- REQUESTSS -->
## Requests
### getHousehold Query

Receives the request for a specified household and returns the household information.


<details>
  <summary>Request, GraphQL Variable, and Response</summary>

**Request**
```
query getHousehold($email: String!) {
    household (email: $email) {
        id
        name
        members {
            id
            name
        }
        sunday {
            choreName
            assignedMember
            duration
        }
        monday {
            choreName
            assignedMember
            duration
        }
        tuesday {
            choreName
            assignedMember
            duration
        }
        wednesday {
            choreName
            assignedMember
            duration
        }
        thursday {
            choreName
            assignedMember
            duration
        }
        friday {
            choreName
            assignedMember
            duration
        }
        saturday {
            choreName
            assignedMember
            duration
        }
        errors
    }
}
```

**GraphQL Variable**
```
{
    "email": "smith@example.com"
}
```

**Response**
```
{
    "data": {
        "household": {
            "id": "1",
            "name": "The Smith's House",
            "members": [
                {
                    "id": "1",
                    "name": "Will"
                },
                {
                    "id": "2",
                    "name": "Liz"
                },
                {
                    "id": "3",
                    "name": "Alec"
                }
            ],
            "sunday": null,
            "monday": [
                {
                    "choreName": "Clean Bathroom",
                    "assignedMember": "Will",
                    "duration": 45
                }
            ],
            "tuesday": [
                {
                    "choreName": "Mow",
                    "assignedMember": "Alec",
                    "duration": 30
                }
            ],
            "wednesday": [
                {
                    "choreName": "Clean Dishes",
                    "assignedMember": "Liz",
                    "duration": 15
                },
                {
                    "choreName": "Laundry",
                    "assignedMember": "Will",
                    "duration": 60
                },
                {
                    "choreName": "Vacuum",
                    "assignedMember": "Liz",
                    "duration": 45
                }
            ],
            "thursday": [
                {
                    "choreName": "Clean Dishes",
                    "assignedMember": "Alec",
                    "duration": 15
                }
            ],
            "friday": [
                {
                    "choreName": "Clean Dishes",
                    "assignedMember": "Alec",
                    "duration": 15
                },
                {
                    "choreName": "Sweep",
                    "assignedMember": "Liz",
                    "duration": 60
                }
            ],
            "saturday": [
                {
                    "choreName": "Vacuum",
                    "assignedMember": "Alec",
                    "duration": 45
                }
            ],
            "errors": []
        }
    }
}
```

</details>

---

### updateHousehold Mutation

Updates the information about a household


<details>
  <summary>Request and Response </summary>

**Request**

```
mutation {
  updateHousehold(input: {
      id: 1
    })
  {
    household {
      id
      name
      email
      }
     errors
   }
}
 ```
 
 **Response**
   
 ```
 {
    "data": {
        "updateHousehold": {
            "household": {
                "id": "1",
                "name": "The Smith's House",
                "email": "smith@example.com"
            },
            "errors": []
        }
    }
}
```

</details>

---

### createMember Mutation

Adds a member to a household

<details>
  <summary>Request and Response </summary>

**Request**
  
```
mutation {
  createMember(input: {
    name: "Coolio"
    householdId: "1"
    }) 
    {
      member {
        id
        name
        }
      errors
    }
}
```

**Response**
  
```
{
    "data": {
        "createMember": {
            "member": {
                "id": "14",
                "name": "Coolio"
            },
            "errors": []
        }
    }
}
```

</details>

---

### memberDelete Mutation

Deletes a member of the household


<details>
  <summary>Request and Response</summary>

**Request**
  
```
mutation {
    memberDelete(input: {
      id: 1 
      }) 
      {
      member {
        name
        }
      errors
     }
}
```

**Response**

```
{
    "data": {
        "memberDelete": {
            "member": {
                "name": "Will"
            },
            "errors": []
        }
    }
}
```

</details>

---

### createChore Mutation

Creates a chore


<details>
  <summary>Request and Response </summary>

**Request**

```
mutation {
  createChore(input: {
    householdId: 2
    name: "Wash them clothes"
    duration: 30
    day: ["Thursday", "Tuesday"]
    })
    {
    chores {
      choreName
      }
    errors
   }
}
```

**Response**
  
```
{
    "data": {
        "createChore": {
            "chores": [
                {
                    "choreName": "Wash them clothes"
                },
                {
                    "choreName": "Wash them clothes"
                }
            ],
            "errors": []
        }
    }
}
```

</details>

---

### randomizeChores Mutation

Randomly assigns chores to members

<details>
  <summary>Request and Response </summary>

**Request**
  
```
mutation{
    randomizeChores(input:{
        id: 3
    })
    {
        household{
            id
        }
        errors
    }
}
```

**Response**
  
```
{
    "data": {
        "randomizeChores": {
            "household": {
                "id": "3"
            },
            "errors": []
        }
    }
}
```

</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- POSTMAN -->
## Postman Queries

Postman testing is available here, use this button to fork the test repository.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/26085409-87fef94c-9c3d-48c6-869a-c4dc39aa5b54?action=collection%2Ffork&collection-url=entityId%3D26085409-87fef94c-9c3d-48c6-869a-c4dc39aa5b54%26entityType%3Dcollection%26workspaceId%3D896601f2-ed15-4dac-8b08-484cb6392127)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ISSUES -->
## Issues

See the [open issues](https://github.com/to-do-guru/to-do-guru-api/issues) for a full list of proposed features and known issues).


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTORS -->

## Contributors

| <img alt="Adam Bailey" width="75" src="https://avatars.githubusercontent.com/u/116456652?v=4"/> | <img alt="Jasmine Hamou" width="75" src="https://avatars.githubusercontent.com/u/114951691?v=4"/> | <img alt="Brian Hayes" width="75" src="https://avatars.githubusercontent.com/u/71752551?v=4"/> | <img alt="Meredith Trevino" width="75" src="https://avatars.githubusercontent.com/u/112577589?v=4"/> | <img alt="Max MacGillivray" width="75" src="https://avatars.githubusercontent.com/u/108768349?v=4"/> | <img alt="Khoa Nguyen" width="75" src="https://media.licdn.com/dms/image/C4E03AQHMrMCsQolblQ/profile-displayphoto-shrink_800_800/0/1620508068267?e=1690416000&v=beta&t=Ej9xKJpBKJ214TQX88tBrHvU7Ew8aciWZRvT8KMWhZA"/> |
| ------------------ | ------------ | -------------- | ----------- | -------------- | ----------- |
| Adam Bailey | Jasmine Hamou | Brian Hayes | Meredith Trevino | Max MacGillivray | Khoa Nguyen |
| Collaborator | Collaborator | Collaborator | Collaborator | Collaborator | Project Manager |
| [![GitHub][github-shield]][github-adam] | [![GitHub][github-shield]][github-jasmine] | [![GitHub][github-shield]][github-brian] | [![GitHub][github-shield]][github-meredith] | [![GitHub][github-shield]][github-max] | [![GitHub][github-shield]][github-khoa] |
| [![LinkedIn][linkedin-shield]][linkedin-adam] |  [![LinkedIn][linkedin-shield]][linkedin-jasmine] | [![LinkedIn][linkedin-shield]][linkedin-brian] | [![LinkedIn][linkedin-shield]][linkedin-meredith] | [![LinkedIn][linkedin-shield]][linkedin-max] | [![LinkedIn][linkedin-shield]][linkedin-khoa] |


Project Links: <br> 
[Organization Link](https://github.com/to-do-guru) <br>
[Backend Link](https://github.com/to-do-guru/to-do-guru-api) <br>
[Frontend Link](https://github.com/to-do-guru/to-do-guru-ui)<br>

[Project Website](https://to-do-guru-ui.vercel.app/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

These are some of the resources we used for the project and the README.

#### ReadMe Resources
* [README Template](https://github.com/othneildrew/Best-README-Template)

* [Img Shields](https://shields.io)

* [GitHub Badges](https://home.aveek.io/GitHub-Profile-Badges/)

* [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/to-do-guru/to-do-guru-api.svg?style=for-the-badge
[contributors-url]: https://github.com/to-do-guru/to-do-guru-api/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/to-do-guru/to-do-guru-api.svg?style=for-the-badge
[forks-url]: https://github.com/to-do-guru/to-do-guru-api/forks

[stars-shield]: https://img.shields.io/github/stars/to-do-guru/to-do-guru-api.svg?style=for-the-badge
[stars-url]: https://github.com/to-do-guru/to-do-guru-api/stargazers

[issues-shield]: https://img.shields.io/github/issues/to-do-guru/to-do-guru-api.svg?style=for-the-badge
[issues-url]: https://github.com/to-do-guru/to-do-guru-api/issues

[license-shield]: https://img.shields.io/github/license/to-do-guru/to-do-guru-api.svg?style=for-the-badge
[license-url]: https://github.com/to-do-guru/to-do-guru-api/blob/master/LICENSE.txt

[logo-green-big]: /readme/images/logo-green.png
[logo-green-small]: /readme/images/tdg-green.png

[logo-pink-big]: /readme/images/logo-pink.png
[logo-pink-small]: /readme/images/tdg-pink.png


[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-adam]: https://www.linkedin.com/in/brewerdeveloper/
[linkedin-brian]: https://www.linkedin.com/in/brian-hayes-363812204/
[linkedin-jasmine]: https://www.linkedin.com/in/jasmine-hamou/
[linkedin-meredith]: https://www.linkedin.com/in/meredith-trevino/
[linkedin-max]: https://www.linkedin.com/in/max-macgillivray/
[linkedin-khoa]: https://www.linkedin.com/in/khoa-nguyen-1770918b/

[product-screenshot]: images/screenshot.png

[github-shield]: https://img.shields.io/badge/GitHub-181717.svg?style=for-the-badge&logo=GitHub&logoColor=white
[github-adam]: https://github.com/aj-bailey
[github-brian]: href="https://github.com/bphayes
[github-jasmine]: https://github.com/hamouj
[github-meredith]: https://github.com/MAtrevino
[github-max]: https://github.com/MoxieMax
[github-khoa]: https://github.com/omegaeye-he

[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 

[Ruby-gems]: https://img.shields.io/badge/RubyGems-E9573F.svg?style=for-the-badge&logo=RubyGems&logoColor=white
[Ruby-gems-url]: https://rubygems.org/

[graphql-badge]: https://img.shields.io/badge/GraphQL-E10098.svg?style=for-the-badge&logo=GraphQL&logoColor=white
[graphql-url]: https://graphql.org/
