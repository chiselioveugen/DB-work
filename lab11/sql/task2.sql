EXEC sp_addumpdevice 'DISK', 'device2', 'D:\UNIVERSITATE\DB-work\lab11\files\device2_task2.bak'
GO
BACKUP DATABASE universitatea
TO device2 
WITH FORMAT,
NAME = N'universitatea- Differential Database Backup'
GO