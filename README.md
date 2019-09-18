# HACKATHON SYSTEM

>Authors: Henrique K. - João C. - João S.

>Chosen architectural pattern: MVC

## Funcional requirements

* Inscriptions
  * Subscribe
  * Unsubscribe

* Teams
  * Team suggestion
  * Team validation
  * Team creation
  * Team exclusion
  * Include member
  * Exclude member

* Generate evaluation form
  * Working software [ 0 - 5 ]
  * Process [ 0 - 5 ]
  * Pitch [ 0 - 5 ]
  * Inovation [ 0 - 5 ]
  * Team formation [ 0 - 5 ]
  
## Non-functional requirements

**Maintainability**

- modularity
  
- reusability
  
- analyzability
  
- changeability
  
- modificability
  
- testability

## Technologies

* Ruby on Rails (Server-side)
* Material-UI (Client-side)
* PostgreSQL (Database)
* Heroku (PAAS)

## Database structure

| Entity | Fields | Actions |
| ---------- | ---------- | ---------- |
| Student | name <br> **pk_unique_key** <br> **fk_team_subscribed** <br> **fk_team_suggested** <br> **fk_college_course** | Subscribe <br> Unsubscribe |
| Team | name <br> **pk_unique_key** | Create <br> Exclude <br> Subscribe student <br> Unsubscribe student | 
| Appraiser | name <br> **pk_unique_key** | Subscribe <br> Unsubscribe |
| Evaluation | working_software <br> process <br> pitch <br> innovation <br> team_formation <br> **pk_unique_key** <br> **fk_team** <br> **fk_appraiser** | None |
| College_course | Name <br> **pk_unique_key** | Subscribe <br> Unsubscribe |
