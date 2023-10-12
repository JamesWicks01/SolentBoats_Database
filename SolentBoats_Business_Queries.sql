--Query One – The service record of a boat so they know 
-- what work has been done on the baot in the past
SELECT
    booked_service.service_date AS Service_Date, 
    completed_service.service_type AS Service_Type,
    completed_service.service_details AS Service_Details
FROM booked_service
JOIN completed_service ON booked_service.service_id = completed_service.service_id
WHERE service_boat = 5;

-- Query One Output
up2122177_cw=# SELECT
    booked_service.service_date AS Service_Date,
    completed_service.service_type AS Service_Type,
    completed_service.service_details AS Service_Details
FROM booked_service
JOIN completed_service ON booked_service.service_id = completed_service.service_id
WHERE service_boat = 20;

 service_date | service_type |      service_details
--------------+--------------+----------------------------
 2021-09-26   | Hull Service | A Full Service of the Boat
(1 row)

--------------------------------------------------------------
--Query Two – The staff who worked on a given service so there they know who 
-- worked on the boat if there was a problem with the service.
SELECT 
    concat(staff.staff_fname, ' ', staff.staff_lname) AS staff_involved
FROM completed_service
JOIN service_staff ON completed_service.completed_service_id = service_staff.completed_service_id
JOIN staff ON service_staff.staff_id = staff.staff_id
WHERE service_id = 2;

-- Query Two Output
up2122177_cw=# SELECT
    concat(staff.staff_fname, ' ', staff.staff_lname) AS staff_involved
FROM completed_service
JOIN service_staff ON completed_service.completed_service_id = service_staff.completed_service_id
JOIN staff ON service_staff.staff_id = staff.staff_id
WHERE service_id = 2;
 staff_involved
-----------------
 Brandy Lazarus
 Ara Clutheram
 Patricia Jerzyk
(3 rows)

-----------------------------------------------------------
--Query Three – How many staff with a certain role in the business to see what roles they need to hire for.
SELECT 
    COUNT(*) AS total_staff_in_role
FROM role
JOIN staff_role on role.role_id = staff_role.role_id
WHERE role_name = 'General';

-- Query Three Output
up2122177_cw=# SELECT
up2122177_cw-#     COUNT(*) AS total_staff_in_role
up2122177_cw-# FROM role
up2122177_cw-# JOIN staff_role on role.role_id = staff_role.role_id
up2122177_cw-# WHERE role_name = 'General';
 total_staff_in_role
---------------------
                   5
(1 row)

---------------------------------------------------------------------
-- Query Four – The boat’s owners name and contact information for a given boat to so when the service is completed they can phone 
-- the owner to say it can be picked up and an invoice can be sent through email.
SELECT 
    concat(customer.cust_fname, ' ', customer.cust_lname) AS Owner,
    customer.email AS Email,
    customer.phone AS Phone
FROM boat
JOIN customer on boat.owner = customer.CUST_ID
WHERE boat.boat_id = 1;

-- Query Four Output
up2122177_cw=# SELECT
up2122177_cw-#     concat(customer.cust_fname, ' ', customer.cust_lname) AS Owner,
up2122177_cw-#     customer.email AS Email,
up2122177_cw-#     customer.phone AS Phone
up2122177_cw-# FROM boat
up2122177_cw-# JOIN customer on boat.owner = customer.CUST_ID
up2122177_cw-# WHERE boat.boat_id = 1;
      owner       |        email        |   phone
------------------+---------------------+------------
 Corly Santarelli | csantarelli0@360.cn | 3301338520
(1 row)

----------------------------------------------------------------
--Query Five – The services to that are booked in the today to see what services are going on today.
SELECT
    boat.boat_name AS Boat_Name,
    boat.boat_model AS Boat_Model,
    booked_service.service_date AS Date_Of_Service
FROM booked_service
JOIN boat on booked_service.service_boat = boat.boat_id 
WHERE service_date = current_date;

-- Query Five Output
up2122177_cw=# SELECT
up2122177_cw-#     boat.boat_name AS Boat_Name,
up2122177_cw-#     boat.boat_model AS Boat_Model,
up2122177_cw-#     booked_service.service_date AS Date_Of_Service
up2122177_cw-# FROM booked_service
up2122177_cw-# JOIN boat on booked_service.service_boat = boat.boat_id
up2122177_cw-# WHERE service_date = current_date;
 boat_name | boat_model | date_of_service
-----------+------------+-----------------
(0 rows)

