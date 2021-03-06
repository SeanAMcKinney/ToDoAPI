/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroceryItems]') AND type in (N'U'))
ALTER TABLE [dbo].[GroceryItems] DROP CONSTRAINT IF EXISTS [FK_GroceryItems_Categories]
GO
/****** Object:  Table [dbo].[GroceryItems]    Script Date: 4/8/2022 2:36:37 PM ******/
DROP TABLE IF EXISTS [dbo].[GroceryItems]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/8/2022 2:36:37 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/8/2022 2:36:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GroceryItems]    Script Date: 4/8/2022 2:36:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroceryItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroceryItems](
	[GroceryItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_GroceryItems_1] PRIMARY KEY CLUSTERED 
(
	[GroceryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [DepartmentName]) VALUES (1, N'Produce')
INSERT [dbo].[Categories] ([CategoryId], [DepartmentName]) VALUES (2, N'Bread')
INSERT [dbo].[Categories] ([CategoryId], [DepartmentName]) VALUES (1002, N'Dairy')
INSERT [dbo].[Categories] ([CategoryId], [DepartmentName]) VALUES (1003, N'Meat')
INSERT [dbo].[Categories] ([CategoryId], [DepartmentName]) VALUES (1004, N'PetFood')
INSERT [dbo].[Categories] ([CategoryId], [DepartmentName]) VALUES (1005, N'Personal Items')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[GroceryItems] ON 

INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (1, N'Apple', NULL, 1)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (2, N'Bananas', NULL, 1)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (3, N'Avocado', N'Slightly to Quite Squishy', 1)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (4, N'Mushrooms', NULL, 1)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (5, N'Bread', NULL, 2)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (7, N'Brats', NULL, 1003)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (8, N'CatFood', NULL, 1004)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (9, N'Milk', NULL, 1002)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (10, N'CottageCheese', NULL, 1002)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (11, N'Cat Fish', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (12, N'Grapes', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (13, N'Grapes', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (14, N'Kiwi', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (15, N'Kiwi', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (16, N'Meatballs', N'16 per package for spaghetti  ', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (17, N'Meatballs', N'16 per package for spaghetti  ', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (18, N'Tooth Brush', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (19, N'Test', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (20, N'Test', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (21, N'test 2', N'', NULL)
INSERT [dbo].[GroceryItems] ([GroceryItemId], [Name], [Description], [CategoryId]) VALUES (22, N'test 3', N'', NULL)
SET IDENTITY_INSERT [dbo].[GroceryItems] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroceryItems_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroceryItems]'))
ALTER TABLE [dbo].[GroceryItems]  WITH CHECK ADD  CONSTRAINT [FK_GroceryItems_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroceryItems_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroceryItems]'))
ALTER TABLE [dbo].[GroceryItems] CHECK CONSTRAINT [FK_GroceryItems_Categories]
GO
