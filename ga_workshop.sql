-- This is a comment on one line
/* Comment more than one line*/

----------------------------------------------------------------
--     INSTRUCTOR GUIDED:   BASIC SQL SYNTAX - 15 Min.        --
----------------------------------------------------------------

				--SELECT <-- FOCUS AREA
				--FROM  <-- FOCUS AREA
				--WHERE
				--GROUP BY
				--ORDER BY <-- FOCUS AREA
				--LIMIT <-- FOCUS AREA

-- I want to see ALL records in the ALBUMS table.

SELECT
*
FROM albums

-- I want to see a SAMPLE of 10 ALBUMS and ARTISTS in the ALBUMS table.
SELECT
artist, album
FROM albums LIMIT 10

-- I want to see a list of ARTISTs in the ALBUMS table.
SELECT artist
FROM albums

-- I want to see a DISTINCT list of ARTISTS in the ALBUMS table.
SELECT COUNT (DISTINCT artist)
FROM albums

-- I want to see a list of ALBUMs in the ALBUMS table, sorted from A-Z.
SELECT album
FROM albums
ORDER BY album ASC

-- I want to see a list of ALBUMS their GENRE, sorted by highest to lowest price.
SELECT album, genre, org_price
FROM albums
ORDER BY org_price DESC


-- I want a list of ALBUMS and the profit realized from selling each ALBUM.
SELECT
album, (CAST(market_value AS MONEY)- org_price) AS profit
FROM albums

-- I want to order the list of ALBUMS by lowest profit album to highest profit ALBUM.
SELECT album, (CAST(market_value AS MONEY)- org_price) AS profit
FROM albums
ORDER BY profit ASC


----------------------------------------------------------------
--           WORKSHOP:    BASIC SQL SYNTAX - 15 Min.          --
----------------------------------------------------------------

				--SELECT <-- FOCUS AREA
				--FROM  <-- FOCUS AREA
				--WHERE
				--GROUP BY
				--ORDER BY <-- FOCUS AREA
				--LIMIT <-- FOCUS AREA


--QUESTIONS

	-- Question 1: Select 300 Rows from the SALES table
SELECT *
FROM sales
LIMIT 300

	-- Question 2: Fix the below code

		SELECT
		item
		, store
		, county
		, total
		FROM sales
		LIMIT 100

	/*Question 3: Show me a list of Store_#'s, their name, and status.
	Order them by name from 'A-Z'. *Hint - use the STORES table */
		SELECT
		store,
		name,
		store_status
		FROM stores
		ORDER BY name ASC


	/*Question 4: Show me a list of items, their product category
	and bottle price with a 11% tax rate added on.
	*Hint - use the PRODUCTS table*/
	SELECT
	item_no
	,item_description
	,bottle_price
	,category_name
	,bottle_price * 1.11 AS Bottle_Price_W/TAX
	FROM
	products

	/*Question 5: Find the highest profit item.
	*Hint - (Shelf Price - Bottle Price) = Profit*. Use PRODUCTS table*/
	SELECT
	item_description
	,bottle_price
	,category_name
	,Shelf_Price
	,(cast(Shelf_Price AS Money) - Bottle_Price)AS Profit

----------------------------------------------------------------
--       INSTRUCTOR GUIDED:   FILTERS  - 30 Min.              --
----------------------------------------------------------------

				--SELECT
				--FROM
				--WHERE <-- FOCUS AREA
				--GROUP BY
				--ORDER BY
				--LIMIT

-- 1 Condition, 1 Column: Text Example: I want to see a list of Rock Albums.

SELECT
ALBUM, genre
FROM ALBUMS
WHERE genre = 'Rock'


-- 1 Condition, 1 Column: Integer Example: I want to see a list of Albums with over 1000 plays.

SELECT
ALBUM, plays
FROM ALBUMS
WHERE plays > 1000

-- 1 Condition, 1 Column: Date Example: I want to see a list of Albums released in 2011.

SELECT
ALBUM, release_date, TO_CHAR(release_date, 'MM') AS release_month
FROM ALBUMS
WHERE release_date BETWEEN '2011-01-01' AND '2011-12-31'
-- WHERE TO_CHAR(release_date, 'YYYY') = '2011'. No Alias in WHERE clause.

-- Multiple Conditions, 1 Column Example: I want to see a list of Rock and Rap ALBUMs.

SELECT
ALBUM, genre, rating
FROM ALBUMS
--WHERE genre = 'Rock' OR genre = 'Rap'
WHERE genre IN ('Rock', 'Rap') AND rating >= 2
ORDER BY genre, rating -- can order by more than one column

-- Multiple Conditions, Multiple Columns Example: I want to see a list of Rock and Rap Albums with at least a 4 rating.

