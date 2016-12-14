USE SYS;
 
DROP TABLE IF EXISTS nyc_1;
Drop Table If Exists nyc_full;
Drop Table If Exists nyc_s1;
Drop Table If Exists nyc_s12;
Drop Table If Exists nyc_s2;
Drop Table If Exists trulia;
Drop Table If Exists zip_pop;
 
 
CREATE TABLE nyc_1
(
  `RPT_DT` varchar(100) NOT NULL,
  `OFNS_DESC` varchar(100) NOT NULL,
  `LAW_CAT_CD` varchar(100) NOT NULL,
  `BORO_NM` varchar(100) NOT NULL,
  `ADDR_PCT_CD` varchar(100) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Lat_Lon` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `street_number` varchar(100) NOT NULL,
  `route` varchar(100) NOT NULL,
  `neighborhood` varchar(100) NOT NULL,
  `political` varchar(100) NOT NULL,
  `administrative_area_level_2` varchar(100) NOT NULL,
  `administrative_area_level_1` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `postal_code_suffix` varchar(100) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `premise` varchar(100) NOT NULL,
  `crime_v` varchar(100) NOT NULL
  
);
 
 CREATE TABLE nyc_full
(
  `zip` varchar(100) NOT NULL,
  `Median_sales_price` varchar(100) NOT NULL,
  `Price_sqft` varchar(100) NOT NULL,
  `freq_crime` varchar(100) NOT NULL,
  `freq_violent_crime` varchar(100) NOT NULL,
  `pop` varchar(100) NOT NULL,
  `crime_rate` varchar(100) NOT NULL,
  `v_crime_rate` varchar(100) NOT NULL
);
 
CREATE TABLE nyc_s1
(
  `zip` varchar(100) NOT NULL,
  `freq_crime` varchar(100) NOT NULL
  
);
 
CREATE TABLE nyc_s12
(
  `zip` varchar(100) NOT NULL,
  `freq_crime` varchar(100) NOT NULL,
  `freq_violent_crime` varchar(100) NOT NULL
  
);
 
CREATE TABLE nyc_s2
(
  `zip` varchar(100) NOT NULL,
  `freq_violent_crime` varchar(100) NOT NULL
  
);
 
CREATE TABLE trulia
(
  `X` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `Median_sales_price` varchar(100) NOT NULL,
  `Price_sqft` varchar(100) NOT NULL
  
);
 

CREATE TABLE zip_pop
(
  `zip` varchar(100) NOT NULL,
  `pop` varchar(100) NOT NULL
);
 
