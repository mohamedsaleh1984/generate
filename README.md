### Generator
Simple assesmbly to generate random numbers, guid and use generated DLL in T-SQL

#### Complie
1. Complie
   ```csc.exe /t:library /out:Generate.dll ./Generator/*.cs```
2. Copy Generate.dll to Path 'C:\DLLs\Generator'
3. Run sql/sql.sql in MSSMS


#### Usage

```Select dbo.GenerateGUID() as GUID```
```Select dbo.GenerateRandomNumber() as RandomNumber```
