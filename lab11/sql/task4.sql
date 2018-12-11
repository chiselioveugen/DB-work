RESTORE DATABASE univer_restore
FROM DISK = 'D:\UNIVERSITATE\DB-work\lab11\files\device1_task1.bak'
WITH MOVE 'universitatea' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\univer_restore',
MOVE 'universitatea_File2' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\univer_restore_File2',
MOVE 'universitatea_File3' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\univer_restore_File3',
MOVE 'universitatea_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\univer_restore_log.ldf',
NORECOVERY
GO

RESTORE DATABASE univer_restore
FROM DISK = 'D:\UNIVERSITATE\DB-work\lab11\files\device2_task2.bak'
WITH NORECOVERY
GO

RESTORE LOG univer_restore
FROM DISK = 'D:\UNIVERSITATE\DB-work\lab11\files\task3.bak'
WITH NORECOVERY