-- Все мои таблицы
Программы обучения (Training_programs)
Программа модуля (Program_module)
Модули (Modules)
Сотрудники (Employees)
Распределение (Distrib)
Навыки модуля (Module_Skills)
Навыки (Skills)
Технологии модуля (Module_technologies)
Технологии (Technologies)
Темы модуля (Module_Topics)
Темы (Topics)
Формат тем (Format_Topics)
Статус обучения (Training_status)
Учебная группа (Study_Group)
Слушатели (Listeners)
Перечень договоров (List_contracts)
Формат обучения (Training_format)
Расписание (Schedule)


-- Справочные таблицы:
Программа обучения (Training_programs)  +
Модули (Modules)  +
Программа модуля (Program_modules)  +
Статус обучения (Training_status)   +
Формат обучения (Training_format) +
Формат тем (Format_Topics)  +
Темы (Topics) +
Технологии (Technologies) +
Навыки (Skills)  +
Навыки модуля (Modules_Skills) +
Темы модуля (Module_Topics) +
Технологии модуля (Module_technologies) +
Перечень договоров (List_contracts) +


-- Операционные таблицы:
Сотрудники (Employees) +
Распределение (Distrib) +
Темы модуля (Module_Topics) +
Учебная группа (Study_Group) +
Слушатели (Listeners) +
Расписание (Schedule) +


SELECT 
    <столбцы>
FROM 
    <основная таблица>
INNER JOIN 
    <связанные таблицы>
    ON ID_<связанные таблицы> = <связанные таблицы>_ID;
ORDER BY 
    <связанные таблицы>_ID ASC;



SELECT 
    Program_Modules.ID_Program_Modules,
    Training_Programs.Name_Training_Program,
    Modules.Name_Module
FROM 
    Program_Modules
INNER JOIN 
    Training_Programs ON Program_Modules.ID_Training_Programs = Training_Programs.ID_Training_Programs
INNER JOIN 
    Modules ON Program_Modules.ID_Modules = Modules.ID_Modules;
