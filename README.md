#Customer 360

## Project
Customer 360 - UI application that uses couchbase sync service to provide product recommendation.

## Technology Stack
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL

## Folder Structure
```bash
PROJECT_FOLDER
│  README.md
│  pom.xml           
└──[src]      
│  └──[main]      
│     └──[java]      
│     └──[resources]
│        │  application.properties #contains spring cofigurations
│        │  db.sql        # Contains DB Script to create tables and data for user authentication    
│              
└──[target]     #Java build files, auto-created after running java build: mvn install
  └──[classes]

```

## Prerequisites
Ensure you have this installed before proceeding further.
- Java 8
- Maven 3 or later
- MySQL 5.6 or later


## Run
```mvn jetty:run```
