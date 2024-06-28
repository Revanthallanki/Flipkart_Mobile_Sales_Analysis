-- Retrieve all mobiles sold by filpkart
SELECT COUNT(*) FROM dataDB.dbo.Flipkart_Mobile;

-- Retrieve all mobile brands
SELECT COUNT(*) FROM dataDb.dbo.mobile_brands;

-- Retrieve all mobile models and their selling prices:

SELECT Model, "Selling Price"
FROM dataDB.dbo.Flipkart_Mobile;

-- Find the mobile models with the highest rating:

SELECT Model, Rating
FROM dataDB.dbo.Flipkart_Mobile
ORDER BY Rating DESC;

-- Calculate the average selling price of mobiles for each brand:

SELECT Brand, ROUND(AVG("Selling Price"),2) AS AverageSellingPrice
FROM dataDB.dbo.Flipkart_Mobile
GROUP BY Brand;

-- Identify the mobile models with the highest difference between selling price and original price in desc order:

SELECT Model, ("Original Price" - "Selling Price") AS PriceDifference
FROM dataDB.dbo.Flipkart_Mobile
ORDER BY PriceDifference DESC;

-- Find the total number of mobiles available for each color:

SELECT Color, COUNT(*) AS TotalMobiles
FROM dataDB.dbo.Flipkart_Mobile
GROUP BY Color;

-- Find the brands with the most number of mobile models available in desc order:

SELECT Brand, COUNT(*) AS ModelCount
FROM dataDB.dbo.Flipkart_Mobile
GROUP BY Brand
ORDER BY ModelCount DESC;

-- Identify the mobile models with the lowest rating for each brand:

SELECT Brand, Model, MIN(Rating) AS LowestRating
FROM dataDB.dbo.Flipkart_Mobile
GROUP BY Brand, Model
ORDER BY Brand, LowestRating;

-- Find the average rating of mobiles for each brand:

SELECT Brand, ROUND(AVG(Rating),2) AS AverageRating
FROM dataDb.dbo.mobile_brands
GROUP BY Brand;

-- Identify the brandS with the average original price in desc order:

SELECT Brand, AVG("Original Price") AS AverageOriginalPrice
FROM dataDb.dbo.mobile_brands
GROUP BY Brand
ORDER BY AverageOriginalPrice DESC;

-- Retrieve all mobile models with a rating of 4.5 or higher:

SELECT Model, Rating
FROM dataDb.dbo.mobile_brands
WHERE Rating >= 4.5;

-- Calculate the difference between original price and selling price for each model:

SELECT Model, ("Original Price" - "Selling Price") AS PriceDifference
FROM dataDb.dbo.mobile_brands
WHERE "Original Price" - "Selling Price" <> '';

-- Find the common mobile models between both tables:

SELECT a.Model
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model;

-- Compare the average selling price of common models between both tables:

SELECT a.Model, ROUND(AVG(a."Selling Price"),2) AS AvgSellingPrice_Flipkart, ROUND(AVG(b."Selling Price"),2) AS AvgSellingPrice_MobileBrands
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
GROUP BY a.Model;

-- Identify the mobile models that are present in the Flipkart_Mobile table but not in the mobile_brands table:

SELECT a.Model FROM dataDB.dbo.Flipkart_Mobile a
LEFT JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
WHERE b.Model IS NULL;

-- Find the average rating for common mobile models between both tables:

SELECT a.Model, ROUND(AVG(a.Rating),2) AS AvgRating_Flipkart, ROUND(AVG(b.Rating),2) AS AvgRating_MobileBrands
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
GROUP BY a.Model;

-- Compare the average original price of common models between both tables:

SELECT a.Model, ROUND(AVG(a."Original Price"),2) AS AvgOriginalPrice_Flipkart, ROUND(AVG(b."Original Price"),2) AS AvgOriginalPrice_MobileBrands
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
GROUP BY a.Model HAVING AVG(b."Original Price") <> '';


-- Retrieve the mobile models with the highest rating from both tables:

SELECT TOP 10 a.Model, a.Rating AS Flipkart_Rating, b.Rating AS MobileBrands_Rating FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
ORDER BY a.Rating DESC, b.Rating DESC;


-- Find the mobile models with the highest price difference between selling price and original price from both tables:

SELECT TOP 30 a.Model, 
       (a."Original Price" - a."Selling Price") AS PriceDifference_Flipkart,
       (b."Original Price" - b."Selling Price") AS PriceDifference_MobileBrands
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
ORDER BY PriceDifference_Flipkart DESC, PriceDifference_MobileBrands DESC;

-- Identify the common models and calculate the total number of units available in each table:

SELECT a.Model, COUNT(a.Model) AS TotalUnits_Flipkart, COUNT(b.Model) AS TotalUnits_MobileBrands FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
GROUP BY a.Model;

-- Compare the average rating for each color from both tables:

SELECT a.Color, ROUND(AVG(a.Rating),2) AS AvgRating_Flipkart, ROUND(AVG(b.Rating),2) AS AvgRating_MobileBrands
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Color = b.Color
GROUP BY a.Color;

-- Find the mobile models with the lowest selling price in both tables and the corresponding original prices:

SELECT TOP 100 a.Model, a."Selling Price" AS Flipkart_SellingPrice, a."Original Price" AS Flipkart_OriginalPrice,
       b."Selling Price" AS MobileBrands_SellingPrice, b."Original Price" AS MobileBrands_OriginalPrice
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
ORDER BY a."Selling Price" ASC, b."Selling Price" ASC;

-- Find the number of unique mobile models that are common in both tables:

SELECT COUNT(DISTINCT a.Model) AS CommonModels
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model;

-- Retrieve the mobile models with the highest storage capacity from both tables:

SELECT TOP 20 a.Model, a.Storage AS Flipkart_Storage, b.Storage AS MobileBrands_Storage
FROM dataDB.dbo.Flipkart_Mobile a
INNER JOIN dataDb.dbo.mobile_brands b ON a.Model = b.Model
ORDER BY a.Storage DESC, b.Storage DESC;