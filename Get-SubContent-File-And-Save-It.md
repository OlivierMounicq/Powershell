## Get a part of the file content and save file

Here, we want to extract only the content from line 4 to the end of the file and save it into a new file.  
And we perform this action on a set of file.

```ps1
PS E:\> Get-ChildItem *.sql |%{ return [pscustomobject] @{ FileName = $_.BaseName; Data = (Get-Content $_) } } | %{ return [pscustomobject] @{ FilePath = "E:\Date\2021.01.07\_tmp\DEV-Output\Tables2\" + $_.FileName + "-cleaned.sql"; Content =  $_.Data[3..($_.Data.Count-1)] } } | %{ $_.Content | Out-File -filepath $_.FilePath }
```

Or

```ps1
PS E:\> $inputDir = "E:\Date\2021.01.07\Company-DEV-DB\Tables\*.sql"; $outputDir = "E:\Date\2021.01.07\Company-DEV-DB-Cleaned\Tables\"; Get-ChildItem -Path $inputDir |%{ return [pscustomobject] @{ FileName = $_.BaseName; Data = (Get-Content $_) } } | %{ return [pscustomobject] @{ FilePath = $outputDir + $_.FileName + "-cleaned.sql"; Content =  $_.Data[3..($_.Data.Count-1)] } } | %{ $_.Content | Out-File -filepath $_.FilePath }
```

E.g: 
- an input file

```sql
USE [Company.Client]
GO
/****** Object:  Table [dbo].[Apporteur]    Script Date: 07/01/2021 09:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apporteur](
	[Id] [uniqueidentifier] NOT NULL,
	[IdBabo] [bigint] NOT NULL,
	[Numero] [int] NOT NULL,
	[Libelle] [nvarchar](200) NOT NULL,
	[IdTypeApporteur] [int] NOT NULL,
	[HasLogo] [bit] NULL,
	[Actif] [bit] NOT NULL,
	[LogoExtension] [nvarchar](10) NULL,
 CONSTRAINT [PK_Apporteur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apporteur] ADD  CONSTRAINT [DF_Apporteur_Actif]  DEFAULT ((1)) FOR [Actif]
GO
ALTER TABLE [dbo].[Apporteur]  WITH CHECK ADD  CONSTRAINT [FK_Apporteur_TypeApporteur] FOREIGN KEY([IdTypeApporteur])
REFERENCES [dbo].[TypeApporteur] ([Id])
GO
ALTER TABLE [dbo].[Apporteur] CHECK CONSTRAINT [FK_Apporteur_TypeApporteur]
GO
```


- the output file 

```sql
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apporteur](
	[Id] [uniqueidentifier] NOT NULL,
	[IdBabo] [bigint] NOT NULL,
	[Numero] [int] NOT NULL,
	[Libelle] [nvarchar](200) NOT NULL,
	[IdTypeApporteur] [int] NOT NULL,
	[HasLogo] [bit] NULL,
	[Actif] [bit] NOT NULL,
	[LogoExtension] [nvarchar](10) NULL,
 CONSTRAINT [PK_Apporteur] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apporteur] ADD  CONSTRAINT [DF_Apporteur_Actif]  DEFAULT ((1)) FOR [Actif]
GO
ALTER TABLE [dbo].[Apporteur]  WITH CHECK ADD  CONSTRAINT [FK_Apporteur_TypeApporteur] FOREIGN KEY([IdTypeApporteur])
REFERENCES [dbo].[TypeApporteur] ([Id])
GO
ALTER TABLE [dbo].[Apporteur] CHECK CONSTRAINT [FK_Apporteur_TypeApporteur]
GO
```
