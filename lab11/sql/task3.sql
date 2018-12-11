EXEC sp_addumpdevice 'DISK','backup_Log', 'D:\UNIVERSITATE\DB-work\lab11\files\task3.bak'
GO
BACKUP LOG universitatea
TO backup_Log
GO