USE [master]
GO
/****** Object:  Database [Jensen_Database]    Script Date: 5/12/2022 10:17:08 AM ******/
CREATE DATABASE [Jensen_Database]
GO
USE [Jensen_Database]
GO

CREATE TABLE [dbo].[Driver_Infractions](
	[Driver_Infraction_ID] [int] NOT NULL,
	[Driver_ID] [int] NULL,
	[Infractions_NMV_ID] [int] NULL,
	[Infractions_MV_ID] [int] NULL,
	[Warrant_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Driver_Infraction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver_Vehicles]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver_Vehicles](
	[Driver_Vehicles_ID] [int] NOT NULL,
	[Driver_ID] [int] NULL,
	[Vehicle_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Driver_Vehicles_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[Driver_ID] [int] NOT NULL,
	[Drivers_License_Number] [varchar](13) NULL,
	[SSN] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[Driver_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers_Licenses]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers_Licenses](
	[Drivers_License_ID] [int] NOT NULL,
	[Drivers_License_Number] [varchar](13) NULL,
	[FirstName] [varchar](25) NULL,
	[MiddleName] [varchar](25) NULL,
	[LastName] [varchar](25) NULL,
	[StreetAddress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip_Code] [varchar](5) NULL,
	[Date_of_Birth] [date] NULL,
	[Gender] [varchar](1) NULL,
	[Eye_Color] [varchar](15) NULL,
	[Height] [varchar](7) NULL,
	[Weight] [int] NULL,
	[Class] [varchar](1) NULL,
	[Donor_Is_Checked] [int] NULL,
	[Date_Issued] [date] NULL,
	[Date_Expires] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Drivers_License_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers_With_Outstanding_Warrants]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers_With_Outstanding_Warrants](
	[Warrant_ID] [int] NOT NULL,
	[Driver_Name_Last_First_Middle] [varchar](100) NULL,
	[Age] [int] NULL,
	[Last_Known_Location] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Warrant_Type] [varchar](100) NULL,
	[Charges] [varchar](100) NULL,
	[Date_Issued] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Warrant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infractions_Moving_Violations]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infractions_Moving_Violations](
	[Infractions_MV_ID] [int] NOT NULL,
	[Drivers_License_Number] [varchar](13) NULL,
	[Vehicle_License_Plate] [varchar](7) NULL,
	[Date_of_Infraction] [date] NULL,
	[Speeding_Is_Checked] [int] NULL,
	[Seatbelt_Violation_Is_Checked] [int] NULL,
	[Secure_Load_Is_Checked] [int] NULL,
	[Reckless_Driving_Is_Checked] [int] NULL,
	[Running_Stop_Sign_or_Traffic_Light_Is_Checked] [int] NULL,
	[DWI_Is_Checked] [int] NULL,
	[Description_of_Incident] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Infractions_MV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infractions_Non_Moving_Violations]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infractions_Non_Moving_Violations](
	[Infractions_NMV_ID] [int] NOT NULL,
	[Drivers_License_Number] [varchar](13) NULL,
	[Vehicle_License_Plate] [varchar](7) NULL,
	[Date_of_Infraction] [date] NULL,
	[Parking_Violation_Is_Checked] [int] NULL,
	[Broken_Taillight_Is_Checked] [int] NULL,
	[Fire_Hydrant_Parking_Is_Checked] [int] NULL,
	[Expired_Registration_or_Insurance_Is_Checked] [int] NULL,
	[Lack_of_Registration_or_Insurance_Is_Checked] [int] NULL,
	[Vehicle_Maintenance_Issue_Is_Checked] [int] NULL,
	[Description_of_Incident] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Infractions_NMV_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 5/12/2022 10:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Vehicle_ID] [int] NOT NULL,
	[License_Plate] [varchar](7) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Year] [int] NULL,
	[VIN] [varchar](17) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5001, 1001, 6001, 7001, 8001)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5002, 1002, 6002, 7002, 8002)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5003, 1003, 6003, 7003, 8003)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5004, 1004, 6004, 7004, 8004)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5005, 1005, 6005, 7005, 8005)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5006, 1006, 6006, 7006, 8006)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5007, 1007, 6007, 7007, 8007)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5008, 1008, 6008, 7008, 8008)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5009, 1009, 6009, 7009, 8009)
