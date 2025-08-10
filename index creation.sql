-- Country per index
CREATE INDEX idx_customer_country 
ON Customers(country);

-- Order date per index
CREATE INDEX idx_order_date 
ON Orders(order_date);

SELECT 
    t.name AS TableName,
    ind.name AS IndexName,
    col.name AS ColumnName
FROM 
    sys.indexes ind
INNER JOIN 
    sys.index_columns ic ON ind.object_id = ic.object_id AND ind.index_id = ic.index_id
INNER JOIN 
    sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
INNER JOIN 
    sys.tables t ON ind.object_id = t.object_id
WHERE 
    t.name IN ('Customers', 'Orders') 
    AND ind.name IS NOT NULL
ORDER BY 
    t.name, ind.name;
