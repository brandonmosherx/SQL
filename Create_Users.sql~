SPOOL /home/oracle/Logs/LOG_CREATE_USERS.lst

     /*  
     Script Name: Create_Users.sql
	 Log File Log_Create_Users.lst
	 Purpose: Script that creates users.
	 Author: Brandon Mosher
	 Date: 1/18/2017
     */ 



     /*  
		This part of the script pertains to certain SET parameters. 
		The ones that I set are more related to the visual output, 
		in order to make it look neater.
     */ 

	 SET SERVEROUTPUT ON

	SET ECHO ON

	 -- Spool'n to a file.
	 
	 -- Removes trailing spaces when data is spooled out.
	 
	 SET TRIMSPOOL ON
	 
	 -- Sets the Linesize to be 100, I find that it makes things a bit neater based off terminal size.
	 
	 SET LINESIZE  100
	
	 -- Shows the number of records returned during a select statement.

	 SET FEEDBACK ON
	 
	 -- Sets pagesize to 2000, which intentionally prints column headers every certain amount of lines.
	
	SET PAGESIZE 2000
	
	-- Formats whitespace differenty.
	
	SET TAB OFF
	
	WHENEVER OSERROR  EXIT 9  -- Traps OS errors.
	 
	WHENEVER SQLERROR EXIT SQL.SQLCODE -- Traps SQL related errors.
	
	
     /*  
		This part of the script pertains to User Creation, 
		and granting them resources to their own tables.
		Three users in total: DATA_BCK, DATADW, and DATA_ERD and of course, BRANDON.
     */ 
	 
	-- Data backup account.
	
	CREATE USER DATA_BCK IDENTIFIED BY D4TABackup;
	GRANT CONNECT TO DATA_BCK;
	GRANT CONNECT, RESOURCE, DBA TO DATA_BCK;
	
	-- Data warehouse account.
	
	CREATE USER DATADW IDENTIFIED BY D4TADw;
	GRANT CONNECT TO DATADW;
	GRANT CONNECT, RESOURCE, DBA TO DATADW;

	-- ERD Account.
	
	CREATE USER DATA_ERD IDENTIFIED BY D4TAErd;
	GRANT CONNECT TO DATA_ERD;
	GRANT CONNECT, RESOURCE, DBA TO DATA_ERD;

	
	-- Moi.
	
	CREATE USER BRANDON IDENTIFIED BY P4ssw0rd;
	GRANT CONNECT TO BRANDON;
	GRANT CONNECT, RESOURCE, DBA TO BRANDON;
	
-- Validation of the users.

	SELECT * FROM ALL_USERS WHERE USERNAME = 'DATA_BCK';
	SELECT * FROM ALL_USERS WHERE USERNAME = 'DATADW';
	SELECT * FROM ALL_USERS WHERE USERNAME = 'DATA_ERD';
	SELECT * FROM ALL_USERS WHERE USERNAME = 'BRANDON';


SPOOL OFF
