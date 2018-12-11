EXEC sp_addumpdevice 'DISK', 'device1', 'D:\UNIVERSITATE\DB-work\lab11\files\device1_task1.bak'
GO
BACKUP DATABASE universitatea
TO device1 
WITH FORMAT,
NAME = N'universitatea- Full Database Backup'
GO