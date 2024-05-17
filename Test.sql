-- Topics
SELECT 
    Name_Topics AS "Название темы",
    Type_Format_Topics AS "Формат темы"
FROM 
    Topics
INNER JOIN 
    Format_Topics
    ON 
    Format_Topics_ID = ID_Format_Topics
ORDER BY 
    Topics ASC;