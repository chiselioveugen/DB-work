RESTORE DATABASE univer_restore
FROM DISK = 'D:\UNIVERSITATE\DB-work\lab11\files\device1_task1.bak'
WITH MOVE 'universitatea' TO 'D:\UNIVERSITATE\DB\Data\universitatea_f1',
MOVE 'universitatea_File2' TO 'D:\UNIVERSITATE\DB\Data\universitatea_f2',
MOVE 'universitatea_File3' TO 'D:\UNIVERSITATE\DB\Data\universitatea_f3',
MOVE 'universitatea_log' TO 'D:\UNIVERSITATE\DB\SQL-logs\universitatea_f4.ldf',
NORECOVERY
GO

RESTORE DATABASE univer_restore
FROM DISK = 'D:\UNIVERSITATE\DB-work\lab11\files\device2_task2.bak'
WITH NORECOVERY
GO

RESTORE LOG univer_restore
FROM DISK = 'D:\UNIVERSITATE\DB-work\lab11\files\task3.bak'
WITH NORECOVERY