GO
INSERT [dbo].[Driver_Infractions] ([Driver_Infraction_ID], [Driver_ID], [Infractions_NMV_ID], [Infractions_MV_ID], [Warrant_ID]) VALUES (5010, 1010, 6010, 7010, 8010)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3001, 1001, 2001)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3002, 1002, 2002)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3003, 1003, 2003)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3004, 1004, 2004)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3005, 1005, 2005)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3006, 1006, 2006)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3007, 1007, 2007)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3008, 1008, 2008)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3009, 1009, 2009)
GO
INSERT [dbo].[Driver_Vehicles] ([Driver_Vehicles_ID], [Driver_ID], [Vehicle_ID]) VALUES (3010, 1010, 2010)
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1001, N'T934923958766', N'546-92-8233')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1002, N'L934472958139', N'531-40-0023')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1003, N'V967372950025', N'549-33-9089')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1004, N'P932472958233', N'556-31-0043')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1005, N'Q954372958351', N'559-99-9999')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1006, N'W949972954994', N'550-01-0243')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1007, N'R778872954792', N'551-19-1965')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1008, N'Q143372956900', N'552-27-1987')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1009, N'W894172955555', N'555-55-2288')
GO
INSERT [dbo].[Drivers] ([Driver_ID], [Drivers_License_Number], [SSN]) VALUES (1010, N'K658072951376', N'552-52-2258')
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4001, N'T934923958766', N'Mitchell', N'Alan', N'Hoffman', N'627 Washburn Ave. N.', N'Minneapolis', N'MN', N'55423', CAST(N'1980-11-02' AS Date), N'M', N'Brown', N'6.0 ft', 230, N'D', 1, CAST(N'2019-06-04' AS Date), CAST(N'2024-06-04' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4002, N'L934472958139', N'Victoria', N'Candace', N'Flivversham', N'893 W. Hopkins Circle', N'Bloomington', N'MN', N'55432', CAST(N'1990-11-15' AS Date), N'F', N'Hazel', N'5.5 ft', 155, N'D', 1, CAST(N'2018-09-22' AS Date), CAST(N'2023-09-22' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4003, N'V967372950025', N'Madelyn', N'Montgomery', N'Pyle', N'1121 North Cupcheck Blvd.', N'White Bear Lake', N'MN', N'55544', CAST(N'2000-11-15' AS Date), N'F', N'Blue', N'5.7 ft', 185, N'D', 1, CAST(N'2018-10-09' AS Date), CAST(N'2023-10-09' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4004, N'P932472958233', N'Carol', N'Fiona', N'Pugh', N'233 Seaworthy Lane', N'Townberg', N'MN', N'55531', CAST(N'1995-05-25' AS Date), N'F', N'Blue', N'5.8 ft', 165, N'D', 1, CAST(N'2021-02-09' AS Date), CAST(N'2026-02-09' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4005, N'Q954372958351', N'Elwood', N'Paul', N'Gernsback', N'1331 Mediocre St.', N'Eagan', N'MN', N'55445', CAST(N'1985-02-02' AS Date), N'M', N'Brown', N'6.1 ft', 230, N'D', 1, CAST(N'2020-05-07' AS Date), CAST(N'2025-05-07' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4006, N'W949972954994', N'Lee', N'Jay', N'Keyes', N'1771 Falcon Court', N'Monticello', N'MN', N'55665', CAST(N'1975-03-08' AS Date), N'M', N'Brown', N'5.5 ft', 190, N'D', 1, CAST(N'2020-12-05' AS Date), CAST(N'2025-12-06' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4007, N'F600372954377', N'Earvin', N'Mervyn', N'Wallace', N'332 S. Yew Wand Blvd.', N'Elk River', N'MN', N'55655', CAST(N'1965-04-12' AS Date), N'M', N'Green', N'5.9 ft', 210, N'D', 1, CAST(N'2021-06-06' AS Date), CAST(N'2026-06-06' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4008, N'L931272959044', N'Patrick', N'Hatfield', N'Feldspar', N'319 Dromedary Way', N'Becker', N'MN', N'55666', CAST(N'1980-05-22' AS Date), N'M', N'Steel Grey', N'5.8 ft', 220, N'D', 1, CAST(N'2021-07-07' AS Date), CAST(N'2026-07-07' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4009, N'W894172955555', N'Rachel', N'Reese', N'Rumpot', N'910 Valleyview Vista', N'Foley', N'MN', N'55668', CAST(N'1990-06-26' AS Date), N'F', N'Blue', N'5.3 ft', 140, N'D', 1, CAST(N'2021-09-09' AS Date), CAST(N'2026-09-09' AS Date))
GO
INSERT [dbo].[Drivers_Licenses] ([Drivers_License_ID], [Drivers_License_Number], [FirstName], [MiddleName], [LastName], [StreetAddress], [City], [State], [Zip_Code], [Date_of_Birth], [Gender], [Eye_Color], [Height], [Weight], [Class], [Donor_Is_Checked], [Date_Issued], [Date_Expires]) VALUES (4010, N'K658072951376', N'Peter', N'Paul', N'Enmarry', N'5456 Wallpaper Dr.', N'Anoka', N'MN', N'55558', CAST(N'2000-07-29' AS Date), N'M', N'Brown', N'5.1 ft', 140, N'D', 1, CAST(N'2021-10-10' AS Date), CAST(N'2026-10-10' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8001, N'Hoffman Mitchell Alan', 42, N'Minneapolis', N'MN', N'Misdemeanor', N'Speeding', CAST(N'2022-04-01' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8002, N'Flivversham Victoria Candace', 32, N'Bloomington', N'MN', N'Misdemeanor', N'Reckless Driving', CAST(N'2022-04-04' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8003, N'Pyle Madelyn Montgomery', 22, N'White Bear Lake', N'MN', N'Gross Misdemeanor', N'Vehicular Destruction of Property', CAST(N'2022-04-19' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8004, N'Pugh Carol Fiona', 27, N'Townberg', N'MN', N'Felony', N'Resisting arrest/fleeing scene', CAST(N'2022-04-25' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8005, N'Gernsback Elwood Paul', 37, N'Minneapolis', N'MN', N'Gross Misdemeanor', N'Transporting dangerous materials.', CAST(N'2022-04-30' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8006, N'Keyes Lee Jay', 47, N'Minneapolis', N'MN', N'Gross Misdemeanor', N'Reckless driving.', CAST(N'2022-05-05' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8007, N'Wallace Earvin Mervyn', 57, N'Minneapolis', N'MN', N'Gross Misdemeanor', N'Vehicular destruction of city property.', CAST(N'2022-05-09' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8008, N'Feldspar Patrick Hatfield', 42, N'Becker', N'MN', N'Gross Misdemeanor', N'Attempted vehicular assault.', CAST(N'2022-05-10' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8009, N'Rumpot Rachel Reese', 32, N'Big Lake', N'MN', N'Misdemeanor', N'Destroyed a fired hydrant.', CAST(N'2022-04-10' AS Date))
GO
INSERT [dbo].[Drivers_With_Outstanding_Warrants] ([Warrant_ID], [Driver_Name_Last_First_Middle], [Age], [Last_Known_Location], [State], [Warrant_Type], [Charges], [Date_Issued]) VALUES (8010, N'Enmarry Peter Paul', 22, N'Las Vegas', N'NV', N'Felony', N'Attempted vehicular homicide.', CAST(N'2022-03-01' AS Date))
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7001, N'T934923958766', N'MPR 002', CAST(N'2022-03-17' AS Date), 1, 0, 0, 0, 0, 0, N'Clocked going 85 mph in a 60 mph zone.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7002, N'L934472958139', N'VVX 094', CAST(N'2020-03-19' AS Date), 0, 0, 0, 0, 1, 0, N'Ran stop sign at the corner of Maple and Hemlock.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7003, N'V967372950025', N'YNY 991', CAST(N'2020-03-19' AS Date), 0, 0, 0, 0, 1, 0, N'Ran stop sign at the corner of Elm and Whitsunday St.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7004, N'P932472958233', N'MER 774', CAST(N'2021-03-21' AS Date), 0, 0, 0, 0, 0, 1, N'Driving while under the influence.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7005, N'Q954372958351', N'HJK 888', CAST(N'2021-04-22' AS Date), 0, 0, 1, 0, 0, 0, N'Secure load violation.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7006, N'W949972954994', N'BVD 333', CAST(N'2021-05-29' AS Date), 1, 0, 0, 0, 0, 0, N'Speeding, doing 75 in a 35 mph zone.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7007, N'F600372954377', N'TRY 121', CAST(N'2021-10-03' AS Date), 0, 1, 0, 0, 0, 0, N'Seatbelt violation.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7008, N'L931272959044', N'GJK 755', CAST(N'2021-10-23' AS Date), 1, 0, 0, 0, 0, 0, N'Speeding through a school zone.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7009, N'W894172955555', N'YUK 323', CAST(N'2021-12-22' AS Date), 0, 0, 1, 0, 0, 0, N'Secure load violation - mattress on roof.')
GO
INSERT [dbo].[Infractions_Moving_Violations] ([Infractions_MV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Speeding_Is_Checked], [Seatbelt_Violation_Is_Checked], [Secure_Load_Is_Checked], [Reckless_Driving_Is_Checked], [Running_Stop_Sign_or_Traffic_Light_Is_Checked], [DWI_Is_Checked], [Description_of_Incident]) VALUES (7010, N'K658072951376', N'MKJ 873', CAST(N'2021-12-23' AS Date), 0, 0, 0, 0, 0, 1, N'DWI.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6001, N'T934923958766', N'MPR 002', CAST(N'2022-03-14' AS Date), 0, 1, 0, 0, 0, 1, N'Broken Tail-light and dangerously underinflated tires.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6002, N'L934472958139', N'VVX 094', CAST(N'2020-12-11' AS Date), 0, 0, 1, 0, 0, 0, N'Parked in front of a fire hydrant.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6003, N'V967372950025', N'YNY 991', CAST(N'2020-04-11' AS Date), 0, 0, 0, 1, 0, 0, N'Expired registration.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6004, N'P932472958233', N'MER 774', CAST(N'2020-09-01' AS Date), 0, 0, 0, 0, 0, 1, N'Muffler dragging on the ground.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6005, N'Q954372958351', N'HJK 888', CAST(N'2020-10-30' AS Date), 1, 0, 0, 0, 0, 0, N'Park in no parking zone.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6006, N'W949972954994', N'BVD 333', CAST(N'2019-10-31' AS Date), 0, 0, 0, 1, 0, 0, N'Expired registration.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6007, N'F600372954377', N'TRY 121', CAST(N'2018-10-13' AS Date), 0, 1, 0, 0, 0, 0, N'Two broken tail-lights.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6008, N'L931272959044', N'GJK 755', CAST(N'2017-10-17' AS Date), 0, 0, 0, 0, 0, 1, N'Maintenance Issue - No windshield.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6009, N'W894172955555', N'YUK 323', CAST(N'2021-12-21' AS Date), 1, 0, 0, 0, 0, 0, N'Illegally parked.')
GO
INSERT [dbo].[Infractions_Non_Moving_Violations] ([Infractions_NMV_ID], [Drivers_License_Number], [Vehicle_License_Plate], [Date_of_Infraction], [Parking_Violation_Is_Checked], [Broken_Taillight_Is_Checked], [Fire_Hydrant_Parking_Is_Checked], [Expired_Registration_or_Insurance_Is_Checked], [Lack_of_Registration_or_Insurance_Is_Checked], [Vehicle_Maintenance_Issue_Is_Checked], [Description_of_Incident]) VALUES (6010, N'K658072951376', N'MKJ 873', CAST(N'2022-01-05' AS Date), 0, 0, 0, 1, 0, 0, N'Expired registration.')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2001, N'MPR 002', N'Toyota', N'Camry', 2011, N'J1928374657483920')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2002, N'VVX 094', N'Plymouth', N'Valiant', 1971, N'U1922444657487736')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2003, N'YNY 991', N'Ford', N'Escort', 1999, N'B1894344657486695')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2004, N'MER 774', N'Saturn', N'Neon', 2005, N'H1840954657499487')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2005, N'HJK 888', N'Chevy', N'Malibu', 2012, N'Y7680954657567487')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2006, N'BVD 333', N'Ford', N'F-150', 2013, N'Z2230954657562332')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2007, N'TRY 121', N'Toyota', N'Camry', 2011, N'S7904954657569323')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2008, N'GJK 755', N'Nissan', N'Rogue', 2017, N'B4676954657567830')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2009, N'YUK 323', N'Mazda', N'Miata', 1993, N'A7867954657569827')
GO
INSERT [dbo].[Vehicles] ([Vehicle_ID], [License_Plate], [Make], [Model], [Year], [VIN]) VALUES (2010, N'MKJ 873', N'Mini', N'Cooper', 2003, N'C5682954657563787')
GO
ALTER TABLE [dbo].[Driver_Vehicles]  WITH CHECK ADD FOREIGN KEY([Driver_ID])
REFERENCES [dbo].[Drivers] ([Driver_ID])
GO
ALTER TABLE [dbo].[Driver_Vehicles]  WITH CHECK ADD FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Vehicles] ([Vehicle_ID])
GO
USE [master]
GO
ALTER DATABASE [Jensen_Database] SET  READ_WRITE 
GO
