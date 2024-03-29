-- Создание таблицы Training_programs
-- Определение таблицы Training_programs
CREATE TABLE IF NOT EXISTS Training_programs (
    ID_Training_programs SERIAL NOT NULL PRIMARY KEY,
    Name_Training_programs VARCHAR(100) NOT NULL,
    Prefix_Training_programs VARCHAR(5) NOT NULL,
    Direction_Training_programs INT NOT NULL, -- INT вместо Serial
    Time_training_Training_programs INT NOT NULL, -- INT вместо Serial
    Cost_study_Training_programs DECIMAL(10,2) NOT NULL,
    Name_qualification_Training_programs VARCHAR(50) NOT NULL,
    Pictures_Training_programs VARCHAR(255) NOT NULL -- Исправлено на VARCHAR(255)
);

-- Определение хранимой процедуры Training_programs_Insert
CREATE OR REPLACE PROCEDURE Training_programs_Insert (
    p_Name_Training_programs VARCHAR(100),
    p_Prefix_Training_programs VARCHAR(5),
    p_Direction_Training_programs INT,
    p_Time_training_Training_programs INT,
    p_Cost_study_Training_programs DECIMAL(10,2),
    p_Name_qualification_Training_programs VARCHAR(50),
    p_Pictures_Training_programs VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Training_programs (
        Name_Training_programs,
        Prefix_Training_programs,
        Direction_Training_programs,
        Time_training_Training_programs,
        Cost_study_Training_programs,
        Name_qualification_Training_programs,
        Pictures_Training_programs
    ) VALUES (
        p_Name_Training_programs,
        p_Prefix_Training_programs,
        p_Direction_Training_programs,
        p_Time_training_Training_programs,
        p_Cost_study_Training_programs,
        p_Name_qualification_Training_programs,
        p_Pictures_Training_programs
    );
END $$;

-- Изменение
create or replace procedure Training_programs_Update (
p_ID_Training_programs int,
p_Name_Training_programs VARCHAR(100),
p_Prefix_Training_programs VARCHAR(5),
p_Direction_Training_programs INT,
p_Time_training_Training_programs INT,
p_Cost_study_Training_programs DECIMAL(10,2),
p_Name_qualification_Training_programs VARCHAR(50),
p_Pictures_Training_programs VARCHAR(255)
)
language plpgsql
as $$
    begin
        update Training_programs set
            Name_Training_programs = p_Name_Training_programs,
            Prefix_Training_programs = p_Prefix_Training_programs,
            Direction_Training_programs = p_Direction_Training_programs,
            Time_training_Training_programs = p_Time_training_Training_programs,
            Cost_study_Training_programs = p_Cost_study_Training_programs,
            Name_qualification_Training_programs = p_Name_qualification_Training_programs,
            Pictures_Training_programs = p_Pictures_Training_programs
                where
                    ID_Training_programs = p_ID_Training_programs;
    end;
$$;

-- Удаление
create or replace procedure Training_programs_Delete (p_ID_Training_programs int)
language plpgsql
as $$
    begin
        delete from Training_programs
            where
                ID_Training_programs = p_ID_Training_programs;
    end;
$$;

-- Создание индексов
create index if not exists index_ID_Training_programs on Training_programs (ID_Training_programs);
create index if not exists index_Name_Training_programs on Training_programs (ID_Training_programs);
create index if not exists index_Prefix_Training_programs on Training_programs (ID_Training_programs);
create index if not exists index_Direction_Training_programs on Training_programs (ID_Training_programs);
create index if not exists index_Name_qualification_Training_programs on Training_programs (ID_Training_programs);

-- Создание таблицы modules
CREATE TABLE IF NOT EXISTS modules (
    ID_modules SERIAL NOT NULL PRIMARY KEY,
    Name_modules VARCHAR(50) NOT NULL,
    Prefix_modules VARCHAR(5) NOT NULL,
    Num_study_h_modules INT NOT NULL,
    Theoretical_h_modules INT NOT NULL,
    Practical_h_modules INT NOT NULL,
    alone_h_modules INT NOT NULL,
    Topic_h_modules INT NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE modules_Insert (
    p_Name_modules VARCHAR(50),
    p_Prefix_modules VARCHAR(5),
    p_Num_study_h_modules INT,
    p_Theoretical_h_modules INT,
    p_Practical_h_modules INT,
    p_alone_h_modules INT,
    p_Topic_h_modules INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO modules (
    Name_modules,
    Prefix_modules,
    Num_study_h_modules,
    Theoretical_h_modules,
    Practical_h_modules,
    alone_h_modules,
    Topic_h_modules
    )
    VALUES (
    p_Name_modules,
    p_Prefix_modules,
    p_Num_study_h_modules,
    p_Theoretical_h_modules,
    p_Practical_h_modules,
    p_alone_h_modules,
    p_Topic_h_modules
    );
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE modules_Update (
    p_ID_modules INT,
    p_Name_modules VARCHAR(50),
    p_Prefix_modules VARCHAR(5),
    p_Num_study_h_modules INT,
    p_Theoretical_h_modules INT,
    p_Practical_h_modules INT,
    p_alone_h_modules INT,
    p_Topic_h_modules INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE modules SET
        Name_modules = p_Name_modules,
        Prefix_modules = p_Prefix_modules,
        Num_study_h_modules = p_Num_study_h_modules,
        Theoretical_h_modules = p_Theoretical_h_modules,
        Practical_h_modules = p_Practical_h_modules,
        alone_h_modules = p_alone_h_modules,
        Topic_h_modules = p_Topic_h_modules
    WHERE
        id_modules = p_id_modules;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE modules_Delete (p_id_modules int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM modules
        WHERE
            id_modules = p_id_modules;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_modules ON modules (ID_modules);
CREATE INDEX IF NOT EXISTS index_Prefix_modules ON modules (ID_modules);

-- Создание таблицы Program_modules
CREATE TABLE IF NOT EXISTS Program_modules (
    ID_Program_modules SERIAL NOT NULL PRIMARY KEY,
    Training_programs_ID int NOT NULL REFERENCES Training_programs(ID_Training_programs),
    Modules_ID int NOT NULL REFERENCES modules(ID_modules)
);

-- Добавление
CREATE OR REPLACE PROCEDURE Program_Modules_Insert (p_training_programs_id INT, p_modules_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Program_Modules (training_programs_id, moduless_id)
    VALUES (p_training_programs_id, p_modules_id);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Program_Modules_Update (p_id_program_modules INT, p_training_programs_id INT, p_modules_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Program_Modules
    SET
        training_programs_id = p_training_programs_id,
        modules_id = p_modules_id
    WHERE
        id_program_modules = p_id_program_modules;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Program_Modules_Delete (p_id_program_modules INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Program_Modules
    WHERE
        id_program_modules = p_id_program_modules;
END;
$$;

-- Создание индексов
create index if not exists index_ID_Program_modules on Program_modules (ID_Program_modules);

-- Создание таблицы Employees
CREATE TABLE IF NOT EXISTS Employees (
    ID_Employees Serial NOT NULL PRIMARY KEY,
    Surname_Employees VARCHAR(50) NOT NULL,
    Name_Employees VARCHAR(50) NOT NULL,
    Middle_name_Employees VARCHAR(50),
    Name_post_Employees VARCHAR(50) NOT NULL,
    Login_Employees VARCHAR(36) NOT NULL,
    Password_Employees VARCHAR(36) NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Employees_Insert (
p_Surname_Employees VARCHAR(50),
p_Name_Employees VARCHAR(50),
p_Middle_name_Employees VARCHAR(50),
p_Name_post_Employees VARCHAR(50),
p_Login_Employees VARCHAR(36),
p_Password_Employees VARCHAR(36)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employees (
    Surname_Employees,
    Name_Employees,
    Middle_name_Employees,
    Name_post_Employeess,
    Login_Employees,
    Password_Employees
    )
    VALUES (
    p_Surname_Employees,
    p_Name_Employees,
    p_Middle_name_Employees,
    p_Name_post_Employees,
    p_Login_Employees,
    p_Password_Employees
    );
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Employees_Update (
p_ID_Employees INT,
p_Surname_Employees VARCHAR(50),
p_Name_Employees VARCHAR(50),
p_Middle_name_Employees VARCHAR(50),
p_Name_post_Employees VARCHAR(50),
p_Login_Employees VARCHAR(36),
p_Password_Employees VARCHAR(36)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employees SET
        Surname_Employees = p_Surname_Employees,
        Name_Employees = p_Name_Employees,
        Middle_name_Employees = p_Middle_name_Employees,
        Name_post_Employeess = p_Name_post_Employees,
        Login_Employees = p_Login_Employees,
        Password_Employees = p_Password_Employees
    WHERE
        id_Employees = p_id_Employees;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Employees_Delete (p_id_Employees int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employees
    WHERE
        id_Employees = p_id_Employees;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Employees ON Employees (ID_Employees);
CREATE INDEX IF NOT EXISTS index_Middle_name_Employees ON Employees (ID_Employees);
CREATE INDEX IF NOT EXISTS index_Name_post_Employees ON Employees (ID_Employees);
CREATE INDEX IF NOT EXISTS index_Login_Employees ON Employees (ID_Employees);
CREATE INDEX IF NOT EXISTS index_Password_Employees ON Employees (ID_Employees);

-- Создание таблицы Distrib
CREATE TABLE IF NOT EXISTS Distrib (
    ID_Distrib Serial NOT NULL PRIMARY KEY,
    Employees_ID INT NOT NULL REFERENCES Employees(ID_Employees),
    Program_Modules_ID INT NOT NULL REFERENCES Program_modules(ID_Program_modules)
);

-- Реализация хранимых процедур
--Добавление
create or replace procedure Distrib_Insert (p_Employees_ID INT, Program_Modules_ID INT)
language plpgsql
as $$
    begin
        insert into Distrib (Employees_ID, Program_Modules_ID)
        values (p_Employees_ID, Program_Modules_ID);
    end;
$$;

--Изменение
create or replace procedure Distrib_Update (p_id_Distrib int, p_Employees_ID INT, Program_Module_ID INT)
language plpgsql
as $$
    begin
        update Distrib set
            Employees_ID = p_Employees_ID,
            Program_Module_ID = Program_Module_ID
                where
                    id_Distrib = p_id_Distrib;
    end;
$$;

--Удаление
create or replace procedure Distrib_Delete (p_id_Distrib int)
language plpgsql
as $$
    begin
        delete from Distrib
            where
                id_Distrib = p_id_Distrib;
    end;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Distrib ON Distrib (ID_Distrib);

-- Создание таблицы Skills
CREATE TABLE IF NOT EXISTS Skills (
    ID_Skills SERIAL NOT NULL PRIMARY KEY,
    Name_Skills VARCHAR(50) NOT NULL
);

--Добавление
CREATE OR REPLACE PROCEDURE Skills_Insert (p_name_Skills Varchar(100))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Skills (name_Skills)
    VALUES (p_name_Skills);
END;
$$;

--Изменение
CREATE OR REPLACE PROCEDURE Skills_Update (p_id_Skills int, p_name_Skills Varchar(100))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Skills SET
        name_Skills = p_name_Skills
    WHERE
        id_Skills = p_id_Skills;
END;
$$;

--Удаление
CREATE OR REPLACE PROCEDURE Skills_Delete (p_id_Skills int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Skills
    WHERE
        id_Skills = p_id_Skills;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Skills ON Skills (ID_Skills);
CREATE INDEX IF NOT EXISTS index_Name_Skills ON Skills (ID_Skills);

-- Создание таблицы Module_Skills
CREATE TABLE IF NOT EXISTS Modules_Skills (
    ID_Modules_Skills SERIAL NOT NULL PRIMARY KEY,
    Program_Modules_ID INT NOT NULL REFERENCES Program_modules(ID_Program_modules),
    Skills_ID INT NOT NULL REFERENCES Skills(ID_Skills)
);

-- Добавление
CREATE OR REPLACE PROCEDURE Modules_Skills_Insert (p_Program_Modules_ID INT, p_Skills_ID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Modules_Skills (Program_Modules_ID, Skills_ID)
    VALUES (p_Program_Modules_ID, p_Skills_ID);
END;
$$;

--Изменение
CREATE OR REPLACE PROCEDURE Modules_Skills_Update (p_id_Modules_Skills int, p_Program_Modules_ID INT, p_Skills_ID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Modules_Skills
    SET
        Program_Modules_ID = p_Program_Modules_ID,
        Skills_ID = p_Skills_ID
    WHERE
        id_Modules_Skills = p_id_Modules_Skills;
END;
$$;

--Удаление
CREATE OR REPLACE PROCEDURE Modules_Skills_Delete (p_id_Modules_Skills int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Modules_Skills
    WHERE
        id_Modules_Skills = p_id_Modules_Skills;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Modules_Skills ON Modules_Skills (ID_Modules_Skills);

-- Создание таблицы Technologies
CREATE TABLE IF NOT EXISTS Technologies (
    ID_Technologies SERIAL NOT NULL PRIMARY KEY,
    Name_Technologies VARCHAR(50) NOT NULL
);

--Добавление
CREATE OR REPLACE PROCEDURE Technologies_Insert (p_name_Technologies Varchar(100))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Technologies (name_Technologies)
    VALUES (p_name_Technologies);
END;
$$;

--Изменение
CREATE OR REPLACE PROCEDURE Technologies_Update (p_id_Technologies int, p_name_Technologies Varchar(100))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Technologies SET
        name_Technologies = p_name_Technologies
    WHERE
        id_Technologies = p_id_Technologies;
END;
$$;

--Удаление
CREATE OR REPLACE PROCEDURE Technologies_Delete (p_id_Technologies int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Technologies
    WHERE
        id_Technologies = p_id_Technologies;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Technologies ON Technologies (ID_Technologies);
CREATE INDEX IF NOT EXISTS index_Name_Technologies ON Technologies (ID_Technologies);

-- Создание таблицы Module_technologies
CREATE TABLE IF NOT EXISTS Module_technologies (
    ID_Module_technologies SERIAL NOT NULL PRIMARY KEY,
    Program_modules_ID INT NOT NULL REFERENCES Program_modules(ID_Program_modules),
    Technologies_ID INT NOT NULL REFERENCES Technologies(ID_Technologies)
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Module_technologies_Insert (Program_modules_ID INT, Technologies_ID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Module_technologies (Program_modules_ID, Technologies_ID)
    VALUES (p_Program_modules_ID, p_Technologies_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Module_technologies_Update (p_ID_Module_technologies int, p_Program_modules_ID INT, p_Technologies_ID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Module_technologies
    SET
        Program_modules_ID = p_Program_modules_ID,
        Technologies_ID = p_Technologies_ID
    WHERE
        id_Module_technologies = p_id_Module_technologies;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Module_technologies_Delete (p_id_Module_technologies int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Module_technologies
    WHERE
        id_Module_technologies = p_id_Module_technologies;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Module_technologies ON Module_technologies (ID_Module_technologies);

-- Создание таблицы Topics
CREATE TABLE IF NOT EXISTS Topics (
    ID_Topics SERIAL NOT NULL PRIMARY KEY,
    Name_Topics VARCHAR(50) NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Topics_Insert (p_Name_Topics VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Topics (Name_Topics)
    VALUES (p_Type_Format_Topics);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Topics_Update (p_ID_Format_Topics INT, p_Type_Format_Topics VARCHAR(22))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Topics
    SET
        Name_Topics = p_Name_Topics
    WHERE
        ID_Topics = p_ID_Topics;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Topics_Delete (p_id_Topics int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Topics
    WHERE
        id_Topics = p_id_Topics;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Topics ON Topics (ID_Topics);
CREATE INDEX IF NOT EXISTS index_Name_Topics ON Topics (ID_Topics);

-- Создание таблицы Module_Topics
CREATE TABLE IF NOT EXISTS Module_Topics (
    ID_Module_Topics SERIAL NOT NULL PRIMARY KEY,
    Program_modules_ID INT NOT NULL REFERENCES Program_modules(ID_Program_modules),
    Topics_ID INT REFERENCES Topics(ID_Topics)
);

-- Добавление
CREATE OR REPLACE PROCEDURE Module_Topics_Insert (p_Program_modules_ID INT, p_Topics_ID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Module_Topics (Program_modules_ID, Topics_ID)
    VALUES (p_Program_modules_ID, p_Topics_ID);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Module_Topics_Update (p_ID_Module_Topics INT, p_Program_modules_ID INT, p_Topics_ID INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Module_Topics
    SET
        Program_modules_ID = p_Program_modules_ID,
        Topics_ID = p_Topics_ID
    WHERE
        ID_Module_Topics = p_ID_Module_Topics;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Module_Topics_Delete (p_id_Module_Topics int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Module_Topics
    WHERE
        id_Module_Topics = p_id_Module_Topics;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Module_Topics ON Module_Topics (ID_Module_Topics);

-- Создание таблицы Format_Topics
CREATE TABLE IF NOT EXISTS Format_Topics (
    ID_Format_Topics SERIAL NOT NULL PRIMARY KEY,
    Type_Format_Topics VARCHAR(22) NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Format_Topics_Insert (p_Type_Format_Topics VARCHAR(22))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Format_Topics (Type_Format_Topics)
    VALUES (p_Type_Format_Topics);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Format_Topics_Update (p_ID_Format_Topics int, p_Type_Format_Topics VARCHAR(22))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Format_Topics
    SET
        Type_Format_Topics = p_Type_Format_Topics
    WHERE
        id_Format_Topics = p_id_Format_Topics;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Format_Topics_Delete (p_id_Format_Topics int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Format_Topics
    WHERE
        id_Format_Topics = p_id_Format_Topics;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Format_Topics ON Format_Topics (ID_Format_Topics);
CREATE INDEX IF NOT EXISTS index_Type_Format_Topics ON Format_Topics (ID_Format_Topics);

-- Создание таблицы Training_status
CREATE TABLE IF NOT EXISTS Training_status (
    ID_Training_Status SERIAL PRIMARY KEY,
    Type_Status VARCHAR(17) NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Training_status_Insert (p_Type_Status VARCHAR(17))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Training_status (Type_Status)
    VALUES (p_Type_Status);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Training_status_Update (p_ID_Training_status INT, p_Type_Status VARCHAR(17))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Training_status
    SET
        Type_Status = p_Type_Status
    WHERE
        ID_Training_Status = p_ID_Training_status;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Training_status_Delete (p_id_Training_status INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Training_status
    WHERE
        ID_Training_Status = p_id_Training_status;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Training_status ON Training_status (ID_Training_Status);
CREATE INDEX IF NOT EXISTS index_Type_Status ON Training_status (Type_Status);

-- Создание таблицы Study_Group
CREATE TABLE IF NOT EXISTS Study_Group (
    ID_Study_Group SERIAL NOT NULL PRIMARY KEY,
    Num_St_Group VARCHAR(7) NOT NULL,
    Status_St_Group INT NOT NULL REFERENCES Training_status(ID_Training_status),
    Program_St_Group INT NOT NULL REFERENCES Program_modules(ID_Program_modules)
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Study_Group_Insert (p_Num_St_Group VARCHAR(7), p_Status_St_Group INT, p_Program_St_Group INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Study_Group (Type_Status)
    VALUES (p_Type_Status);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Study_Group_Update (p_ID_Study_Group int, Num_St_Group VARCHAR(7), Status_St_Group INT, Program_St_Group INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Study_Group
    SET
        Num_St_Group = p_Num_St_Group,
        Status_St_Group = p_Status_St_Group,
        Program_St_Group = p_Program_St_Group
    WHERE
        id_Study_Group = p_id_Study_Group;
END;
$$;

-- Удаление
CREATE OR REPLACE PROCEDURE Study_Group_Delete (p_id_Study_Group int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Study_Group
    WHERE
        id_Study_Group = p_id_Study_Group;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Study_Group ON Study_Group (ID_Study_Group);
CREATE INDEX IF NOT EXISTS index_Num_St_Grp ON Study_Group (ID_Study_Group);

-- Создание таблицы Listeners
CREATE TABLE IF NOT EXISTS Listeners (
    ID_Listeners SERIAL PRIMARY KEY,
    Surname_Listeners VARCHAR(50) NOT NULL,
    Name_Listeners VARCHAR(50) NOT NULL,
    Patronymic_Listeners VARCHAR(50),
    Passport_series_Listeners VARCHAR(5) NOT NULL,
    Passport_num_Listeners INT NOT NULL,
    Birthday_Listeners DATE NOT NULL,
    Issued_whom_when_Listeners VARCHAR(70) NOT NULL,
    Unit_code_Listeners VARCHAR(7) NOT NULL,
    Address_Listeners VARCHAR(50) NOT NULL,
    Phone_Listeners VARCHAR(16) NOT NULL,
    Email_Listeners VARCHAR(255) NOT NULL,
    SNILS_Listeners VARCHAR(13) NOT NULL,
    Login_Listeners VARCHAR(36) NOT NULL,
    Password_Listeners VARCHAR(36) NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Listeners_Insert (
    Surname_Listeners VARCHAR(50),
    Name_Listeners VARCHAR(50),
    Patronymic_Listeners VARCHAR(50),
    Passport_series_Listeners VARCHAR(5),
    Passport_num_Listeners INT,
    Birthday_Listeners DATE,
    Issued_whom_when_Listeners VARCHAR(70),
    Unit_code_Listeners VARCHAR(7),
    Address_Listeners VARCHAR(50),
    Phone_Listeners VARCHAR(16),
    Email_Listeners VARCHAR(255),
    SNILS_Listeners VARCHAR(13),
    Login_Listeners VARCHAR(36),
    Password_Listeners VARCHAR(36)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Listeners (
        Surname_Listeners,
        Name_Listeners,
        Patronymic_Listeners,
        Passport_series_Listeners,
        Passport_num_Listeners,
        Birthday_Listeners,
        Issued_whom_when_Listeners,
        Unit_code_Listeners,
        Address_Listeners,
        Phone_Listeners,
        Email_Listeners,
        SNILS_Listeners,
        Login_Listeners,
        Password_Listeners
        )

    VALUES (p_Surname_Listeners,
            p_Name_Listeners,
            p_Patronymic_Listeners,
            p_Passport_series_Listeners,
            p_Passport_num_Listeners,
            p_Birthday_Listeners,
            p_Issued_whom_when_Listeners,
            p_Unit_code_Listeners,
            p_Address_Listeners,
            p_Phone_Listeners,
            p_Email_Listeners,
            p_SNILS_Listeners,
            p_Login_Listeners,
            p_Password_Listeners
            );
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Listeners_Update (
    p_ID_Listeners INT,
    p_Surname_Listeners VARCHAR(50),
    p_Name_Listeners VARCHAR(50),
    p_Patronymic_Listeners VARCHAR(50),
    p_Passport_series_Listeners VARCHAR(5),
    p_Passport_num_Listeners INT,
    p_Birthday_Listeners DATE,
    p_Issued_whom_when_Listeners VARCHAR(70),
    p_Unit_code_Listeners VARCHAR(7),
    p_Address_Listeners VARCHAR(50),
    p_Phone_Listeners VARCHAR(16),
    p_Email_Listeners VARCHAR,
    p_SNILS_Listeners VARCHAR(13),
    p_Login_Listeners VARCHAR(36),
    p_Password_Listeners VARCHAR(36)
    )
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Listeners
    SET
        Surname_Listeners = p_Surname_Listeners,
        Name_Listeners = p_Name_Listeners,
        Patronymic_Listeners = p_Patronymic_Listeners,
        Passport_series_Listeners = p_Passport_series_Listeners,
        Passport_num_Listeners = p_Passport_num_Listeners,
        Birthday_Listeners = p_Birthday_Listeners,
        Issued_whom_when_Listeners = p_Issued_whom_when_Listeners,
        Unit_code_Listeners = p_Unit_code_Listeners,
        Address_Listeners = p_Address_Listeners,
        Phone_Listeners = p_Phone_Listeners,
        Email_Listeners = p_Email_Listeners,
        SNILS_Listeners = p_SNILS_Listeners,
        Login_Listeners = p_Login_Listeners,
        Password_Listeners = p_Password_Listeners
    WHERE
        id_Listeners = p_id_Listeners;
END;
$$;
 
-- Удаление
CREATE OR REPLACE PROCEDURE Listeners_Delete (p_id_Listeners int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Listeners
    WHERE
        id_Listeners = p_id_Listeners;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Passport_num_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Birthday_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Issued_whom_when_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Unit_code_Listeners_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Adress_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Email_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_SNILS_Listeners ON Listeners (ID_Listeners);
CREATE INDEX IF NOT EXISTS index_Login_Listeners ON Listeners (ID_Listeners);

-- Создание таблицы List_contracts
CREATE TABLE IF NOT EXISTS List_contracts (
    ID_List_contracts Serial NOT NULL PRIMARY KEY,
    Num_List_contracts VARCHAR(14) NOT NULL,
    Date_conclusion_List_contracts DATE NOT NULL,
    Listeners_ID INT NOT NULL REFERENCES Listeners(ID_Listeners),
    Study_Group_ID INT NOT NULL REFERENCES Study_Group(ID_Study_Group)
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE List_contracts_Insert (
    p_Num_List_contracts VARCHAR(14),
    p_Date_conclusion_List_contracts DATE,
    p_Listeners_ID INT,
    p_Study_Group_ID INT
    )
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO List_contracts (
        Num_List_contracts,
        Date_conclusion_List_contracts,
        Listeners_ID,
        Study_Group_ID
        )
    VALUES (
        p_Num_List_contracts,
        p_Date_conclusion_List_contracts,
        p_Listeners_ID,
        p_Study_Group_ID
        );
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE List_contracts_Update (
    p_id_List_contracts INT,  
    p_Num_List_contracts VARCHAR(14),
    p_Date_conclusion_List_contracts DATE,
    p_Listeners_ID INT,
    p_Study_Group_ID INT
    )
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE List_contracts
    SET
        Num_List_contracts = p_Num_List_contracts,
        Date_conclusion_List_contracts = p_Date_conclusion_List_contracts,
        Listeners_ID = p_Listeners_ID,
        Study_Group_ID = p_Study_Group_ID
    WHERE
        ID_List_contracts = p_ID_List_contracts;
END;
$$;
 
-- Удаление
CREATE OR REPLACE PROCEDURE List_contracts_Delete (p_id_List_contracts int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM List_contracts
    WHERE
        id_List_contracts = p_id_List_contracts;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_List_contracts ON List_contracts (ID_List_contracts);
CREATE INDEX IF NOT EXISTS index_Num_List_contracts ON List_contracts (ID_List_contracts);
CREATE INDEX IF NOT EXISTS index_Date_conclusion_List_contracts ON List_contracts (ID_List_contracts);

-- Создание таблицы Training_format
CREATE TABLE IF NOT EXISTS Training_format (
    ID_Training_format Serial NOT NULL PRIMARY KEY,
    Type_training_training_format VARCHAR(12) NOT NULL
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Training_format_Insert (p_Type_training_training_format VARCHAR(12))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Training_format (Type_training_training_format)
    VALUES (p_Type_training_training_format);
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Training_format_Update (p_id_Training_format int, p_Type_training_training_format VARCHAR(12))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Training_format
    SET
        Type_training_training_format = p_Type_training_training_format
    WHERE
        id_Training_format = p_id_Training_format;
END;
$$;
 
-- Удаление
CREATE OR REPLACE PROCEDURE Training_format_Delete (p_id_Training_format int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Training_format
    WHERE
        id_Training_format = p_id_Training_format;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Training_format ON Training_format (ID_Training_format);
CREATE INDEX IF NOT EXISTS index_Type_training_training_format ON Training_format (ID_Training_format);

-- Создание таблицы Schedule
CREATE TABLE IF NOT EXISTS Schedule (
    ID_Schedule Serial NOT NULL PRIMARY KEY,
    D_W_Schedule VARCHAR(11) NOT NULL,
    T_S_Schedule TIME NOT NULL,
    T_F_Schedule TIME NOT NULL,
    Form_Schedule INT NOT NULL REFERENCES Training_format(ID_Training_format),
    T_S_B_Schedule TIME NOT NULL,
    T_F_B_Schedule TIME NOT NULL,
    List_contracts_ID INT NOT NULL REFERENCES List_contracts(ID_List_contracts)
);

-- Реализация хранимых процедур
-- Добавление
CREATE OR REPLACE PROCEDURE Schedule_Insert (
    p_D_W_Schedule VARCHAR(11),
    p_T_S_Schedule TIME,
    p_T_F_Schedule TIME,
    p_Form_Schedule INT,
    p_T_S_B_Schedule TIME,
    p_T_F_B_Schedule TIME,
    p_List_contracts_ID INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Schedule (  
    D_W_Schedule,
    T_S_Schedule,
    T_F_Schedule,
    Form_Schedule,
    T_S_B_Schedule,
    T_F_B_Schedule,
    List_contracts_ID
    )
    VALUES (
        p_D_W_Schedule,
        p_T_S_Schedule,
        p_T_F_Schedule,
        p_Form_Schedule,
        p_T_S_B_Schedule,
        p_T_F_B_Schedule,
        p_List_contracts_ID
    );
END;
$$;

-- Изменение
CREATE OR REPLACE PROCEDURE Schedule_Update (
    p_id_Schedule int,
    p_D_W_Schedule VARCHAR(11),
    p_T_S_Schedule TIME,
    p_T_F_Schedule TIME,
    p_Form_Schedule INT,
    p_T_S_B_Schedule TIME,
    p_T_F_B_Schedule TIME,
    p_List_contracts_ID INT
    )
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Schedule
    SET
        D_W_Schedule = p_D_W_Schedule,
        T_S_Schedule = p_T_S_Schedule,
        T_F_Schedule = p_T_F_Schedule,
        Form_Schedule = p_Form_Schedule,
        T_S_B_Schedule = p_T_S_B_Schedule,
        T_F_B_Schedule = p_T_F_B_Schedule,
        List_contracts_ID = p_List_contracts_ID
    WHERE
        id_Schedule = p_id_Schedule;
END;
$$;
 
-- Удаление
CREATE OR REPLACE PROCEDURE Schedule_Delete (p_id_Schedule int)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Schedule
    WHERE
        id_Schedule = p_id_Schedule;
END;
$$;

-- Создание индексов
CREATE INDEX IF NOT EXISTS index_ID_Schedule ON Schedule (ID_Schedule);
CREATE INDEX IF NOT EXISTS index_D_W_Schedule ON Schedule (ID_Schedule);
CREATE INDEX IF NOT EXISTS index_T_F_Schedule ON Schedule (ID_Schedule);
CREATE INDEX IF NOT EXISTS index_T_S_B_Schedule ON Schedule (ID_Schedule);
CREATE INDEX IF NOT EXISTS index_T_F_B_Schedule ON Schedule (ID_Schedule);

-- Выдача прав доступа
GRANT SELECT, INSERT, UPDATE, DELETE ON Training_programs TO rl_zap_directorc;
grant usage, select on sequence Training_programs_id_training_programs_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Program_modules TO rl_zap_directorc;
grant usage, select on sequence program_modules_id_program_modules_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Modules TO rl_zap_directorc;
grant usage, select on sequence modules_id_modules_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Modules_Skills TO rl_zap_directorc;
grant usage, select on sequence Modules_Skills_id_Modules_Skills_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Module_technologies TO rl_zap_directorc;
grant usage, select on sequence Module_technologies_id_Module_technologies_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Module_Topics TO rl_zap_directorc;
grant usage, select on sequence Module_Topics_id_Module_Topics_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Distrib TO rl_zap_directorc;
grant usage, select on sequence Distrib_id_Distrib_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Training_format TO rl_zap_directorc;
grant usage, select on sequence Training_format_id_Training_format_seq TO rl_zap_directorc;
GRANT SELECT, INSERT, UPDATE, DELETE ON Format_Topics TO rl_zap_directorc;
grant usage, select on sequence Format_Topics_id_Format_Topics_seq TO rl_zap_directorc;
GRANT SELECT ON Employees TO rl_zap_directorc;
GRANT SELECT ON Study_Group TO rl_zap_directorc;
GRANT SELECT ON Schedule TO rl_zap_directorc;

GRANT SELECT, INSERT, UPDATE, DELETE ON Training_status TO rl_zap_customersr;
grant usage, select on sequence Training_status_id_Training_status_seq TO rl_zap_customersr;
GRANT SELECT, INSERT, UPDATE, DELETE ON Study_Group TO rl_zap_customersr;
grant usage, select on sequence Study_Group_id_Study_Group_seq TO rl_zap_customersr;
GRANT SELECT, INSERT, UPDATE, DELETE ON Listeners TO rl_zap_customersr;
grant usage, select on sequence Listeners_id_Listeners_seq TO rl_zap_customersr;
GRANT SELECT, INSERT, UPDATE, DELETE ON List_contracts TO rl_zap_customersr;
grant usage, select on sequence List_contracts_id_List_contracts_seq TO rl_zap_customersr;
GRANT SELECT, INSERT, UPDATE, DELETE ON Schedule TO rl_zap_customersr;
grant usage, select on sequence Schedule_id_Schedule_seq TO rl_zap_customersr;
GRANT SELECT ON Training_programs TO rl_zap_customersr;
GRANT SELECT ON Program_modules TO rl_zap_customersr;
GRANT SELECT ON Modules TO rl_zap_customersr;
GRANT SELECT ON Modules_Skills TO rl_zap_customersr;
GRANT SELECT ON Skills TO rl_zap_customersr;
GRANT SELECT ON Module_technologies TO rl_zap_customersr;
GRANT SELECT ON Technologies TO rl_zap_customersr;
GRANT SELECT ON Module_Topics TO rl_zap_customersr;
GRANT SELECT ON Topics TO rl_zap_customersr;
GRANT SELECT ON Format_Topics TO rl_zap_customersr;
GRANT SELECT ON Distrib TO rl_zap_customersr;
GRANT SELECT ON Training_format TO rl_zap_customersr;

GRANT SELECT ON Training_programs TO rl_zap_teacher;
GRANT SELECT ON Program_modules TO rl_zap_teacher;
GRANT SELECT ON Modules TO rl_zap_teacher;
GRANT SELECT ON Modules_Skills TO rl_zap_teacher;
GRANT SELECT ON Skills TO rl_zap_teacher;
GRANT SELECT ON Module_technologies TO rl_zap_teacher;
GRANT SELECT ON Technologies TO rl_zap_teacher;
GRANT SELECT ON Module_Topics TO rl_zap_teacher;
GRANT SELECT ON Topics TO rl_zap_teacher;
GRANT SELECT ON Format_Topics TO rl_zap_teacher;
GRANT SELECT ON Training_status TO rl_zap_teacher;
GRANT SELECT ON Distrib TO rl_zap_teacher;
GRANT SELECT ON Study_Group TO rl_zap_teacher;
GRANT SELECT ON Training_format TO rl_zap_teacher;
GRANT SELECT ON Schedule TO rl_zap_teacher;

GRANT SELECT ON Training_programs TO rl_zap_listener;
GRANT SELECT ON Program_modules TO rl_zap_listener;
GRANT SELECT ON Modules TO rl_zap_listener;
GRANT SELECT ON Modules_Skills TO rl_zap_listener;
GRANT SELECT ON Skills TO rl_zap_listener;
GRANT SELECT ON Module_technologies TO rl_zap_listener;
GRANT SELECT ON Technologies TO rl_zap_listener;
GRANT SELECT ON Module_Topics TO rl_zap_listener;
GRANT SELECT ON Topics TO rl_zap_listener;
GRANT SELECT ON Format_Topics TO rl_zap_listener;
GRANT SELECT ON Study_Group TO rl_zap_listener;
GRANT SELECT ON Training_format TO rl_zap_listener;
GRANT SELECT ON Schedule TO rl_zap_listener;

GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO rl_zap_administrator;
grant usage, select on sequence Employees_id_Employees_seq TO rl_zap_administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Skills TO rl_zap_administrator;
grant usage, select on sequence Skills_id_Skills_seq TO rl_zap_administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Technologies TO rl_zap_administrator;
grant usage, select on sequence Technologies_id_Technologies_seq TO rl_zap_administrator;
GRANT SELECT, INSERT, UPDATE, DELETE ON Topics TO rl_zap_administrator;
grant usage, select on sequence Topics_id_Topics_seq TO rl_zap_administrator;
GRANT SELECT, DELETE ON Training_programs TO rl_zap_administrator;
grant usage, select on sequence Training_programs_id_Training_programs_seq TO rl_zap_administrator;
GRANT SELECT, DELETE ON Program_modules TO rl_zap_administrator;
GRANT SELECT, DELETE ON Modules TO rl_zap_administrator;
GRANT SELECT, DELETE ON Modules_Skills TO rl_zap_administrator;
GRANT SELECT, DELETE ON Module_technologies TO rl_zap_administrator;
GRANT SELECT, DELETE ON Module_Topics TO rl_zap_administrator;
GRANT SELECT, DELETE ON Format_Topics TO rl_zap_administrator;
GRANT SELECT, DELETE ON Training_status TO rl_zap_administrator;
GRANT SELECT, DELETE ON Distrib TO rl_zap_administrator;
GRANT SELECT, DELETE ON Study_Group TO rl_zap_administrator;
GRANT SELECT, DELETE ON Listeners TO rl_zap_administrator;
GRANT SELECT, DELETE ON List_contracts TO rl_zap_administrator;
GRANT SELECT, DELETE ON Schedule TO rl_zap_administrator;

grant execute on procedure Training_programs_update to rl_zap_directorc;
grant execute on procedure Training_programs_insert to rl_zap_directorc;
grant execute on procedure Training_programs_delete to rl_zap_directorc;
grant execute on procedure Program_modules_update to rl_zap_directorc;
grant execute on procedure Program_modules_insert to rl_zap_directorc;
grant execute on procedure Program_modules_delete to rl_zap_directorc;
grant execute on procedure Modules_update to rl_zap_directorc;
grant execute on procedure Modules_insert to rl_zap_directorc;
grant execute on procedure Modules_delete to rl_zap_directorc;
grant execute on procedure Modules_Skills_update to rl_zap_directorc;
grant execute on procedure Modules_Skills_insert to rl_zap_directorc;
grant execute on procedure Modules_Skills_delete to rl_zap_directorc;
grant execute on procedure Module_technologies_update to rl_zap_directorc;
grant execute on procedure Module_technologies_insert to rl_zap_directorc;
grant execute on procedure Module_technologies_delete to rl_zap_directorc;
grant execute on procedure Module_Topics_update to rl_zap_directorc;
grant execute on procedure Module_Topics_insert to rl_zap_directorc;
grant execute on procedure Module_Topics_delete to rl_zap_directorc;
grant execute on procedure Format_Topics_update to rl_zap_directorc;
grant execute on procedure Format_Topics_insert to rl_zap_directorc;
grant execute on procedure Format_Topics_delete to rl_zap_directorc;
grant execute on procedure Distrib_update to rl_zap_directorc;
grant execute on procedure Distrib_insert to rl_zap_directorc;
grant execute on procedure Distrib_delete to rl_zap_directorc;
grant execute on procedure Training_format_update to rl_zap_directorc;
grant execute on procedure Training_format_insert to rl_zap_directorc;
grant execute on procedure Training_format_delete to rl_zap_directorc;
grant execute on procedure Training_status_update to rl_zap_customersr;
grant execute on procedure Training_status_insert to rl_zap_customersr;
grant execute on procedure Training_status_delete to rl_zap_customersr;
grant execute on procedure Study_Group_update to rl_zap_customersr;
grant execute on procedure Study_Group_insert to rl_zap_customersr;
grant execute on procedure Study_Group_delete to rl_zap_customersr;
grant execute on procedure Listeners_update to rl_zap_customersr;
grant execute on procedure Listeners_insert to rl_zap_customersr;
grant execute on procedure Listeners_delete to rl_zap_customersr;
grant execute on procedure List_contracts_update to rl_zap_customersr;
grant execute on procedure List_contracts_insert to rl_zap_customersr;
grant execute on procedure List_contracts_delete to rl_zap_customersr;
grant execute on procedure Schedule_update to rl_zap_customersr;
grant execute on procedure Schedule_insert to rl_zap_customersr;
grant execute on procedure Schedule_delete to rl_zap_customersr;
grant execute on procedure Training_programs_delete to rl_zap_administrator;
grant execute on procedure Program_modules_delete to rl_zap_administrator;
grant execute on procedure Modules_delete to rl_zap_administrator;
grant execute on procedure Employees_update to rl_zap_administrator;
grant execute on procedure Employees_insert to rl_zap_administrator;
grant execute on procedure Employees_delete to rl_zap_administrator;
grant execute on procedure Modules_Skills_delete to rl_zap_administrator;
grant execute on procedure Skills_update to rl_zap_administrator;
grant execute on procedure Skills_insert to rl_zap_administrator;
grant execute on procedure Skills_delete to rl_zap_administrator;
grant execute on procedure Module_technologies_delete to rl_zap_administrator;
grant execute on procedure Technologies_update to rl_zap_administrator;
grant execute on procedure Technologies_insert to rl_zap_administrator;
grant execute on procedure Technologies_delete to rl_zap_administrator;
grant execute on procedure Module_Topics_delete to rl_zap_administrator;
grant execute on procedure Topics_update to rl_zap_administrator;
grant execute on procedure Topics_insert to rl_zap_administrator;
grant execute on procedure Topics_delete to rl_zap_administrator;
grant execute on procedure Format_Topics_delete to rl_zap_administrator;
grant execute on procedure Training_status_delete to rl_zap_administrator;
grant execute on procedure Distrib_delete to rl_zap_administrator;
grant execute on procedure Study_Group_delete to rl_zap_administrator;
grant execute on procedure Listeners_delete to rl_zap_administrator;
grant execute on procedure List_contracts_delete to rl_zap_administrator;
grant execute on procedure Training_format_delete to rl_zap_administrator;
grant execute on procedure Schedule_delete to rl_zap_administrator;
