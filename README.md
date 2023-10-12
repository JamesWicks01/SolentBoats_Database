# SolentBoats_Database
Coursework for Year 1 in Database Systems Development for BSc (Hons) Software Engineering Degree

# Brief
You have been asked to create a database for a boat repair and servicing company, Solent Boats. They currently
store all of their data in a series of spreadsheets. The contents of these are linked to provide an overview of the company. They have recently lost two of these spreadsheets following a hard drive failure and now their entire system-
tem no longer works. You need to design and build a database, using PostgreSQL, to fulfil the client’s requirements.
These are shown in the requirements section below.

# Background
Solent Boats, (SB), is a small but successful marine servicing company that is growing year on year. They currently
have 4 boatyards with between 3 and 7 members of staff at each one. (There are plans for further yards if there
is enough demand in other areas). There is one member of staff at each site that acts as a manager. The role of
manager may be the only role they have or they may have more than that one role. This is due to the number of
staff working in each yard. The larger yards have enough work for the role of manager to be the only role held but
in smaller yards, the role is held alongside another role. For example, engine technician and manager. Your data
should allow this situation.
The roles that you need to create are listed below:

**ROLE**
* MANAGER
* GLASS FIBRE SPECIALIST
* ENGINE TECHNICIAN
* GENERAL
* ELECTRICIAN
* TECHNICIAN

As stated elsewhere, some boatyards have less staff and some have more. It could be that one
yard has a person who has two or more of these roles. Remember that every yard has a manager. This is not
always the only role they have.
Currently, they store details of customers and their boats, along with service details, both historic and services
booked in the future. They stored who worked on a service, this may be one or more staff members. SB does not
need you to store details on parts in stock or parts that are used in a service. They have a separate system that
just needs to store the service ID number against the parts used. SB have decided that they are going to start again
with data collection and storage so you do not need to think about the data structure that exists in the CSV. They
have given the minimum requirements that are needed for their business to run properly.

# Requirements
SB need a database that will store, as a minimum, the following data.
* Staff (Personal and work details such as work email addresses and roles)
* Customers (Personal details such as home address and contact details)
* Boat details (Such as name and when built. We do not need information such as size but we do need fuel type.)
* Servicing completed and pre-booked
* Staff involved in each service

# Database ERD
![image](https://github.com/JamesWicks01/SolentBoats_Database/assets/115103781/f8d0ea0d-4076-4cc3-a212-2dfb58b44b5c)


