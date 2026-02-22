A1 - Database Migration 

For assigment i use PostgreSQL in my terminal 
i have database course that why i will use this server 
1. Connect to Server :ssh azulfugarli13080@192.168.33.55
2. then the password of my Linux account i wrote
3. Open PostgreSQL 
psql -d postgres
4.create table from sample data 
5.for Run migration i use \i migration.sql 
6.run rollback i use \i rollback.sql
7.for view data i use SELECT * FROM ACTIVITIES;

So I created two SQL files on the server
migration.sql - Contains the migration code
rollback.sql - Contains the rollback code
I had to migrate a university database from old structure to new structure ,so the problem that some activities are listed twice for the same student.
