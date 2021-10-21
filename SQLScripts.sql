CREATE DATABASE [CouponManagementSystem];	
Go	
	
USE [CouponManagementSystem]	
GO	
	
CREATE TABLE [dbo].[User](	
	[UserId] [uniqueidentifier] NOT NULL PRIMARY KEY DEFAULT newid(),
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdatedDate] [datetime] NULL,
	[RowStatus] [int] NULL
) 	
GO	
	
CREATE TABLE [dbo].[Coupon](	
	[CouponId] [uniqueidentifier] NOT NULL PRIMARY KEY DEFAULT newid(),
	[Title] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[PerUserLimit] [int] NOT NULL,
	[AllUserLimit] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdatedDate] [datetime] NULL,
	[RowStatus] [int] NULL
)	
GO	
	
CREATE TABLE [dbo].[Redemption](	
	[RedemptionId] [uniqueidentifier] NOT NULL PRIMARY KEY DEFAULT newid(),
	[UserId] [uniqueidentifier] NOT NULL foreign key references [dbo].[User](UserId),
	[CouponId] [uniqueidentifier] NOT NULL foreign key references [dbo].[Coupon](CouponId),
	[RedemptionDate] [datetime] NOT NULL,
	[ApplicationCode] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdatedDate] [datetime] NULL,
	[RowStatus] [int] NULL
)	
GO	

CREATE TABLE [dbo].[UserCoupon](
[UserCouponId] [uniqueidentifier] NOT NULL PRIMARY KEY DEFAULT newid(),
[UserId] [uniqueidentifier] NOT NULL foreign key references [dbo].[User](UserId),
[CouponId] [uniqueidentifier] NOT NULL foreign key references [dbo].[Coupon](CouponId),
[LastRedemptionDate] [datetime] NOT NULL,
[RedemptionCount] [int] NOT NULL,
[RowStatus] [int] NULL
)
GO

CREATE INDEX index_for_userId_couponId_on_redemption
ON Redemption (UserId, CouponId);
Go