SELECT
ALBUM
FROM ALBUMS
WHERE

-- NULL Conditions: I want to see a list of Albums with no ARTIST name.

SELECT
ALBUM, artist
FROM ALBUMS
WHERE artist IS NULL

-- OR Conditions: I want to see a list of Rock Albums with a rating of at least 4 or the album was burned.

SELECT
ALBUM, genre,rating, burned
FROM ALBUMS
--WHERE genre = 'Rock' AND  rating >= 4 OR burned = TRUE -- two lists stacked on top of each other
WHERE genre = 'Rock' AND (rating >=4 OR burned = TRUE) -- All Rock or the other condition.
-- this is called contained OR.

-- Pattern Matching: I want see a list of ALBUMS that have a "the" in their name
-- lowercase, middle of the title
-- don't include Thesis
-- blank the () lowercase at the end
-- ILIKE is case insensitive.
-- LIKE is case sensitive.

SELECT
ALBUM
FROM ALBUMS
--WHERE album ILIKE '%' -- will print out EVERYTHING/ any charachter % is a wildcard. Means anything.
--WHERE album ILIKE 'f%' -- starts with f/F.
WHERE album ILIKE 'the %' -- beginning of the album
OR album ILIKE '% the%' -- middle of the album name
OR album ILIKE '% the' -- end of the album name



----------------------------------------------------------------
--               WORKSHOP:   FILTERS  - 30 Min.               --
----------------------------------------------------------------

				--SELECT
				--FROM
				--WHERE <-- FOCUS AREA
				--GROUP BY
				--ORDER BY
				--LIMIT



-- QUESTIONS

	-- Question 1: Give me a list of all products that vendor 305 has.

		SELECT
		*
		FROM PRODUCTS

	-- Question 2: Give me a distinct list of vendors that sell Flavored Rum.

		SELECT
		DISTINCT VENDOR
		FROM PRODUCTS
		WHERE

	-- Question 3: Give me a distinct list of items and their respective list date, that were listed in Feburary 2015.

		SELECT
		item_no
		,list_date
		FROM PRODUCTS
		WHERE


	-- Question 4: Give me a list of Peach Brandies that are in a 1000 ml bottle size or are over 70 proof. Remember, CONTAINED OR.

		SELECT
		*
		FROM PRODUCTS
		WHERE

	-- Question 5: Which items are Tequilas or Scotch Whiskies that have a case cost between $100 and $120?

		SELECT
		*
		FROM PRODUCTS
		WHERE

	-- Question 6: Which items don't have a product category and their list date is not 2007, 2008, or 2009?

		SELECT
		*
		FROM PRODUCTS
		WHERE

	-- Question 7: Give me a list of drinks that have the color blue in the item description.

		SELECT
		*
		FROM PRODUCTS
		WHERE

	-- Question 8: Give me a DISTINCT list of items that are either 100 proof Flavored Vodka in a 12 pack OR Tequila with a case cost under $150 dollars.

		SELECT
		*
		FROM PRODUCTS
		WHERE

	-- Question 9: Iowa Frat Bro says, "Give me a list of items that are mint flavored. These drinks should be over 90 proof and have a case cost under $100, brah".

		SELECT
		*
		FROM PRODUCTS
		WHERE


----------------------------------------------------------------
--        INSTRUCTOR GUIDED:   AGGREGATES - 15 Min.           --
----------------------------------------------------------------

-- What is the SUM of the Total Plays in the ALBUMS table?

SELECT
SUM(plays) AS Total_Plays
FROM ALBUMS

-- What is the COUNT of Artists in the ALBUMS Table?

SELECT
COUNT(artist) AS Total_Artist
FROM ALBUMS

-- What is the DISTINCT COUNT of Artists in the Table?

SELECT
 COUNT(DISTINCT artist) AS Total_Artists
FROM ALBUMS

-- Write AN SQL Statement that counts the number of rocks by SIZE and STRIPE

SELECT
rock_size,
is_striped,
COUNT(rock_id) AS COUNT_OF_ROCKS
FROM ROCKS_IN_THE_BOX
GROUP BY
rock_size
, is_striped

-- GROUP Practice: Write a SQL statement that counts the number artists and sums total plays by release year.
-- total artists
-- total plays
-- release year
SELECT
COUNT(distinct artist) AS total_artists,
SUM(plays) AS total_plays,
TO_CHAR (release_date, 'YYYY') AS release_year
FROM albums
WHERE release_date BETWEEN '2008-01-01' AND '2012-12-31'
GROUP BY TO_CHAR (release_date, 'YYYY')

