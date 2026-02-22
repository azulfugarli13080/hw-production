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
I had to migrate a university database from old structure to new structure ,so the problem that some activities are listed twice for the same student also column lengths are too short,null value 
so how i solved this problem  i wrote migration code and rollback code ,Before the migration, the ACTIVITIES table had 9 rows and there was like some duplicates in it. Student 1 had 4 activities but one was repeated, Student 2 had 2 activities, and Student 3 had 3, again one duplicate.
After migration the table got cleaned and now only 3 rows, one for each student. No duplicates anymore but all data still there. Student 1 has Chemistry, Literature, Tennis with levels Beginner, Beginner, Advanced. Student 2 has Football, Tennis both Beginner, and Student 3 has Chess, Music with Beginner and Advanced.
Also after migration i use rollback because first for safety if migration fails in the middle rollback just fix everything in one command so nothing lost. Then for testingi i can run migration check rollback fix stuff and try again without breaking anything ,also for mistakes if i delete something by accident rollback bring everything back.
