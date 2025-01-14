USE [PhanMemDL]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CardDeal]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDeal](
	[CardDealId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_CardDeal] PRIMARY KEY CLUSTERED 
(
	[CardDealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Career]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Career](
	[CareerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Career] PRIMARY KEY CLUSTERED 
(
	[CareerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContracImage]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContracImage](
	[ContracImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ContractId] [bigint] NULL,
	[Name] [nvarchar](550) NULL,
	[Note] [nvarchar](550) NULL,
	[Files] [nvarchar](550) NULL,
 CONSTRAINT [PK_ContracImage] PRIMARY KEY CLUSTERED 
(
	[ContracImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contract]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractId] [bigint] IDENTITY(1,1) NOT NULL,
	[ServiceId] [nvarchar](150) NULL,
	[ContractTypeId] [int] NULL,
	[ProviderId] [bigint] NULL,
	[PartnerId] [bigint] NULL,
	[Code] [nvarchar](150) NULL,
	[Name] [nvarchar](1150) NULL,
	[ContractLocation] [nvarchar](1150) NULL,
	[ContractTime] [datetime] NULL,
	[FromDay] [datetime] NULL,
	[ToDay] [datetime] NULL,
	[DebtTerm] [numeric](18, 0) NULL,
	[DebtTermMax] [numeric](18, 0) NULL,
	[Files] [nvarchar](550) NULL,
	[Files1] [nvarchar](550) NULL,
	[Contents] [nvarchar](max) NULL,
	[Description] [nvarchar](1550) NULL,
	[Status] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractStatus]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractStatus](
	[ContractStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_ContractStatus] PRIMARY KEY CLUSTERED 
(
	[ContractStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[ContractTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1550) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ContractType] PRIMARY KEY CLUSTERED 
(
	[ContractTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Education]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[EducationId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Folk]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folk](
	[FolkId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Folk] PRIMARY KEY CLUSTERED 
(
	[FolkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GridesCardType]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GridesCardType](
	[GuidesCardTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_GridesCardType] PRIMARY KEY CLUSTERED 
(
	[GuidesCardTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupGuest]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupGuest](
	[GroupGuestId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_GroupGuest] PRIMARY KEY CLUSTERED 
(
	[GroupGuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guides]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guides](
	[GuidesId] [int] NOT NULL,
	[Code] [nvarchar](150) NULL,
	[Name] [nvarchar](150) NULL,
	[VocativeId] [int] NULL,
	[NumberIdentity] [nvarchar](20) NULL,
	[Birthday] [nvarchar](50) NULL,
	[PlaceOfIssue] [nvarchar](50) NULL,
	[DayOfIssue] [nvarchar](50) NULL,
	[NumberVat] [nvarchar](20) NULL,
	[IsMarriage] [bit] NOT NULL,
	[Gender] [int] NULL,
	[Image] [nvarchar](350) NULL,
	[Passport] [nvarchar](50) NULL,
	[FromPassport] [datetime] NOT NULL,
	[ToPassport] [datetime] NULL,
	[GuidesGroupId] [int] NULL,
	[GuidesContractId] [int] NULL,
	[FolkId] [int] NULL,
	[ReligionId] [int] NULL,
	[Nationatily] [int] IDENTITY(1,1) NOT NULL,
	[Market] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mail] [nvarchar](150) NULL,
	[Facebook] [nvarchar](1050) NULL,
	[NationalId] [int] NULL,
	[AreaId] [int] NULL,
	[CityId] [int] NULL,
	[DistrictId] [int] NULL,
	[WardId] [int] NULL,
	[Address] [nvarchar](550) NULL,
	[AddressShow] [nvarchar](550) NULL,
	[EducationId] [int] NULL,
	[CareerId] [int] NULL,
	[Language] [int] NULL,
	[GridesCardTypeId] [int] NULL,
	[FromGridesCardDay] [datetime] NULL,
	[ToGridesCardDay] [datetime] NULL,
	[Experience] [nvarchar](max) NULL,
	[Description] [nvarchar](1550) NULL,
	[Contents] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_Guides] PRIMARY KEY CLUSTERED 
(
	[GuidesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuidesContract]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidesContract](
	[GuidesContractTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_GuidesContract] PRIMARY KEY CLUSTERED 
(
	[GuidesContractTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuidesGroup]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidesGroup](
	[GuidesGroupId] [int] NOT NULL,
	[Name] [nvarchar](350) NULL,
	[Rank] [int] NULL,
	[Market] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_GuidesGroup] PRIMARY KEY CLUSTERED 
(
	[GuidesGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuidesPrice]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidesPrice](
	[GuidesPriceId] [bigint] IDENTITY(1,1) NOT NULL,
	[GuidesId] [int] NOT NULL,
	[GuidesGroupId] [int] NULL,
	[ContractId] [bigint] NULL,
	[ProviderId] [bigint] NULL,
	[PaymenId] [int] NULL,
	[Name] [nvarchar](550) NULL,
	[FromDay] [datetime] NULL,
	[ToDay] [datetime] NULL,
	[Price] [numeric](18, 0) NULL,
	[PriceExtra] [numeric](18, 0) NULL,
	[IsVat] [bit] NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_GuidesPrice] PRIMARY KEY CLUSTERED 
(
	[GuidesPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuidesProperty]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidesProperty](
	[GuidesPropertyId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Name] [nvarchar](350) NULL,
	[Note] [nvarchar](1550) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_GuidesProperty] PRIMARY KEY CLUSTERED 
(
	[GuidesPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuidesPropertyDetail]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidesPropertyDetail](
	[GuidesPropertyId] [int] NOT NULL,
	[GuidesId] [int] NOT NULL,
	[Rank] [int] NULL,
	[Note] [nvarchar](550) NULL,
 CONSTRAINT [PK_GuidesPropertyDetail] PRIMARY KEY CLUSTERED 
(
	[GuidesPropertyId] ASC,
	[GuidesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[ItemId] [bigint] NULL,
	[Contens] [nvarchar](max) NULL,
	[Name] [nvarchar](250) NULL,
	[CreateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[InsuranceId] [bigint] NOT NULL,
	[Code] [nvarchar](150) NULL,
	[Name] [nvarchar](350) NULL,
	[Files] [nvarchar](350) NULL,
	[Description] [nvarchar](1550) NULL,
	[Contents] [nvarchar](max) NULL,
	[Term] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InsurancePrice]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsurancePrice](
	[InsurancePriceId] [bigint] NOT NULL,
	[ProviderId] [bigint] NULL,
	[ContractId] [bigint] NULL,
	[InsuranceId] [bigint] NULL,
	[PaymenId] [int] NULL,
	[Name] [nvarchar](1550) NULL,
	[FromDay] [datetime] NULL,
	[ToDay] [datetime] NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[Surcharge] [numeric](18, 0) NULL,
	[IsVat] [bit] NOT NULL,
	[Description] [nvarchar](1550) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_InsurancePrice] PRIMARY KEY CLUSTERED 
(
	[InsurancePriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land](
	[LandId] [bigint] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](150) NULL,
	[Name] [nvarchar](550) NULL,
	[QuantityDay] [int] NULL,
	[QuantityNight] [int] NULL,
	[NationalId] [int] NULL,
	[Destination] [nvarchar](1550) NULL,
	[Description] [nvarchar](2250) NULL,
	[Contents] [nvarchar](max) NULL,
	[QuantityGuest] [int] NULL,
	[StarsId] [int] NULL,
	[HotelNight] [int] NULL,
	[Meal] [int] NULL,
	[Snacks] [int] NULL,
	[SortSchedule] [nvarchar](max) NULL,
	[Files] [nvarchar](350) NULL,
	[GroupGuestId] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Land] PRIMARY KEY CLUSTERED 
(
	[LandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LandGroup]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandGroup](
	[LandGroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](550) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_LandGroup] PRIMARY KEY CLUSTERED 
(
	[LandGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoneyDeal]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoneyDeal](
	[MoneyDealId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_MoneyDeal] PRIMARY KEY CLUSTERED 
(
	[MoneyDealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParentProfit]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentProfit](
	[ParentProfitId] [bigint] NOT NULL,
	[ParentId] [bigint] NULL,
	[Name] [nvarchar](500) NULL,
	[Percents] [float] NULL,
	[FromDay] [datetime] NULL,
	[ToDay] [datetime] NULL,
 CONSTRAINT [PK_ParentProfit] PRIMARY KEY CLUSTERED 
(
	[ParentProfitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Partner]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[PartnerId] [bigint] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[NameOther] [nvarchar](250) NULL,
	[NameSearch] [nvarchar](450) NULL,
	[NumberSPKD] [nvarchar](150) NULL,
	[NumberLHQT] [nvarchar](150) NULL,
	[TaxCode] [nvarchar](50) NULL,
	[EstablishYear] [nvarchar](50) NULL,
	[Paymen] [nvarchar](50) NULL,
	[MoneyDealId] [nvarchar](50) NULL,
	[CardDealId] [nvarchar](50) NULL,
	[Image] [nvarchar](350) NULL,
	[Phone] [nvarchar](15) NULL,
	[Mail] [nvarchar](150) NOT NULL,
	[CareerId] [int] NULL,
	[NationalId] [int] NULL,
	[AreaId] [int] NULL,
	[CityId] [int] NULL,
	[DistrictId] [int] NULL,
	[WardId] [int] NULL,
	[AddressShow] [nvarchar](550) NULL,
	[ServiceId] [nvarchar](50) NULL,
	[Description] [nvarchar](1550) NULL,
	[Contents] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_Parnert] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerBank]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerBank](
	[PartnerId] [bigint] NOT NULL,
	[BankId] [int] NOT NULL,
	[Numbert] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ParnertBank] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC,
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerBranch]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerBranch](
	[PartnerBarchId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerId] [bigint] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](15) NULL,
	[Hotline] [nvarchar](15) NULL,
	[Mail] [nvarchar](150) NULL,
	[Fax] [nvarchar](15) NULL,
	[Address] [nvarchar](350) NULL,
	[CityId] [int] NULL,
	[Note] [nvarchar](550) NULL,
 CONSTRAINT [PK_PartnerBranch] PRIMARY KEY CLUSTERED 
(
	[PartnerBarchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerContact]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerContact](
	[PartnerContactId] [bigint] IDENTITY(1,1) NOT NULL,
	[RegencyId] [int] NULL,
	[PartnerId] [bigint] NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [int] NULL,
	[NickName] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[HotLine] [nvarchar](15) NULL,
	[Mail] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_ParnertContact] PRIMARY KEY CLUSTERED 
(
	[PartnerContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerDeposit]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerDeposit](
	[PartnerDepositId] [bigint] NOT NULL,
	[PartnerId] [bigint] NULL,
	[Money] [numeric](18, 0) NULL,
	[Day] [datetime] NULL,
	[Note] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PartnerDeposit] PRIMARY KEY CLUSTERED 
(
	[PartnerDepositId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerImage]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerImage](
	[ParnertImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ParnertId] [bigint] NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](350) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ParnertImage] PRIMARY KEY CLUSTERED 
(
	[ParnertImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerLeve]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerLeve](
	[PartnerLeveId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Percents] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_PartnerLeve] PRIMARY KEY CLUSTERED 
(
	[PartnerLeveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerLeveDetail]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerLeveDetail](
	[PartnerId] [bigint] NOT NULL,
	[PartnerLeveId] [int] NOT NULL,
	[Percents] [float] NULL,
	[Day] [datetime] NULL,
 CONSTRAINT [PK_PartnerLeveDetail] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC,
	[PartnerLeveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerPropertise]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerPropertise](
	[PartnerPropertiesId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerId] [bigint] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](550) NULL,
	[Lable] [nvarchar](150) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ParnertPropertise] PRIMARY KEY CLUSTERED 
(
	[PartnerPropertiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerStaff]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerStaff](
	[PartnerStaffId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerId] [bigint] NULL,
	[UserId] [bigint] NULL,
	[VocativeId] [int] NULL,
	[Name] [nvarchar](150) NULL,
	[NumberIdentity] [nvarchar](20) NULL,
	[Birthday] [nvarchar](50) NULL,
	[PlaceOfIssue] [nvarchar](50) NULL,
	[DayOfIssue] [nvarchar](50) NULL,
	[NumberVat] [nvarchar](20) NULL,
	[IsMarriage] [bit] NOT NULL,
	[Gender] [int] NULL,
	[Image] [nvarchar](350) NULL,
	[Phone] [nvarchar](20) NULL,
	[Phone1] [nvarchar](20) NULL,
	[Mail] [nvarchar](20) NULL,
	[Mail1] [nvarchar](20) NULL,
	[ImageIdentity] [nvarchar](350) NULL,
	[ImageBirth] [nvarchar](350) NULL,
	[Note] [nvarchar](max) NULL,
	[OriginNationalId] [int] NULL,
	[OriginCityId] [int] NULL,
	[OriginDistrictId] [int] NULL,
	[OriginWardId] [int] NULL,
	[OriginAddress] [nvarchar](50) NULL,
	[OriginShow] [nvarchar](50) NULL,
	[ContactNationalId] [int] NULL,
	[ContactCityId] [int] NULL,
	[ContactDistrictId] [int] NULL,
	[ContactWardId] [int] NULL,
	[ContactAddress] [nvarchar](50) NULL,
	[ContactShow] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_ParnertStaff] PRIMARY KEY CLUSTERED 
(
	[PartnerStaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerStaffBank]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerStaffBank](
	[PartnerStaffBankId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerStaffId] [bigint] NULL,
	[NumberBank] [nvarchar](50) NULL,
	[BankId] [int] NULL,
 CONSTRAINT [PK_PartnerStaffBank] PRIMARY KEY CLUSTERED 
(
	[PartnerStaffBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paymen]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paymen](
	[PaymenId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Paymen] PRIMARY KEY CLUSTERED 
(
	[PaymenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plan]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1500) NULL,
	[Files] [nvarchar](1500) NULL,
	[Note] [nvarchar](max) NULL,
	[FromDay] [datetime] NULL,
	[ToDay] [datetime] NULL,
	[CreateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provider]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [bigint] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[NameOther] [nvarchar](250) NULL,
	[NameSearch] [nvarchar](450) NULL,
	[NumberSPKD] [nvarchar](150) NULL,
	[NumberLHQT] [nvarchar](150) NULL,
	[TaxCode] [nvarchar](50) NULL,
	[EstablishYear] [nvarchar](50) NULL,
	[Paymen] [nvarchar](50) NULL,
	[MoneyDealId] [nvarchar](50) NULL,
	[CardDealId] [nvarchar](50) NULL,
	[Image] [nvarchar](350) NULL,
	[Phone] [nvarchar](15) NULL,
	[Mail] [nvarchar](150) NOT NULL,
	[CareerId] [int] NULL,
	[NationalId] [int] NULL,
	[AreaId] [int] NULL,
	[CityId] [int] NULL,
	[AddressShow] [nvarchar](550) NULL,
	[ServiceId] [nvarchar](50) NULL,
	[Description] [nvarchar](1550) NULL,
	[Contents] [nvarchar](max) NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderBank]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderBank](
	[ProviderId] [bigint] NOT NULL,
	[BankId] [int] NOT NULL,
	[Numbert] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProviderBank] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC,
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderBranch]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderBranch](
	[ProviderBarchId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProviderId] [bigint] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](15) NULL,
	[Hotline] [nvarchar](15) NULL,
	[Mail] [nvarchar](150) NULL,
	[Fax] [nvarchar](15) NULL,
	[Address] [nvarchar](350) NULL,
	[CityId] [int] NULL,
	[Note] [nvarchar](550) NULL,
 CONSTRAINT [PK_ProviderBranch] PRIMARY KEY CLUSTERED 
(
	[ProviderBarchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderContact]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderContact](
	[ProviderContactId] [bigint] IDENTITY(1,1) NOT NULL,
	[RegencyId] [int] NULL,
	[ProviderId] [nchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [int] NULL,
	[NickName] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[HotLine] [nvarchar](15) NULL,
	[Mail] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProviderContact] PRIMARY KEY CLUSTERED 
(
	[ProviderContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderImage]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderImage](
	[ProviderImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProviderId] [bigint] NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](350) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProviderImage] PRIMARY KEY CLUSTERED 
(
	[ProviderImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderPropertise]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderPropertise](
	[ProviderPropertiesId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProviderId] [bigint] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](550) NULL,
	[Lable] [nvarchar](150) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProviderPropertise] PRIMARY KEY CLUSTERED 
(
	[ProviderPropertiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regency]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regency](
	[RegencyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Regency] PRIMARY KEY CLUSTERED 
(
	[RegencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Religion]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[ReligionId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Religion] PRIMARY KEY CLUSTERED 
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceOther]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOther](
	[ServiceOtherId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](550) NULL,
	[NationalId] [int] NULL,
	[AreaId] [int] NULL,
	[CityId] [int] NULL,
	[DistrictId] [int] NULL,
	[WardId] [int] NULL,
	[Address] [nvarchar](550) NULL,
	[AddressShow] [nvarchar](550) NULL,
	[LocationId] [bigint] NULL,
	[Description] [nvarchar](1550) NULL,
	[Contents] [nvarchar](max) NULL,
	[UpdateBy] [nvarchar](50) NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_ServiceOther] PRIMARY KEY CLUSTERED 
(
	[ServiceOtherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceOtherPrice]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOtherPrice](
	[ServiceOtherPriceId] [bigint] NOT NULL,
	[ServiceOtherId] [bigint] NULL,
	[ProviderId] [bigint] NULL,
	[ContractId] [bigint] NULL,
	[PaymenId] [int] NULL,
	[Name] [nvarchar](1550) NULL,
	[FromDay] [datetime] NULL,
	[ToDay] [datetime] NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[PriceAdult] [numeric](18, 0) NULL,
	[PriceChild] [numeric](18, 0) NULL,
	[PriceInfant] [numeric](18, 0) NULL,
	[PriceBaby] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ServiceOthePrice] PRIMARY KEY CLUSTERED 
(
	[ServiceOtherPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stars]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stars](
	[StarsId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[UpdateBy] [bigint] NULL,
	[UpdateDay] [datetime] NULL,
	[CreateBy] [bigint] NULL,
	[CreateDay] [datetime] NULL,
 CONSTRAINT [PK_Stars] PRIMARY KEY CLUSTERED 
(
	[StarsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Mail] [nvarchar](40) NULL,
	[Image] [nvarchar](350) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateDay] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[Sex] [bit] NOT NULL,
	[Account] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Remember] [bit] NOT NULL,
	[LoginDay] [datetime] NULL,
	[RePassDay] [datetime] NULL,
	[Point] [float] NULL,
	[CareerId] [int] NULL,
	[Diploma] [nvarchar](550) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vocative]    Script Date: 12/7/2016 5:59:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vocative](
	[VocativeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Vocative] PRIMARY KEY CLUSTERED 
(
	[VocativeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ContracImage]  WITH CHECK ADD  CONSTRAINT [FK_ContracImage_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[ContracImage] CHECK CONSTRAINT [FK_ContracImage_Contract]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractType] FOREIGN KEY([ContractTypeId])
REFERENCES [dbo].[ContractType] ([ContractTypeId])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ContractType]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Provider]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_Folk] FOREIGN KEY([FolkId])
REFERENCES [dbo].[Folk] ([FolkId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_Folk]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_GridesCardType] FOREIGN KEY([GridesCardTypeId])
REFERENCES [dbo].[GridesCardType] ([GuidesCardTypeId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_GridesCardType]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_GuidesContract] FOREIGN KEY([GuidesContractId])
REFERENCES [dbo].[GuidesContract] ([GuidesContractTypeId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_GuidesContract]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_GuidesGroup] FOREIGN KEY([GuidesGroupId])
REFERENCES [dbo].[GuidesGroup] ([GuidesGroupId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_GuidesGroup]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_Religion] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[Religion] ([ReligionId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_Religion]
GO
ALTER TABLE [dbo].[Guides]  WITH CHECK ADD  CONSTRAINT [FK_Guides_Vocative] FOREIGN KEY([VocativeId])
REFERENCES [dbo].[Vocative] ([VocativeId])
GO
ALTER TABLE [dbo].[Guides] CHECK CONSTRAINT [FK_Guides_Vocative]
GO
ALTER TABLE [dbo].[GuidesPrice]  WITH CHECK ADD  CONSTRAINT [FK_GuidesPrice_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[GuidesPrice] CHECK CONSTRAINT [FK_GuidesPrice_Contract]
GO
ALTER TABLE [dbo].[GuidesPrice]  WITH CHECK ADD  CONSTRAINT [FK_GuidesPrice_Guides] FOREIGN KEY([GuidesId])
REFERENCES [dbo].[Guides] ([GuidesId])
GO
ALTER TABLE [dbo].[GuidesPrice] CHECK CONSTRAINT [FK_GuidesPrice_Guides]
GO
ALTER TABLE [dbo].[GuidesPrice]  WITH CHECK ADD  CONSTRAINT [FK_GuidesPrice_GuidesGroup] FOREIGN KEY([GuidesGroupId])
REFERENCES [dbo].[GuidesGroup] ([GuidesGroupId])
GO
ALTER TABLE [dbo].[GuidesPrice] CHECK CONSTRAINT [FK_GuidesPrice_GuidesGroup]
GO
ALTER TABLE [dbo].[GuidesPrice]  WITH CHECK ADD  CONSTRAINT [FK_GuidesPrice_Paymen] FOREIGN KEY([PaymenId])
REFERENCES [dbo].[Paymen] ([PaymenId])
GO
ALTER TABLE [dbo].[GuidesPrice] CHECK CONSTRAINT [FK_GuidesPrice_Paymen]
GO
ALTER TABLE [dbo].[GuidesPropertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_GuidesPropertyDetail_Guides] FOREIGN KEY([GuidesId])
REFERENCES [dbo].[Guides] ([GuidesId])
GO
ALTER TABLE [dbo].[GuidesPropertyDetail] CHECK CONSTRAINT [FK_GuidesPropertyDetail_Guides]
GO
ALTER TABLE [dbo].[GuidesPropertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_GuidesPropertyDetail_GuidesProperty] FOREIGN KEY([GuidesPropertyId])
REFERENCES [dbo].[GuidesProperty] ([GuidesPropertyId])
GO
ALTER TABLE [dbo].[GuidesPropertyDetail] CHECK CONSTRAINT [FK_GuidesPropertyDetail_GuidesProperty]
GO
ALTER TABLE [dbo].[InsurancePrice]  WITH CHECK ADD  CONSTRAINT [FK_InsurancePrice_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[InsurancePrice] CHECK CONSTRAINT [FK_InsurancePrice_Contract]
GO
ALTER TABLE [dbo].[InsurancePrice]  WITH CHECK ADD  CONSTRAINT [FK_InsurancePrice_Insurance] FOREIGN KEY([InsuranceId])
REFERENCES [dbo].[Insurance] ([InsuranceId])
GO
ALTER TABLE [dbo].[InsurancePrice] CHECK CONSTRAINT [FK_InsurancePrice_Insurance]
GO
ALTER TABLE [dbo].[InsurancePrice]  WITH CHECK ADD  CONSTRAINT [FK_InsurancePrice_Paymen] FOREIGN KEY([PaymenId])
REFERENCES [dbo].[Paymen] ([PaymenId])
GO
ALTER TABLE [dbo].[InsurancePrice] CHECK CONSTRAINT [FK_InsurancePrice_Paymen]
GO
ALTER TABLE [dbo].[Land]  WITH CHECK ADD  CONSTRAINT [FK_Land_GroupGuest] FOREIGN KEY([GroupGuestId])
REFERENCES [dbo].[GroupGuest] ([GroupGuestId])
GO
ALTER TABLE [dbo].[Land] CHECK CONSTRAINT [FK_Land_GroupGuest]
GO
ALTER TABLE [dbo].[Land]  WITH CHECK ADD  CONSTRAINT [FK_Land_Stars] FOREIGN KEY([StarsId])
REFERENCES [dbo].[Stars] ([StarsId])
GO
ALTER TABLE [dbo].[Land] CHECK CONSTRAINT [FK_Land_Stars]
GO
ALTER TABLE [dbo].[ParentProfit]  WITH CHECK ADD  CONSTRAINT [FK_ParentProfit_Partner] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[ParentProfit] CHECK CONSTRAINT [FK_ParentProfit_Partner]
GO
ALTER TABLE [dbo].[PartnerBank]  WITH CHECK ADD  CONSTRAINT [FK_PartnerBank_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([BankId])
GO
ALTER TABLE [dbo].[PartnerBank] CHECK CONSTRAINT [FK_PartnerBank_Bank]
GO
ALTER TABLE [dbo].[PartnerBank]  WITH CHECK ADD  CONSTRAINT [FK_PartnerBank_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerBank] CHECK CONSTRAINT [FK_PartnerBank_Partner]
GO
ALTER TABLE [dbo].[PartnerBranch]  WITH CHECK ADD  CONSTRAINT [FK_PartnerBranch_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerBranch] CHECK CONSTRAINT [FK_PartnerBranch_Partner]
GO
ALTER TABLE [dbo].[PartnerContact]  WITH CHECK ADD  CONSTRAINT [FK_PartnerContact_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerContact] CHECK CONSTRAINT [FK_PartnerContact_Partner]
GO
ALTER TABLE [dbo].[PartnerDeposit]  WITH CHECK ADD  CONSTRAINT [FK_PartnerDeposit_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerDeposit] CHECK CONSTRAINT [FK_PartnerDeposit_Partner]
GO
ALTER TABLE [dbo].[PartnerImage]  WITH CHECK ADD  CONSTRAINT [FK_PartnerImage_Partner] FOREIGN KEY([ParnertId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerImage] CHECK CONSTRAINT [FK_PartnerImage_Partner]
GO
ALTER TABLE [dbo].[PartnerLeveDetail]  WITH CHECK ADD  CONSTRAINT [FK_PartnerLeveDetail_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerLeveDetail] CHECK CONSTRAINT [FK_PartnerLeveDetail_Partner]
GO
ALTER TABLE [dbo].[PartnerLeveDetail]  WITH CHECK ADD  CONSTRAINT [FK_PartnerLeveDetail_PartnerLeve] FOREIGN KEY([PartnerLeveId])
REFERENCES [dbo].[PartnerLeve] ([PartnerLeveId])
GO
ALTER TABLE [dbo].[PartnerLeveDetail] CHECK CONSTRAINT [FK_PartnerLeveDetail_PartnerLeve]
GO
ALTER TABLE [dbo].[PartnerPropertise]  WITH CHECK ADD  CONSTRAINT [FK_PartnerPropertise_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerPropertise] CHECK CONSTRAINT [FK_PartnerPropertise_Partner]
GO
ALTER TABLE [dbo].[PartnerStaff]  WITH CHECK ADD  CONSTRAINT [FK_PartnerStaff_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([PartnerId])
GO
ALTER TABLE [dbo].[PartnerStaff] CHECK CONSTRAINT [FK_PartnerStaff_Partner]
GO
ALTER TABLE [dbo].[PartnerStaff]  WITH CHECK ADD  CONSTRAINT [FK_PartnerStaff_Vocative] FOREIGN KEY([VocativeId])
REFERENCES [dbo].[Vocative] ([VocativeId])
GO
ALTER TABLE [dbo].[PartnerStaff] CHECK CONSTRAINT [FK_PartnerStaff_Vocative]
GO
ALTER TABLE [dbo].[PartnerStaffBank]  WITH CHECK ADD  CONSTRAINT [FK_PartnerStaffBank_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([BankId])
GO
ALTER TABLE [dbo].[PartnerStaffBank] CHECK CONSTRAINT [FK_PartnerStaffBank_Bank]
GO
ALTER TABLE [dbo].[PartnerStaffBank]  WITH CHECK ADD  CONSTRAINT [FK_PartnerStaffBank_PartnerStaff] FOREIGN KEY([PartnerStaffId])
REFERENCES [dbo].[PartnerStaff] ([PartnerStaffId])
GO
ALTER TABLE [dbo].[PartnerStaffBank] CHECK CONSTRAINT [FK_PartnerStaffBank_PartnerStaff]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK_Provider_Career] FOREIGN KEY([CareerId])
REFERENCES [dbo].[Career] ([CareerId])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK_Provider_Career]
GO
ALTER TABLE [dbo].[ProviderBank]  WITH CHECK ADD  CONSTRAINT [FK_ProviderBank_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([BankId])
GO
ALTER TABLE [dbo].[ProviderBank] CHECK CONSTRAINT [FK_ProviderBank_Bank]
GO
ALTER TABLE [dbo].[ProviderBank]  WITH CHECK ADD  CONSTRAINT [FK_ProviderBank_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderBank] CHECK CONSTRAINT [FK_ProviderBank_Provider]
GO
ALTER TABLE [dbo].[ProviderBranch]  WITH CHECK ADD  CONSTRAINT [FK_ProviderBranch_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderBranch] CHECK CONSTRAINT [FK_ProviderBranch_Provider]
GO
ALTER TABLE [dbo].[ProviderImage]  WITH CHECK ADD  CONSTRAINT [FK_ProviderImage_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderImage] CHECK CONSTRAINT [FK_ProviderImage_Provider]
GO
ALTER TABLE [dbo].[ProviderPropertise]  WITH CHECK ADD  CONSTRAINT [FK_ProviderPropertise_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderPropertise] CHECK CONSTRAINT [FK_ProviderPropertise_Provider]
GO
ALTER TABLE [dbo].[ServiceOtherPrice]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOtherPrice_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[ServiceOtherPrice] CHECK CONSTRAINT [FK_ServiceOtherPrice_Contract]
GO
ALTER TABLE [dbo].[ServiceOtherPrice]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOtherPrice_Paymen] FOREIGN KEY([PaymenId])
REFERENCES [dbo].[Paymen] ([PaymenId])
GO
ALTER TABLE [dbo].[ServiceOtherPrice] CHECK CONSTRAINT [FK_ServiceOtherPrice_Paymen]
GO
ALTER TABLE [dbo].[ServiceOtherPrice]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOtherPrice_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ServiceOtherPrice] CHECK CONSTRAINT [FK_ServiceOtherPrice_Provider]
GO
ALTER TABLE [dbo].[ServiceOtherPrice]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOtherPrice_ServiceOther] FOREIGN KEY([ServiceOtherId])
REFERENCES [dbo].[ServiceOther] ([ServiceOtherId])
GO
ALTER TABLE [dbo].[ServiceOtherPrice] CHECK CONSTRAINT [FK_ServiceOtherPrice_ServiceOther]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Career] FOREIGN KEY([CareerId])
REFERENCES [dbo].[Career] ([CareerId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Career]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngân hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại card giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardDeal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngành nghề' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Career'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại Service [1,2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ServiceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại hợp đồng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ContractTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nới ký hợp đồng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ContractLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày ký' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ContractTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hiều lực từ ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'FromDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hiều lực đến ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ToDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hạn mức nợ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'DebtTerm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hạn mức nợ tối đa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'DebtTermMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình thức họp đồng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Học vấn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Education'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dân tộc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Folk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại thẻ hướng dẩn viên(Quốc tế, nội điaj)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GridesCardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'xúng hô' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'VocativeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CMND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'NumberIdentity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nơi cấp CMND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'PlaceOfIssue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tình trạng hôn nhân' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'IsMarriage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Nam, 2-Nữ, 3-Chưa biết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm hướng dẫn viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'GuidesGroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại hợp đồng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'GuidesContractId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dân tộc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'FolkId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tôn giáo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'ReligionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thị trường [1,2](OutBound,InBound,Domestic)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'Market'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khu vực[1,2](Đường ngắn,Đường trung,Đường dài)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Học vấn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'EducationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngành nghề' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'CareerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngôn ngữ [1,2](Viêt,Anh)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'Language'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kinh nghiệm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides', @level2type=N'COLUMN',@level2name=N'Experience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hướng dẫn viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guides'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại hợp đồng(chính thức, cộng tác viên)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesContract'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Xếp hạng nhóm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesGroup', @level2type=N'COLUMN',@level2name=N'Rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thị trường [1,2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesGroup', @level2type=N'COLUMN',@level2name=N'Market'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Khu vực[1,2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesGroup', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm hướng dẩn viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm hướng đẩn viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesPrice', @level2type=N'COLUMN',@level2name=N'GuidesGroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hợp đồng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesPrice', @level2type=N'COLUMN',@level2name=N'ContractId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesPrice', @level2type=N'COLUMN',@level2name=N'ProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình thức thanh toán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesPrice', @level2type=N'COLUMN',@level2name=N'PaymenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá hướng dẫn viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại thuộc tính, 1- thông tin hướng dẫn viên, 2-Chuyên môn. 3- Tiêu chí đánh giá,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesProperty', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thuộc tính của hướng dẫn viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chi tiết thuộc tinh tour' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GuidesPropertyDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kỳ hạn (số ngày)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Insurance', @level2type=N'COLUMN',@level2name=N'Term'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bảo hiểm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Insurance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InsurancePrice', @level2type=N'COLUMN',@level2name=N'ProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hợp đồng nhà cung câp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InsurancePrice', @level2type=N'COLUMN',@level2name=N'ContractId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bảo hiểm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InsurancePrice', @level2type=N'COLUMN',@level2name=N'InsuranceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình thức thanh toán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InsurancePrice', @level2type=N'COLUMN',@level2name=N'PaymenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phụ phí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InsurancePrice', @level2type=N'COLUMN',@level2name=N'Surcharge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True- có VAT, False - Chưa có VAT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InsurancePrice', @level2type=N'COLUMN',@level2name=N'IsVat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Danh sách điểm đến nổi bật' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'Destination'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả ngắn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nội dung' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng khách' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'QuantityGuest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số sao khách sạn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'StarsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số đêm khách sạn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'HotelNight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số bửa chính/ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'Meal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số bửa ăn phụ/trên ngày' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'Snacks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tóm tắc lịch trình' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land', @level2type=N'COLUMN',@level2name=N'SortSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Land tour' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm land tour' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LandGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại tiền giao dịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MoneyDeal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'% kê giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ParentProfit', @level2type=N'COLUMN',@level2name=N'Percents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lợi nhuận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ParentProfit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1- đại lý, 2-Nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partner', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngành nghề' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngân hàng pnerter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerBank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chi nhánh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerBranch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức vụ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerContact', @level2type=N'COLUMN',@level2name=N'RegencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đại lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerContact', @level2type=N'COLUMN',@level2name=N'PartnerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thông tin người liên hệ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tiền đặc cọc của đại lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh đối tác' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerImage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cấp bật đại lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerLeve'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cấp của đại lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerLeveDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thuộc tính của parnert
sky,face,website...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerPropertise'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'xúng hô' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerStaff', @level2type=N'COLUMN',@level2name=N'VocativeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CMND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerStaff', @level2type=N'COLUMN',@level2name=N'NumberIdentity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nơi cấp CMND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerStaff', @level2type=N'COLUMN',@level2name=N'PlaceOfIssue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tình trạng hôn nhân' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerStaff', @level2type=N'COLUMN',@level2name=N'IsMarriage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Nam, 2-Nữ, 3-Chưa biết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerStaff', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhân viên đại lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PartnerStaff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phương thức thanh toán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paymen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Provider', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Provider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngân hàng Provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderBank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chi nhánh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderBranch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức vụ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderContact', @level2type=N'COLUMN',@level2name=N'RegencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đại lý' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderContact', @level2type=N'COLUMN',@level2name=N'ProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thông tin người liên hệ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh đối tác' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderImage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thuộc tính của Provider
sky,face,website...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProviderPropertise'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức vụ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Regency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tôn giáo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Religion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dịch vụ khác' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceOther'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceOtherPrice', @level2type=N'COLUMN',@level2name=N'ProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hợp đồng nhà cung câp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceOtherPrice', @level2type=N'COLUMN',@level2name=N'ContractId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình thức thanh toán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceOtherPrice', @level2type=N'COLUMN',@level2name=N'PaymenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá dịch vụ khác' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServiceOtherPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Xưng hô' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vocative'
GO
