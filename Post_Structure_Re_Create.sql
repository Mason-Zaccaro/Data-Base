create or replace procedure Structure_Re_Create ()
language plpgsql
as $$
	begin
REVOKE SELECT, INSERT, UPDATE, DELETE ON Training_programs FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Training_programs_id_training_programs_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Program_modules FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Program_modules_id_program_modules_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Modules FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE modules_id_modules_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Modules_Skills FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Modules_Skills_id_Modules_Skills_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Module_technologies FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Module_technologies_id_Module_technologies_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Module_Topics FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Module_Topics_id_Module_Topics_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Distrib FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Distrib_id_Distrib_seq FROM rl_zap_directorc;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Training_format FROM rl_zap_directorc;
REVOKE USAGE, SELECT ON SEQUENCE Training_format_id_Training_format_seq FROM rl_zap_directorc;
REVOKE SELECT ON Employees FROM rl_zap_directorc;
REVOKE SELECT ON Study_Group FROM rl_zap_directorc;
REVOKE SELECT ON Schedule FROM rl_zap_directorc;

REVOKE SELECT, INSERT, UPDATE, DELETE ON Training_status FROM rl_zap_customersr;
REVOKE USAGE, SELECT ON SEQUENCE Training_status_id_Training_status_seq FROM rl_zap_customersr;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Study_Group FROM rl_zap_customersr;
REVOKE USAGE, SELECT ON SEQUENCE Study_Group_id_Study_Group_seq FROM rl_zap_customersr;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Listeners FROM rl_zap_customersr;
REVOKE USAGE, SELECT ON SEQUENCE Listeners_id_Listeners_seq FROM rl_zap_customersr;
REVOKE SELECT, INSERT, UPDATE, DELETE ON List_contracts FROM rl_zap_customersr;
REVOKE USAGE, SELECT ON SEQUENCE List_contracts_id_List_contracts_seq FROM rl_zap_customersr;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Schedule FROM rl_zap_customersr;
REVOKE USAGE, SELECT ON SEQUENCE Schedule_id_Schedule_seq FROM rl_zap_customersr;
REVOKE SELECT ON Training_programs FROM rl_zap_customersr;
REVOKE SELECT ON Program_modules FROM rl_zap_customersr;
REVOKE SELECT ON Modules FROM rl_zap_customersr;
REVOKE SELECT ON Modules_Skills FROM rl_zap_customersr;
REVOKE SELECT ON Skills FROM rl_zap_customersr;
REVOKE SELECT ON Module_technologies FROM rl_zap_customersr;
REVOKE SELECT ON Technologies FROM rl_zap_customersr;
REVOKE SELECT ON Module_Topics FROM rl_zap_customersr;
REVOKE SELECT ON Topics FROM rl_zap_customersr;
REVOKE SELECT ON Format_Topics FROM rl_zap_customersr;
REVOKE SELECT ON Distrib FROM rl_zap_customersr;
REVOKE SELECT ON Training_format FROM rl_zap_customersr;

REVOKE SELECT ON Training_programs FROM rl_zap_teacher;
REVOKE SELECT ON Program_modules FROM rl_zap_teacher;
REVOKE SELECT ON Modules FROM rl_zap_teacher;
REVOKE SELECT ON Modules_Skills FROM rl_zap_teacher;
REVOKE SELECT ON Skills FROM rl_zap_teacher;
REVOKE SELECT ON Module_technologies FROM rl_zap_teacher;
REVOKE SELECT ON Technologies FROM rl_zap_teacher;
REVOKE SELECT ON Module_Topics FROM rl_zap_teacher;
REVOKE SELECT ON Topics FROM rl_zap_teacher;
REVOKE SELECT ON Format_Topics FROM rl_zap_teacher;
REVOKE SELECT ON Training_status FROM rl_zap_teacher;
REVOKE SELECT ON Distrib FROM rl_zap_teacher;
REVOKE SELECT ON Study_Group FROM rl_zap_teacher;
REVOKE SELECT ON Training_format FROM rl_zap_teacher;
REVOKE SELECT ON Schedule FROM rl_zap_teacher;

REVOKE SELECT ON Training_programs FROM rl_zap_listener;
REVOKE SELECT ON Program_modules FROM rl_zap_listener;
REVOKE SELECT ON Modules FROM rl_zap_listener;
REVOKE SELECT ON Modules_Skills FROM rl_zap_listener;
REVOKE SELECT ON Skills FROM rl_zap_listener;
REVOKE SELECT ON Module_technologies FROM rl_zap_listener;
REVOKE SELECT ON Technologies FROM rl_zap_listener;
REVOKE SELECT ON Module_Topics FROM rl_zap_listener;
REVOKE SELECT ON Topics FROM rl_zap_listener;
REVOKE SELECT ON Format_Topics FROM rl_zap_listener;
REVOKE SELECT ON Study_Group FROM rl_zap_listener;
REVOKE SELECT ON Training_format FROM rl_zap_listener;
REVOKE SELECT ON Schedule FROM rl_zap_listener;

