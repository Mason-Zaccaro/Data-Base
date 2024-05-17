-- Modules
SELECT 
    Name_modules AS "Название модуля",
    Prefix_modules AS "Префикс модуля",
    Num_study_h_modules AS "Учебные часы",
    Theoretical_h_modules AS "Теоретические часы",
    Practical_h_modules AS "Практические часы",
    Alone_h_modules AS "Свободные часы"
FROM 
    Modules;

-- Training_programs
SELECT 
    Name_Training_programs AS "Название программы обучения",
    Prefix_Training_programs AS "Префикс программы обучения",
    Time_training_Training_programs AS "Срок обучения",
    Cost_study_Training_programs AS "Стоимость обучения",
    Name_qualification_Training_programs AS "Название квалификации",
    Pictures_Training_programs AS "Картинка"
FROM 
    Training_programs;

-- Training_status
SELECT 
    ID_Training_Status AS "ID статуса обучения",
    Type_Training_Status AS "Тип статуса обучения"
FROM 
    Training_status;

-- Listeners
SELECT 
    Surname_Listeners||', '||Name_Listeners||', '||Patronymic_Listeners AS "ФИО",
    Passport_series_Listeners||', '||Passport_num_Listeners "Серия, номер паспорта",
    Birthday_Listeners AS "Дата рождения",
    Issued_whom_when_Listeners AS "Кем и когда выдан паспорт",
    Unit_code_Listeners AS "Код подразделения",
    Address_Listeners AS "Адрес",
    'Тел.: '||Phone_Listeners||', Эл. почта: '||Email_Listeners AS "Контактные данные",
    SNILS_Listeners AS "СНИЛС",
    'Логин: '||Login_Listeners||', Пароль: '||Password_Listeners AS "Данные для входа"
FROM 
    Listeners;

-- Training_format
SELECT 
    Type_training_training_format AS "Тип формата обучения"
FROM 
    Training_format;

-- Employees
SELECT 
    Surname_Employees||' '||Name_Employees||' '||Middle_name_Employees AS "ФИО",
    Name_post_Employees AS "Должность",
    'Логин: '||Login_Employees||', Пароль: '||Password_Employees "Данные для входа"
FROM 
    Employees;

-- Format_Topics
SELECT 
    Type_Format_Topics AS "Формат темы"
FROM 
    Format_Topics;

-- Technologies
SELECT
    ID_Technologies AS "ID технологии",
    Name_Technologies AS "Название технологии"
FROM
    Technologies;

-- Выборка данных из таблицы Skills
SELECT
    ID_Skills AS "ID навыка",
    Name_Skills AS "Название навыка"
FROM
    Skills;

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
    Format_Topics_ID ASC;

-- Program_modules
SELECT 
    Name_Training_programs ||' '|| Prefix_Training_programs AS "Название и префикс программы",
    Time_training_Training_programs ||' месяца'  AS "Срок обучения",
    Cost_study_Training_programs ||' руб.' AS "Стоимость обучения",
    Name_qualification_Training_programs AS "Название квалификации",
    Pictures_Training_programs AS "Путь к картинке",
    Name_Modules ||' '|| Prefix_modules AS "Название и префикс модуля",
    'Всего: '|| Num_study_h_modules ||'ч. Теория: '|| Theoretical_h_modules ||'ч. Практика: '|| Practical_h_modules ||'ч. Самостоятельные: '|| Alone_h_modules ||'ч.' AS "Колличество учебных часов"
FROM 
    Program_modules
INNER JOIN 
    Training_programs
    ON Training_programs_ID = ID_Training_programs
INNER JOIN 
    Modules
    ON Modules_ID = ID_Modules
ORDER BY 
    Name_Training_programs ASC,
    Time_training_Training_programs ASC,
    Cost_study_Training_programs ASC,
    Name_qualification_Training_programs ASC,
    Pictures_Training_programs ASC,
    Name_Modules ASC,
    Prefix_modules ASC,
    Num_study_h_modules ASC,
    Theoretical_h_modules ASC,
    Practical_h_modules ASC;

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

SELECT
    (SELECT Surname_Employees FROM Employees WHERE  Employees_id = Distrib.Employees_id) AS employees_name
FROM
    Distrib
JOIN
    Program_modules 
    ON ID_Program_modules = Program_modules_ID;

-- Distrib
SELECT 
    Surname_Employees ||', '|| Name_Employees ||', '|| Middle_name_Employees AS "ФИО",
    Name_post_Employees AS "Должность",
    Name_Training_programs ||' '|| Prefix_Training_programs AS "Название и префикс программы",
    Name_modules ||' '|| Prefix_modules AS "Название и префикс модуля"
FROM 
    Distrib
INNER JOIN 
    Program_Modules
    ON Program_Modules_ID = ID_Program_Modules
