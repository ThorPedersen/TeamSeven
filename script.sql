USE [Team7]
GO
/****** Object:  Table [dbo].[jobdocumentation]    Script Date: 13-03-2015 22:55:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobdocumentation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [int] NOT NULL,
	[headline] [text] NOT NULL,
	[description] [text] NOT NULL,
	[date] [date] NOT NULL,
	[timespent] [int] NOT NULL,
	[supporter] [int] NOT NULL,
 CONSTRAINT [PK_jobdocumentation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[supporter]    Script Date: 13-03-2015 22:55:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supporter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NOT NULL,
	[initials] [text] NOT NULL,
 CONSTRAINT [PK_supporter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[type]    Script Date: 13-03-2015 22:55:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NOT NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[jobdocumentation] ON 

INSERT [dbo].[jobdocumentation] ([id], [type], [headline], [description], [date], [timespent], [supporter]) VALUES (1, 1, N'opdatering af server 2', N'installeret patch 32.132', CAST(0xB4390B00 AS Date), 2, 2)
SET IDENTITY_INSERT [dbo].[jobdocumentation] OFF
SET IDENTITY_INSERT [dbo].[supporter] ON 

INSERT [dbo].[supporter] ([id], [name], [initials]) VALUES (1, N'Hans', N'HC')
INSERT [dbo].[supporter] ([id], [name], [initials]) VALUES (2, N'Peter ', N'PN')
INSERT [dbo].[supporter] ([id], [name], [initials]) VALUES (3, N'Martin', N'MK')
INSERT [dbo].[supporter] ([id], [name], [initials]) VALUES (4, N'Thor', N'TP')
SET IDENTITY_INSERT [dbo].[supporter] OFF
SET IDENTITY_INSERT [dbo].[type] ON 

INSERT [dbo].[type] ([id], [name]) VALUES (1, N'Hardware')
INSERT [dbo].[type] ([id], [name]) VALUES (2, N'Software')
INSERT [dbo].[type] ([id], [name]) VALUES (3, N'Andet')
SET IDENTITY_INSERT [dbo].[type] OFF
ALTER TABLE [dbo].[jobdocumentation]  WITH CHECK ADD  CONSTRAINT [FK_jobdocumentation_supporter] FOREIGN KEY([supporter])
REFERENCES [dbo].[supporter] ([id])
GO
ALTER TABLE [dbo].[jobdocumentation] CHECK CONSTRAINT [FK_jobdocumentation_supporter]
GO
ALTER TABLE [dbo].[jobdocumentation]  WITH CHECK ADD  CONSTRAINT [FK_jobdocumentation_type] FOREIGN KEY([type])
REFERENCES [dbo].[type] ([id])
GO
ALTER TABLE [dbo].[jobdocumentation] CHECK CONSTRAINT [FK_jobdocumentation_type]
GO