REVOKE SELECT, INSERT, UPDATE, DELETE ON Employees FROM rl_zap_administrator;
REVOKE USAGE, SELECT ON SEQUENCE Employees_id_Employees_seq FROM rl_zap_administrator;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Skills FROM rl_zap_administrator;
REVOKE USAGE, SELECT ON SEQUENCE Employees_id_Employees_seq FROM rl_zap_administrator;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Technologies FROM rl_zap_administrator;
REVOKE USAGE, SELECT ON SEQUENCE Skills_id_Skills_seq FROM rl_zap_administrator;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Topics FROM rl_zap_administrator;
REVOKE USAGE, SELECT ON SEQUENCE Topics_id_Topics_seq FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Training_programs FROM rl_zap_administrator;
REVOKE USAGE, SELECT ON SEQUENCE Training_programs_id_Training_programs_seq FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Program_modules FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Modules FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Modules_Skills FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Module_technologies FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Module_Topics FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Format_Topics FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Training_status FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Distrib FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Study_Group FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Listeners FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON List_contracts FROM rl_zap_administrator;
REVOKE SELECT, DELETE ON Schedule FROM rl_zap_administrator;

-- Удаление существующих индексов
    DROP INDEX IF EXISTS index_ID_Training_programs;
    DROP INDEX IF EXISTS index_Name_Training_programs;
    DROP INDEX IF EXISTS index_Prefix_Training_programs;
    DROP INDEX IF EXISTS index_Direction_Training_programs;
    DROP INDEX IF EXISTS index_Name_qualification_Training_programs;
    DROP INDEX IF EXISTS index_ID_Program_modules;
    DROP INDEX IF EXISTS index_ID_modules;
    DROP INDEX IF EXISTS index_Prefix_modules;
    DROP INDEX IF EXISTS index_ID_Employees;
    DROP INDEX IF EXISTS index_Middle_name_Employees;
    DROP INDEX IF EXISTS index_Name_post_Employees;
    DROP INDEX IF EXISTS index_Login_Employees;
    DROP INDEX IF EXISTS index_Password_Employees;
    DROP INDEX IF EXISTS index_ID_Distrib;
    DROP INDEX IF EXISTS index_ID_Modules_Skills;
    DROP INDEX IF EXISTS index_ID_Skills;
    DROP INDEX IF EXISTS index_Name_Skills;
    DROP INDEX IF EXISTS index_ID_Module_technologies;
    DROP INDEX IF EXISTS index_ID_Technologies;
    DROP INDEX IF EXISTS index_Name_Technologies;
    DROP INDEX IF EXISTS index_ID_Module_Topics;
    DROP INDEX IF EXISTS index_ID_Topics;
    DROP INDEX IF EXISTS index_Name_Topics;
    DROP INDEX IF EXISTS index_ID_Format_Topics;
    DROP INDEX IF EXISTS index_Type_Format_Topics;
    DROP INDEX IF EXISTS index_ID_Training_status;
    DROP INDEX IF EXISTS index_Type_Status;
    DROP INDEX IF EXISTS index_ID_Study_Group;
    DROP INDEX IF EXISTS index_Num_St_Grp;
    DROP INDEX IF EXISTS index_ID_Listeners;
    DROP INDEX IF EXISTS index_Passport_num_Listeners;
    DROP INDEX IF EXISTS index_Birthday_Listeners;
    DROP INDEX IF EXISTS index_Issued_whom_when_Listeners;
    DROP INDEX IF EXISTS index_Unit_code_Listeners_Listeners;
    DROP INDEX IF EXISTS index_Adress_Listeners;
    DROP INDEX IF EXISTS index_Email_Listeners;
    DROP INDEX IF EXISTS index_SNILS_Listeners;
    DROP INDEX IF EXISTS index_Login_Listeners;
    DROP INDEX IF EXISTS index_ID_List_contracts;
    DROP INDEX IF EXISTS index_Num_List_contracts;
    DROP INDEX IF EXISTS index_Date_conclusion_List_contracts;
    DROP INDEX IF EXISTS index_ID_Training_format;
    DROP INDEX IF EXISTS index_Type_training_training_format;
    DROP INDEX IF EXISTS index_ID_Schedule;
    DROP INDEX IF EXISTS index_D_W_Schedule;
    DROP INDEX IF EXISTS index_T_F_Schedule;
    DROP INDEX IF EXISTS index_T_S_B_Schedule;
    DROP INDEX IF EXISTS index_T_F_B_Schedule;

    -- Удаление существующих таблиц
	DROP TABLE IF EXISTS Schedule;
	DROP TABLE IF EXISTS Training_format;
	DROP TABLE IF EXISTS List_contracts;
	DROP TABLE IF EXISTS Listeners;
	DROP TABLE IF EXISTS Study_Group;
	DROP TABLE IF EXISTS Training_status;
	DROP TABLE IF EXISTS Distrib;
	DROP TABLE IF EXISTS Employees;
	DROP TABLE IF EXISTS Module_Topics;
    DROP TABLE IF EXISTS Module_technologies;
    DROP TABLE IF EXISTS Modules_Skills;
	DROP TABLE IF EXISTS Topics;
	DROP TABLE IF EXISTS Technologies;
	DROP TABLE IF EXISTS Skills;
	DROP TABLE IF EXISTS Format_topics;
    DROP TABLE IF EXISTS Program_modules;
    DROP TABLE IF EXISTS Modules;
    DROP TABLE IF EXISTS Training_programs;
Call Structure_Create ();
	end;
$$;