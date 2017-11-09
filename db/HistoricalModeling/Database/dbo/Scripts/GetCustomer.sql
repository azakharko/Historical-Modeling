SELECT
  c.*
 ,cn.*
FROM dbo.Customer c
LEFT JOIN dbo.CustomerName cn
  ON c.CustomerId = cn.CustomerId
LEFT JOIN dbo.CustomerNamePredecessor cnp
  ON cnp.CustomerNameId = cn.CustomerNameId
WHERE cnp.CustomerNameId IN (SELECT
    CustomerNamePredecessor.CustomerNameId
  FROM dbo.CustomerName
  JOIN dbo.CustomerNamePredecessor
    ON dbo.CustomerName.CustomerNameId = dbo.CustomerNamePredecessor.CustomerNameId
  WHERE dbo.CustomerNamePredecessor.PriorCustomerNameId = 1
  AND dbo.CustomerName.CustomerId = 1)

  GO

SELECT
TOP 1
  *
FROM dbo.Customer c
LEFT JOIN dbo.CustomerName cn
  ON c.CustomerId = cn.CustomerId
LEFT JOIN dbo.CustomerNamePredecessor cnp
  ON cnp.CustomerNameId = cn.CustomerNameId

WHERE cnp.DateModified < '2017-11-06 01:01:00.0000000'