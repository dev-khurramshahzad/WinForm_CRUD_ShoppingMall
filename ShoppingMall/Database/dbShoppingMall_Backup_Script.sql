USE [OnlineShoppingMall]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[ParentCategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
	[PostalCode] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[OrderStatus] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [varchar](50) NOT NULL,
	[PaymentStatus] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[Description] [text] NULL,
	[Price] [decimal](18, 2) NULL,
	[StockQuantity] [int] NULL,
	[CategoryId] [int] NULL,
	[BrandId] [int] NULL,
	[ImageUrl] [varchar](255) NULL,
 CONSTRAINT [PK__Products__B40CC6CD122C00AB] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 8/9/2024 9:56:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (1, N'Apple', N'High-end electronics')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (2, N'Samsung', N'Wide range of electronics')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (3, N'Nike', N'Sportswear and accessories')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (4, N'Adidas', N'Sportswear and accessories')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (5, N'Sony', N'Electronics and gadgets')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (6, N'Dell', N'Computing and electronics')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName], [Description]) VALUES (7, N'HP', N'Computers and peripherals')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([CartItemId], [CartId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (1, 1, 1, 1, CAST(999.99 AS Decimal(18, 2)), CAST(999.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartItems] ([CartItemId], [CartId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (2, 2, 2, 1, CAST(799.99 AS Decimal(18, 2)), CAST(799.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartItems] ([CartItemId], [CartId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (3, 3, 3, 1, CAST(1199.99 AS Decimal(18, 2)), CAST(1199.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartItems] ([CartItemId], [CartId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (4, 4, 4, 1, CAST(199.99 AS Decimal(18, 2)), CAST(199.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[CartItems] ([CartItemId], [CartId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (5, 5, 5, 1, CAST(349.99 AS Decimal(18, 2)), CAST(349.99 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (1, N'iPhone 14', N'Latest Apple smartphone', NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (2, N'Clothing', N'Men and Women Clothing', NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (3, N'Books', N'Various kinds of Books', NULL)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (4, N'Mobiles', N'Smartphones and Accessories', 1)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (5, N'Laptops', N'Laptops and Accessories', 1)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (6, N'Men Clothing', N'Clothing for Men', 2)
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [ParentCategoryId]) VALUES (7, N'546456', N'456', 2)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [Email], [PasswordHash], [PhoneNumber], [Address], [City], [Country], [PostalCode]) VALUES (1, N'Ali', N'Khan', N'ali.khan@example.com', N'hashedpassword1', N'03121234567', N'123 Main St', N'Karachi', N'Pakistan', N'74200')
GO
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [Email], [PasswordHash], [PhoneNumber], [Address], [City], [Country], [PostalCode]) VALUES (2, N'Sara', N'Sheikh', N'sara.sheikh@example.com', N'hashedpassword2', N'03123456789', N'456 Market Rd', N'Lahore', N'Pakistan', N'54000')
GO
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [Email], [PasswordHash], [PhoneNumber], [Address], [City], [Country], [PostalCode]) VALUES (3, N'Usman', N'Ahmed', N'usman.ahmed@example.com', N'hashedpassword3', N'03219876543', N'789 Mall Ave', N'Islamabad', N'Pakistan', N'44000')
GO
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [Email], [PasswordHash], [PhoneNumber], [Address], [City], [Country], [PostalCode]) VALUES (4, N'Ayesha', N'Malik', N'ayesha.malik@example.com', N'hashedpassword4', N'03011223344', N'321 Shopping St', N'Rawalpindi', N'Pakistan', N'46000')
GO
INSERT [dbo].[Customers] ([CustomerId], [FirstName], [LastName], [Email], [PasswordHash], [PhoneNumber], [Address], [City], [Country], [PostalCode]) VALUES (5, N'Bilal', N'Hassan', N'bilal.hassan@example.com', N'hashedpassword5', N'03012345678', N'654 Business Rd', N'Faisalabad', N'Pakistan', N'38000')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (1, 1, 1, 1, CAST(999.99 AS Decimal(18, 2)), CAST(999.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (2, 2, 2, 1, CAST(799.99 AS Decimal(18, 2)), CAST(799.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (3, 2, 6, 1, CAST(999.99 AS Decimal(18, 2)), CAST(999.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (4, 3, 5, 1, CAST(349.99 AS Decimal(18, 2)), CAST(349.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (5, 4, 4, 1, CAST(199.99 AS Decimal(18, 2)), CAST(199.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice], [TotalPrice]) VALUES (6, 5, 7, 1, CAST(1099.99 AS Decimal(18, 2)), CAST(1099.99 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerId], [TotalAmount], [OrderStatus]) VALUES (1, CAST(N'2024-08-09T00:34:32.567' AS DateTime), 1, CAST(999.99 AS Decimal(18, 2)), N'Pending')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerId], [TotalAmount], [OrderStatus]) VALUES (2, CAST(N'2024-08-09T00:34:32.567' AS DateTime), 2, CAST(1799.98 AS Decimal(18, 2)), N'Completed')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerId], [TotalAmount], [OrderStatus]) VALUES (3, CAST(N'2024-08-09T00:34:32.567' AS DateTime), 3, CAST(349.99 AS Decimal(18, 2)), N'Shipped')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerId], [TotalAmount], [OrderStatus]) VALUES (4, CAST(N'2024-08-09T00:34:32.567' AS DateTime), 4, CAST(199.99 AS Decimal(18, 2)), N'Cancelled')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [CustomerId], [TotalAmount], [OrderStatus]) VALUES (5, CAST(N'2024-08-09T00:34:32.567' AS DateTime), 5, CAST(1099.99 AS Decimal(18, 2)), N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 
GO
INSERT [dbo].[Payments] ([PaymentId], [OrderId], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus]) VALUES (1, 1, CAST(N'2024-08-09T00:34:32.593' AS DateTime), CAST(999.99 AS Decimal(18, 2)), N'Credit Card', N'Pending')
GO
INSERT [dbo].[Payments] ([PaymentId], [OrderId], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus]) VALUES (2, 2, CAST(N'2024-08-09T00:34:32.593' AS DateTime), CAST(1799.98 AS Decimal(18, 2)), N'PayPal', N'Completed')
GO
INSERT [dbo].[Payments] ([PaymentId], [OrderId], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus]) VALUES (3, 3, CAST(N'2024-08-09T00:34:32.593' AS DateTime), CAST(349.99 AS Decimal(18, 2)), N'Debit Card', N'Completed')
GO
INSERT [dbo].[Payments] ([PaymentId], [OrderId], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus]) VALUES (4, 4, CAST(N'2024-08-09T00:34:32.593' AS DateTime), CAST(199.99 AS Decimal(18, 2)), N'Credit Card', N'Refunded')
GO
INSERT [dbo].[Payments] ([PaymentId], [OrderId], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus]) VALUES (5, 5, CAST(N'2024-08-09T00:34:32.593' AS DateTime), CAST(1099.99 AS Decimal(18, 2)), N'Credit Card', N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (1, N'iPhone 14', N'Latest Apple smartphone', CAST(999.99 AS Decimal(18, 2)), 50, 4, 1, N'https://example.com/iphone14.jpg')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (2, N'Galaxy S21', N'Latest Samsung smartphone', CAST(799.99 AS Decimal(18, 2)), 70, 4, 2, N'https://example.com/galaxys21.jpg')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (3, N'Dell XPS 13', N'Compact and powerful laptop', CAST(1199.99 AS Decimal(18, 2)), 30, 5, 6, N'https://example.com/dellxps13.jpg')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (4, N'Nike Air Max', N'Comfortable running shoes', CAST(199.99 AS Decimal(18, 2)), 100, 6, 3, N'https://example.com/nikeairmax.jpg')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (5, N'Sony WH-1000XM4', N'Noise-cancelling headphones', CAST(349.99 AS Decimal(18, 2)), 40, 1, 5, N'https://example.com/sonyheadphones.jpg')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (6, N'Adidas Ultraboost', N'High-performance running shoes', CAST(179.99 AS Decimal(18, 2)), 80, 6, 4, N'https://example.com/adidasultraboost.jpg')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [StockQuantity], [CategoryId], [BrandId], [ImageUrl]) VALUES (7, N'Test Update', N'Test Update', CAST(1099.99 AS Decimal(18, 2)), 25, 3, 4, N'https://example.com/hpenvy13.jpg')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 
GO
INSERT [dbo].[ShoppingCarts] ([CartId], [CustomerId], [CreatedDate]) VALUES (1, 1, CAST(N'2024-08-09T00:34:32.580' AS DateTime))
GO
INSERT [dbo].[ShoppingCarts] ([CartId], [CustomerId], [CreatedDate]) VALUES (2, 2, CAST(N'2024-08-09T00:34:32.580' AS DateTime))
GO
INSERT [dbo].[ShoppingCarts] ([CartId], [CustomerId], [CreatedDate]) VALUES (3, 3, CAST(N'2024-08-09T00:34:32.580' AS DateTime))
GO
INSERT [dbo].[ShoppingCarts] ([CartId], [CustomerId], [CreatedDate]) VALUES (4, 4, CAST(N'2024-08-09T00:34:32.580' AS DateTime))
GO
INSERT [dbo].[ShoppingCarts] ([CartId], [CustomerId], [CreatedDate]) VALUES (5, 5, CAST(N'2024-08-09T00:34:32.580' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534B9341245]    Script Date: 8/9/2024 9:56:04 PM ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([CartId])
REFERENCES [dbo].[ShoppingCarts] ([CartId])
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK__CartItems__Produ__4CA06362] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK__CartItems__Produ__4CA06362]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__45F365D3] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__45F365D3]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__BrandI__3C69FB99] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__BrandI__3C69FB99]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__3B75D760] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__3B75D760]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
