USE [TravelApp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Avatar] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[PhoneNumber] [int] NULL,
	[Password] [nvarchar](200) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillBooking]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillBooking](
	[BillBookID] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[Booker] [nvarchar](200) NULL,
	[Phone] [int] NULL,
	[NumPeople] [int] NULL,
	[DepartureSchedule] [date] NULL,
	[Total] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_BillBooking] PRIMARY KEY CLUSTERED 
(
	[BillBookID] ASC,
	[TourID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[NameLocation] [nvarchar](200) NULL,
	[NationID] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarkTour]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkTour](
	[AccountID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_MarkTour] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nation]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nation](
	[NationID] [int] IDENTITY(1,1) NOT NULL,
	[NameNation] [nvarchar](200) NULL,
 CONSTRAINT [PK_Nation] PRIMARY KEY CLUSTERED 
(
	[NationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouristAttraction]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouristAttraction](
	[TourID] [int] IDENTITY(1,1) NOT NULL,
	[NameTour] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NULL,
	[Price] [int] NULL,
	[Star] [int] NULL,
	[PlaceView] [int] NULL,
	[ContentTour] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
 CONSTRAINT [PK_TouristAttraction] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (1, N'Dinh Ngoc Hung', N'avatar1.jpg', N'hung@gmail.com', 327359501, N'123456')
INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (2, N'Dinh Quang Hiep', N'avatar2.jpg', N'hiep@gmail.com', 946557238, N'123456')
INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (3, N'Nguyen Van Son', N'avatar3.jpg', N'son@gmail.com', 121234123, N'123456')
INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (4, N'Tran Van Thang', N'avatar4.jpg', N'thang@gmail.com', 943853256, N'123456')
INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (5, N'Dinh Duc Manh', N'', N'manh@gmail.com', 372485326, N'123')
INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (6, N'Quach Minh Chien', N'', N'chien@gmail.com', 812642537, N'123456')
INSERT [dbo].[Account] ([AccountID], [UserName], [Avatar], [Email], [PhoneNumber], [Password]) VALUES (7, N'Nguyen Quang Anh', N'', N'anh@gmail.com', 324689573, N'123')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[BillBooking] ON 

INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 1, N'Hung Nguyen', 754324019, 3, CAST(N'2024-02-18' AS Date), 50, NULL, NULL)
INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (2, 2, 1, N'Nguyen Son', 754324019, 3, CAST(N'2024-02-20' AS Date), 80, NULL, NULL)
INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (3, 1, 1, N'Nguyen Khoa', 754324019, 4, CAST(N'2024-02-21' AS Date), 80, NULL, NULL)
INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (4, 4, 1, N'Thang', 543426876, 3, CAST(N'2024-02-20' AS Date), 81, NULL, NULL)
INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (5, 3, 2, N'Nam', 234151234, 2, CAST(N'2024-02-21' AS Date), 65, NULL, NULL)
INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (6, 21, 7, N'Quang', 563284, 2, CAST(N'2024-02-23' AS Date), 126, NULL, NULL)
INSERT [dbo].[BillBooking] ([BillBookID], [TourID], [AccountID], [Booker], [Phone], [NumPeople], [DepartureSchedule], [Total], [CreatedDate], [UpdatedDate]) VALUES (7, 24, 1, N'Quang', 93248513, 6, CAST(N'2024-02-28' AS Date), 258, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BillBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (1, N'Washington, D.C.', 1)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (2, N'Tokyo', 2)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (3, N'HaNoi', 3)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (4, N'Seoul', 4)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (5, N'BacKinh', 5)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (6, N'Moskva', 6)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (7, N'Pari', 7)
INSERT [dbo].[Location] ([LocationID], [NameLocation], [NationID]) VALUES (8, N'Berlin', 8)
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 1)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 4)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 8)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 18)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 21)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 25)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (1, 27)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (2, 5)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (2, 8)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (2, 10)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (2, 16)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (2, 17)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (2, 25)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (3, 5)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (3, 6)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (3, 9)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (3, 13)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (3, 18)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (3, 20)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (4, 1)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (4, 2)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (4, 3)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (4, 5)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (4, 6)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (7, 4)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (7, 7)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (7, 11)
INSERT [dbo].[MarkTour] ([AccountID], [TourID]) VALUES (7, 19)
GO
SET IDENTITY_INSERT [dbo].[Nation] ON 

INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (1, N'USA')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (2, N'Japan')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (3, N'VietNam')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (4, N'Korea')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (5, N'China')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (6, N'
Russia')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (7, N'France')
INSERT [dbo].[Nation] ([NationID], [NameNation]) VALUES (8, N'Germany')
SET IDENTITY_INSERT [dbo].[Nation] OFF
GO
SET IDENTITY_INSERT [dbo].[TouristAttraction] ON 

INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (1, N'Go to Makilato', N'image1.jpg', 25, 5, 1, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (2, N'Wellcome to Hakina', N'image2.jpg', 36, 4, 1, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 2)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (3, N'Go to Kalima', N'image3.jpg', 28, 4, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 2)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (4, N'Go to Lasita', N'image4.jpg', 27, 5, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (5, N'Wellcome to Paru', N'image5.jpg', 37, 3, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 4)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (6, N'Wellcome to Rakino', N'image6.jpg', 35, 4, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (7, N'Go to Makina', N'image7.jpg', 27, 5, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (8, N'Wellcome to Hangk', N'image8.jpg', 33, 2, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 2)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (9, N'Wellcome to Seopa', N'image9.jpg', 23, 2, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 4)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (10, N'Go to Bangko', N'image10.jpg', 43, 3, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (11, N'Wellcome to Teorino', N'image11.jpg', 34, 5, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 7)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (12, N'Go to Notisa', N'image12.jpg', 33, 3, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 5)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (13, N'Go to Bilim', N'image13.jpg', 23, 2, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (14, N'Wellcome to Sokina', N'image14.jpg', 23, 5, 3, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 5)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (15, N'Go to Morina', N'image15.jpg', 44, 3, 1, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 2)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (16, N'Wellcome to Lasami', N'image16.jpg', 23, 4, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 3)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (17, N'Wellcome to Palora', N'image17.jpg', 12, 3, 1, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 7)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (18, N'Go to Keran', N'image18.jpg', 33, 5, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 2)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (19, N'Wellcome to Gengko', N'image19.jpg', 45, 5, 1, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (20, N'Go to Satifa', N'image20.jpg', 41, 4, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (21, N'Go to Yomibe', N'image21.jpg', 63, 3, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 3)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (22, N'Wellcome to Tasana', N'image22.jpg', 32, 5, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 6)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (23, N'Go to Konota', N'image23.jpg', 23, 2, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 3)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (24, N'Wellcome to Foyaku', N'image24.jpg', 43, 4, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 5)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (25, N'Go to Yaseo', N'image25.jpg', 52, 2, 2, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 6)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (26, N'Go to Hinmage', N'image26.jpg', 34, 3, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 1)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (27, N'Go to Abalas', N'image27.jpg', 22, 3, 4, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 6)
INSERT [dbo].[TouristAttraction] ([TourID], [NameTour], [Image], [Price], [Star], [PlaceView], [ContentTour], [LocationID]) VALUES (28, N'Wellcome to Satini', N'image28.jpg', 34, 4, 1, N'Located high in the Andes mountains of Peru, Machu Picchu is now believed to have been a sacred royal retreat for the Incan rulers. Built in the 15th century AD and abandoned less than a 100 years later, the remote site continues to amaze with its perfectly joined, mortarless, intricate stonework. Huge multi-ton blocks of stone are perfectly joined with each other, without the use of mortar or cement', 8)
SET IDENTITY_INSERT [dbo].[TouristAttraction] OFF
GO
ALTER TABLE [dbo].[BillBooking]  WITH CHECK ADD  CONSTRAINT [FK_BillBooking_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[BillBooking] CHECK CONSTRAINT [FK_BillBooking_Account]
GO
ALTER TABLE [dbo].[BillBooking]  WITH CHECK ADD  CONSTRAINT [FK_BillBooking_TouristAttraction] FOREIGN KEY([TourID])
REFERENCES [dbo].[TouristAttraction] ([TourID])
GO
ALTER TABLE [dbo].[BillBooking] CHECK CONSTRAINT [FK_BillBooking_TouristAttraction]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Nation] FOREIGN KEY([NationID])
REFERENCES [dbo].[Nation] ([NationID])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Nation]
GO
ALTER TABLE [dbo].[MarkTour]  WITH CHECK ADD  CONSTRAINT [FK_MarkTour_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[MarkTour] CHECK CONSTRAINT [FK_MarkTour_Account]
GO
ALTER TABLE [dbo].[MarkTour]  WITH CHECK ADD  CONSTRAINT [FK_MarkTour_TouristAttraction] FOREIGN KEY([TourID])
REFERENCES [dbo].[TouristAttraction] ([TourID])
GO
ALTER TABLE [dbo].[MarkTour] CHECK CONSTRAINT [FK_MarkTour_TouristAttraction]
GO
ALTER TABLE [dbo].[TouristAttraction]  WITH CHECK ADD  CONSTRAINT [FK_TouristAttraction_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[TouristAttraction] CHECK CONSTRAINT [FK_TouristAttraction_Location]
GO
/****** Object:  StoredProcedure [dbo].[AddAccount]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddAccount] (
	@userName NVARCHAR(200),
	@avatar NVARCHAR(200),
	@email NVARCHAR(200),
	@phoneNumber INT,
	@password NVARCHAR(200)
)
AS
BEGIN
	SET NOCOUNT ON;
		INSERT INTO Account(UserName, Avatar, Email, PhoneNumber, Password) 
		VALUES (@userName, @avatar, @email, @phoneNumber, @password);
		SELECT 1;  
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[CheckEmailAccount]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckEmailAccount] (
	@email nvarchar(100)
)
AS
BEGIN
	SET NOCOUNT ON;

		DECLARE @checkEmail INT
		SELECT @checkEmail = COUNT(*) FROM Account a WHERE a.Email = @email;

		IF @checkEmail > 0 
		BEGIN
			SELECT 1; -- đã có
		END
		ELSE
		BEGIN
			SELECT 0;  -- không có
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateBillTour]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateBillTour] (
	@tourID INT,
	@accountID INT,
	@booker NVARCHAR(200),
	@phone INT,
	@numPeople INT,
	@departureSchedule DATE,
	@total INT
)
AS
BEGIN
	SET NOCOUNT ON;
		INSERT INTO BillBooking (TourID,AccountID,Booker,Phone,NumPeople,DepartureSchedule,Total) 
		VALUES (@tourID,@accountID,@booker,@phone,@numPeople,@departureSchedule,@total)
		SELECT 1;
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAccount]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAccount]
AS
BEGIN
	SET NOCOUNT ON;
		SELECT * FROM Account;
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GetBillTourByID]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBillTourByID] (
	@accountID INT
)
AS
BEGIN
	SET NOCOUNT ON;
		SELECT b.BillBookID, b.AccountID, b.TourID, t.NameTour, b.Booker, b.Phone, b.NumPeople, b.DepartureSchedule, b.Total FROM BillBooking b 
		INNER JOIN TouristAttraction t ON t.TourID = b.TourID
		WHERE b.AccountID = @accountID
		ORDER BY b.BillBookID DESC
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GetByLogin]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByLogin] (
	@email nvarchar(200),
	@password nvarchar(200)
)
AS
BEGIN
	SET NOCOUNT ON;
		SELECT *
		FROM Account acc
		where acc.Email = @email and acc.Password = @password
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GetMarkTourById]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMarkTourById] (
	@idAcc INT
)
AS
BEGIN
	SET NOCOUNT ON;
		SELECT t.TourID, t.NameTour, t.Image, t.Price, t.Star, t.PlaceView, t.ContentTour, t.LocationID, l.NameLocation, n.NameNation FROM TouristAttraction t
		INNER JOIN Location l ON l.LocationID = t.LocationID
		INNER JOIN Nation n ON n.NationID = l.NationID
		INNER JOIN MarkTour m ON m.AccountID = @idAcc
		WHERE t.TourID = m.TourID
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTouristAttractionRandom]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTouristAttractionRandom]
AS
BEGIN
	SET NOCOUNT ON;
		SELECT TOP 5 t.TourID, t.NameTour, t.Image, t.Price, t.Star, t.PlaceView, t.ContentTour, t.LocationID, l.NameLocation, n.NameNation FROM TouristAttraction t
		INNER JOIN Location l ON l.LocationID = t.LocationID
		INNER JOIN Nation n ON n.NationID = l.NationID
		ORDER BY NEWID()
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTouristAttractionStar]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTouristAttractionStar]
AS
BEGIN
	SET NOCOUNT ON;
		SELECT TOP 10 t.TourID, t.NameTour, t.Image, t.Price, t.Star, t.PlaceView, t.ContentTour, t.LocationID, l.NameLocation, n.NameNation FROM TouristAttraction t
		INNER JOIN Location l ON l.LocationID = t.LocationID
		INNER JOIN Nation n ON n.NationID = l.NationID
		ORDER BY Star DESC;
    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[HandleMarkTourById]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HandleMarkTourById] (
	@idAcc INT,
	@idTour INT,
	@typeUpdate INT
)
AS
BEGIN
	SET NOCOUNT ON;

		IF @typeUpdate = 1
		BEGIN
			INSERT INTO MarkTour (AccountID,TourID) VALUES (@idAcc,@idTour);
			SELECT 1;
		END
		ELSE IF @typeUpdate =2 
		BEGIN
			DELETE FROM MarkTour WHERE AccountID = @idAcc AND TourID = @idTour;
			SELECT 2;
		END
		ELSE
		BEGIN
			SELECT 3;
		END

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SearchTouristAttraction]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SearchTouristAttraction] (
	@keyword nvarchar(100),
	@placeView INT
)
AS
BEGIN
SET NOCOUNT ON;

	SELECT t.TourID, t.NameTour, t.Image, t.Price, t.Star, t.PlaceView, t.ContentTour, t.LocationID, l.NameLocation, n.NameNation FROM TouristAttraction t
	INNER JOIN Location l ON l.LocationID = t.LocationID
	INNER JOIN Nation n ON n.NationID = l.NationID
	WHERE 1 = 1 
	and (@keyword IS NULL OR t.NameTour LIKE CONCAT('%',@keyword,'%') OR n.NameNation LIKE CONCAT('%',@keyword,'%')) 
	and (@placeView is null or t.PlaceView = @placeView)
	ORDER BY t.NameTour ASC

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePasswordAccount]    Script Date: 2/22/2024 11:28:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePasswordAccount] (
	@email NVARCHAR(200),
	@password NVARCHAR(200)
)
AS
BEGIN
	SET NOCOUNT ON;
		UPDATE Account
		SET Password = @password
		WHERE Email = @email
		SELECT 1;
	SET NOCOUNT OFF;
END
GO
