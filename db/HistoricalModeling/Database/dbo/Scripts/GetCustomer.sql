-- this is wrong way to find current customer
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
-- this is how it should be
select 
	c.* ,
	cn.*
from dbo.Customer c
left join dbo.CustomerName cn 
	on c.CustomerId = cn.CustomerId
left join dbo.CustomerNamePredecessor cnp 
	on cnp.CustomerNameId = cn.CustomerNameId
where cnp.CustomerNameId not in (
	select 
		CustomerNamePredecessor.PriorCustomerNameId
	from dbo.CustomerNamePredecessor 
)

SELECT
TOP 1
  *
FROM dbo.Customer c
LEFT JOIN dbo.CustomerName cn
  ON c.CustomerId = cn.CustomerId
LEFT JOIN dbo.CustomerNamePredecessor cnp
  ON cnp.CustomerNameId = cn.CustomerNameId

WHERE cnp.DateModified < '2017-11-06 01:01:00.0000000'