----------------------------------------------------------------
--         WORKSHOP:   AGGREGATES w/ GROUP BY - 10 Min.       --
----------------------------------------------------------------

				--SELECT
				--FROM
				--WHERE
				--GROUP BY <-- FOCUS AREA
				--ORDER BY
				--LIMIT

	-- Question 1: Give me Total Sales for Tequila products grouped by Year *Hint, use the Sales table. Also, TOTAL is the sales column*


	-- Question 2: Give me the Total Sales for 'Jim Beam Brands' Vendor by Category Name and Month for 2015 *HINT, use TO_CHAR() for Month grouping*


----------------------------------------------------------------
-- WORKSHOP:   Putting It All Together: Fix the Code - 30 min. -
----------------------------------------------------------------

                --SELECT <-- FOCUS AREA
				--FROM <-- FOCUS AREA
				--WHERE <-- FOCUS AREA
				--GROUP BY <-- FOCUS AREA
				--ORDER BY <-- FOCUS AREA
				--LIMIT <-- FOCUS AREA



/* Hey Analyst,

	Bill is asking for a data pull to understand the following KPIs for Seagram's Branded Whiskey in 2014:

	* Total Revenue
	* Total Profit
	* Total Profit Margin
	* Total Volume in Lieters sold

	He'd also like the above data grouped by county, sorted from highest revenue to lowest revenue county.

	Larry, the last analyst, left this code that pulled something similar. I'm not sure if it still works
	but it would be a great jumping off point. FYI, I'll be in Suncadia with my family so if you are lost
	maybe you could sync up with Valeri if you can't wrap your head around it. That'd be great. Thanks. */

	--CODE

	SELECT

	 sum(total) as TOTAL_REVENUE
	,(state_btl_cost * bottle_qty) as TOTAL_COST
	,sum(liter_size) as "LITER VOLUME"
	,cty as County

	FROM SALES

	WHERE

	description IN (Seagrams%Whiskey)

	date = 1/1/2014

	GROUP BY

	 sum(total) as TOTAL_REVENUE
	,(state_btl_cost * bottle_qty) as TOTAL_COST
	,sum(liter_size) as "LITER VOLUME"
	,cty as County

	ORDER BY COUNTY, TOTAL DESC

----------------------------------------------------------------
--            INSTRUCTOR GUIDED: Joining Tables               --
----------------------------------------------------------------

/* I want to see Total Order Value and Total Orders by Location	*/

--Write a query that JOINs the ORDERS to the CUSTOMERS table.
	SELECT * FROM orders
	SELECT * FROM customers

	SELECT
 COUNT(A.ORDER_ID) AS TOTAL_ORDERS --AGG -- Orders
,SUM(A.ORDER_VALUE) AS TOTAL_ORDER_VALUE --AGG -- Orders
,B.LOCATION AS LOCATION --DIM - Customers
,A.cust_id AS CUSTOMER_A -- DIM
,B.CUSTOMER_ID AS CUSTOMER_B -- DIM
FROM ORDERS AS A --Primary (Left hand side table)
LEFT JOIN CUSTOMERS AS B --INDICATE JOIN STYLE, Secondary Table goes here....
ON CAST(A.CUST_ID AS TEXT) = B.CUSTOMER_ID --Column they have in common
GROUP BY
LOCATION
,CUSTOMER_A
,CUSTOMER_B

----------------------------------------------------------------
--            WORKSHOP: Joining Tables                        --
----------------------------------------------------------------

/* Question 1: Give me the total sales (use total column in sales table) for the top 10 selling stores by name*/

/* Question 2: Give me total sales for Tequila Products grouped by proof amount. */

/* Question 3: Give me a list of the top 10 vendors with the highest number of UNSOLD coffee products. (Use item_description to find coffee products) */

----------------------------------------------------------------
--            WORKSHOP: CASE STATEMENTS                       --
----------------------------------------------------------------


/* Question 1: What is the trend of sales by month and bottle_price_band in 2015. Use the below criteria to define bottle_price_band with a CASE statement:

	BTL_PRICE < 10.00 - CHEAP
	BTL_PRICE 10 and 29 - MODERATE
	BTL_PRICE 30 and 59 - HIGH
	BTL_PRICE OVER 60 -  EXPENSIVE*/


/* Question 2: Same as above, except use SUM(CASE WHEN ....) to create 4 separate columns to calculate sales for each bottle_price_band.



----------------------------------------------------------------
--            WORKSHOP: TEMPORARY TABLES                      --
----------------------------------------------------------------

/* Question 1: Write an indepedent query for each of the below

	a. A list of counties and their population

	b. Total Sales and Total Store Count by County in 2015

	c. #1 Selling Product in Each County in 2015 *Hint, use the RANK function*

	AFTER WRITING EACH QUERY, JOIN THEM ALL TOGETHER (ABC) USING the WITH keyword...HINT, you will be joining on COUNTY.
