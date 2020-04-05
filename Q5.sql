/*Create Table to store 15 locations by 3 categories namely library, school, cafe*/

CREATE TABLE HW3_MAP( Placemarks VARCHAR(20),Category VARCHAR(20), Location geometry);

/* Insert values into table */

Insert into HW3_MAP VALUES ('Leavey','library','POINT(-118.282796 34.021748)');
Insert into HW3_MAP  VALUES ('Doheny','library','POINT(-118.283743 34.020065)');
Insert into HW3_MAP  VALUES ('VKC','library','POINT(-118.283998 34.021303)');
Insert into HW3_MAP VALUES ('SE','library','POINT(-118.288795 34.019634)');
Insert into HW3_MAP  VALUES ('Wilson','library','POINT(-118.286215 34.023983)');
Insert into HW3_MAP  VALUES ('Viterbi','school','POINT(-118.289330 34.020597)');
Insert into HW3_MAP  VALUES ('Rossier','school','POINT(-118.283891 34.021975)');
Insert into HW3_MAP VALUES ('Gould','school','POINT(-118.284258 34.018707)');
Insert into HW3_MAP VALUES ('Sol','school','POINT(-118.283585 34.019438)');
Insert into HW3_MAP VALUES ('Marshall','school','POINT(-118.285735 34.018877)');
Insert into HW3_MAP VALUES ('Galen','cafe','POINT(-118.287093 34.022909)');
Insert into HW3_MAP VALUES ('RTH','cafe','POINT(-118.289995 34.020058)');
Insert into HW3_MAP VALUES ('Law','cafe','POINT(-118.284395 34.018715)');
Insert into HW3_MAP  VALUES ('Literatea','cafe','POINT(-118.283303 34.020192)');
Insert into HW3_MAP VALUES ('Starbucks','cafe','POINT(-118.282183 34.021684)');

/*Alter table to add placemark_id*/

ALTER TABLE HW3_MAP ADD COLUMN Placemark_ID SERIAL PRIMARY KEY;

/*Compute the convex hull*/

Select ST_AsText(ST_ConvexHull(ST_Collect(location))) from HW3_MAP;

/*Compute the four nearest neighbors*/

SELECT PLACEMARK_ID, PLACEMARKS FROM HW3_MAP WHERE PLACEMARK_ID<>3
ORDER BY LOCATION <#> ST_SETSRID(ST_MAKEPOINT(-118.283998,34.021303),4326)LIMIT 4;

/* The four nearest neighbors of the chosen placemark:VKC are returned */