INNER JOIN 
    Training_programs
    ON Training_programs_id = ID_Training_programs
INNER JOIN 
    modules
    ON modules_id = ID_modules
INNER JOIN 
    Employees
    ON Employees_ID = ID_Employees
ORDER BY 
    Distrib ASC;


-- Создание таблицы Modules_Skills
SELECT
    Name_Skills AS "Навык",
    Name_modules ||' '||Prefix_modules AS "Название и префикс модуля"
FROM 
    Modules_Skills
INNER JOIN 
    Skills
    ON Skills_ID = ID_Skills
INNER JOIN 
    Program_Modules
    ON Program_Modules_ID = ID_Program_Modules
INNER JOIN 
    Modules
    ON Modules_ID = ID_Modules
ORDER BY 
    Modules_Skills ASC


-- Module_Topics
SELECT
    Name_Topics ||', '|| Type_Format_Topics AS "Название и формат темы",
    Name_modules ||' '|| Prefix_modules AS "Название и префикс модуля"
FROM 
    Module_Topics
INNER JOIN 
    Topics
    ON Topics_ID = ID_Topics
INNER JOIN 
    Format_Topics
    ON Format_Topics_ID = ID_Format_Topics
INNER JOIN 
    Program_Modules
    ON Program_Modules_ID = ID_Program_Modules
INNER JOIN 
    Modules
    ON Modules_ID = ID_Modules
ORDER BY 
    Program_Modules ASC

-- Study_Group
SELECT
    Num_Study_Group AS "Номер учебной группы",
    Type_Training_Status AS "Вид статуса",
    Name_Training_programs ||' '|| Prefix_Training_programs AS "Название и префикс программы",
    Name_qualification_Training_programs AS "Название квалификации"
FROM 
    Study_Group
INNER JOIN 
    Training_status
    ON Training_status_ID = ID_Training_status
INNER JOIN 
    Training_programs
    ON Training_programs_ID = ID_Training_programs
ORDER BY 
    Study_Group ASC

-- Modules_technologies
SELECT
    Name_Technologies AS "Название технологии",
    Name_modules ||' '|| Prefix_modules AS "Название и префикс модуля"
FROM 
    Module_technologies
INNER JOIN 
    Technologies
    ON Technologies_ID = ID_Technologies
INNER JOIN 
    Program_Modules
    ON Program_Modules_ID = ID_Program_Modules
INNER JOIN 
    Modules
    ON Modules_ID = ID_Modules
ORDER BY 
    Module_technologies ASC


-- List_contracts
SELECT
    Num_List_contracts AS "Номер договора",
    Date_conclusion_List_contracts AS "Дата заключения договора",
    Surname_Listeners ||' '|| Name_Listeners ||' '|| Patronymic_Listeners AS "ФИО Слушателя",
    '№' ||Num_Study_Group AS "Номер группы",
    Type_Training_Status AS "Вид статуса",
    Name_Training_programs ||' '|| Prefix_Training_programs AS "Название и префикс программы"
FROM 
    List_contracts
INNER JOIN 
    Study_Group
    ON Study_Group_ID = ID_Study_Group
INNER JOIN 
    Listeners
    ON Listeners_ID = ID_Listeners
INNER JOIN 
    Training_Status
    ON Training_Status_ID = ID_Training_Status
INNER JOIN 
    Training_programs
    ON Training_programs_id = ID_Training_programs
ORDER BY
    Num_List_contracts ASC

-- Schedule
SELECT
    D_W_Schedule AS "Название дня недели",
    Type_training_training_format AS "Формат обучения",
    T_S_Schedule ||' - '|| T_F_Schedule AS "Время начала и конца занятий",
    T_S_B_Schedule ||' - '|| T_F_B_Schedule AS "Время начала и конца перерыва",
    Date_conclusion_List_contracts AS "Дата заключения договора",
    Num_List_contracts AS "Номер договора",
    Surname_Listeners ||' '|| Name_Listeners ||' '|| Patronymic_Listeners AS "ФИО Слушателя",
    '№' ||Num_Study_Group AS "Номер группы",
    Type_Training_Status AS "Вид статуса",
    Name_Training_programs ||' '|| Prefix_Training_programs AS "Название и префикс программы"
FROM 
    Schedule
INNER JOIN 
    training_format
    ON training_format_ID = ID_training_format
INNER JOIN 
    List_contracts
    ON List_contracts_ID = ID_List_contracts
INNER JOIN 
    Study_Group
    ON Study_Group_ID = ID_Study_Group
INNER JOIN 
    Training_Status
    ON Training_Status_ID = ID_Training_Status
INNER JOIN 
    Listeners
    ON Listeners_ID = ID_Listeners
INNER JOIN 
    Training_programs
    ON Training_programs_ID = ID_Training_programs
ORDER BY 
    Schedule ASC