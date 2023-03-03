USE [hacker_rank]
GO

/****** Object:  Table [dbo].[hackerranklog]    Script Date: 2/20/2023 10:43:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hackerranklog]') AND type in (N'U'))
DROP TABLE [dbo].[hackerranklog]
GO

/****** Object:  Table [dbo].[hackerranklog]    Script Date: 2/20/2023 10:43:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hackerranklog](
	[logid] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[exercise] [int] NOT NULL,
	[level] [varchar](10) NOT NULL,
	[type] [varchar](20) NOT NULL,
	[username] [varchar](34) NOT NULL,
	[points] [smallint] NOT NULL,
	[duration] [smallint] NOT NULL,
	[result] [varchar](20) NOT NULL,
 CONSTRAINT [PK_hackerranklog] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


DECLARE @AMOUNT_OF_RECORDS INT
DECLARE @PostTime DATETIME
DECLARE @Exercise_Number INT
DECLARE @Points INTEGER

SET @AMOUNT_OF_RECORDS = 25000

WHILE @AMOUNT_OF_RECORDS>0 BEGIN
	SET @PostTime = DATEADD(dd, ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%1345*-1, GETDATE())
	SET @Exercise_Number = ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%100+1
	SET @Points = 65+ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%35+1

	INSERT INTO dbo.hackerranklog (posttime, exercise, [level], [type], username, points, duration, result)
	SELECT @PostTime, @Exercise_Number, 
	CASE WHEN @Exercise_Number<34 THEN 'Basic'
		 WHEN @Exercise_Number>33 and @Exercise_Number<64 THEN 'Medium'
		 WHEN @Exercise_Number>63 THEN 'Advance'
	END,
	CASE WHEN @Exercise_Number%2=0 THEN 'Divide and Conquer'
		 WHEN @Exercise_Number%3=0 THEN 'Hashing'
		 WHEN @Exercise_Number%5=0 THEN 'Sorting'
		 ELSE 'Decision tree'
	END, 
	CONCAT('User_', CONVERT(VARCHAR,ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%1315) ,'_'),
	@Points,
	20+ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%40,
	CASE WHEN @Points<85 THEN 'Failed' ELSE 'Approved' END

	SET @AMOUNT_OF_RECORDS = @AMOUNT_OF_RECORDS - 1
END
GO
USE [hacker_rank]
GO

/****** Object:  Table [dbo].[hackerranklog]    Script Date: 2/20/2023 10:43:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hackerranklog]') AND type in (N'U'))
DROP TABLE [dbo].[hackerranklog]
GO

/****** Object:  Table [dbo].[hackerranklog]    Script Date: 2/20/2023 10:43:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hackerranklog](
	[logid] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[exercise] [int] NOT NULL,
	[level] [varchar](10) NOT NULL,
	[type] [varchar](20) NOT NULL,
	[username] [varchar](34) NOT NULL,
	[points] [smallint] NOT NULL,
	[duration] [smallint] NOT NULL,
	[result] [varchar](20) NOT NULL,
 CONSTRAINT [PK_hackerranklog] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


DECLARE @AMOUNT_OF_RECORDS INT
DECLARE @PostTime DATETIME
DECLARE @Exercise_Number INT
DECLARE @Points INTEGER

SET @AMOUNT_OF_RECORDS = 25000

WHILE @AMOUNT_OF_RECORDS>0 BEGIN
	SET @PostTime = DATEADD(dd, ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%1345*-1, GETDATE())
	SET @Exercise_Number = ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%100+1
	SET @Points = 65+ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%35+1

	INSERT INTO dbo.hackerranklog (posttime, exercise, [level], [type], username, points, duration, result)
	SELECT @PostTime, @Exercise_Number, 
	CASE WHEN @Exercise_Number<34 THEN 'Basic'
		 WHEN @Exercise_Number>33 and @Exercise_Number<64 THEN 'Medium'
		 WHEN @Exercise_Number>63 THEN 'Advance'
	END,
	CASE WHEN @Exercise_Number%2=0 THEN 'Divide and Conquer'
		 WHEN @Exercise_Number%3=0 THEN 'Hashing'
		 WHEN @Exercise_Number%5=0 THEN 'Sorting'
		 ELSE 'Decision tree'
	END, 
	CONCAT('User_', CONVERT(VARCHAR,ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%1315) ,'_'),
	@Points,
	20+ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT))%40,
	CASE WHEN @Points<85 THEN 'Failed' ELSE 'Approved' END

	SET @AMOUNT_OF_RECORDS = @AMOUNT_OF_RECORDS - 1
END
GO
