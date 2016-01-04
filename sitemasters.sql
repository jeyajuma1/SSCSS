USE [mscss_qa]
GO
/****** Object:  Table [dbo].[site_business_actions]    Script Date: 12/30/2015 10:12:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_business_actions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[risk_id] [text] NULL,
	[name] [text] NULL,
	[description] [text] NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_site_business_actions_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_site_business_actions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_business_activities]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_business_activities](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_site_business_activities_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_business_answers]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_business_answers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[self_answer_id] [smallint] NOT NULL,
	[self_comment] [text] NULL,
	[sitemaster_id] [int] NOT NULL,
	[onsite_answer_id] [smallint] NULL,
	[onsite_comment] [text] NULL,
	[ms_id] [int] NULL,
	[self_file_name] [nvarchar](255) NULL,
	[self_file_description] [text] NULL,
	[self_file_type] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[activity_id] [bigint] NULL,
 CONSTRAINT [PK_site_business_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_business_assets]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_business_assets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[activity_id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[activity] [text] NULL,
	[category_name] [text] NULL,
 CONSTRAINT [PK_site_business_assets_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_business_categories]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_business_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL CONSTRAINT [DF_site_business_categories_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_site_business_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_business_questions]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[site_business_questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[order] [int] NULL,
	[availability] [int] NULL,
	[category] [text] NULL,
	[created_at] [datetime] NULL CONSTRAINT [DF_site_business_questions_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[activities] [text] NULL,
	[category_id] [nvarchar](max) NULL,
	[activity_id] [varchar](255) NULL,
 CONSTRAINT [PK_site_business_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[site_business_risks]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_business_risks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[asset_id] [bigint] NULL,
	[name] [nvarchar](255) NULL,
	[created_at] [datetime] NULL CONSTRAINT [DF_site_business_risks_created_at]  DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[asset_ids] [text] NULL,
 CONSTRAINT [PK_site_business_risks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_leak_incident_histories]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_leak_incident_histories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sitemaster_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[incident_date] [datetime] NULL,
	[incident_type] [nvarchar](50) NOT NULL,
	[root_cause] [nvarchar](255) NOT NULL,
	[corrective_action_title] [nvarchar](255) NOT NULL,
	[corrective_action_description] [text] NULL,
	[supplier_contact] [nvarchar](100) NULL,
	[deadline_date] [datetime] NULL,
	[created_at] [datetime] NULL DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_site_leak_incident_histories_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_leak_prevention_assessments]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_leak_prevention_assessments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sitemaster_id] [int] NOT NULL,
	[leak_id] [bigint] NULL,
	[risk_id] [bigint] NULL,
	[risk] [nvarchar](255) NOT NULL,
	[action_id] [text] NULL,
	[action_name] [text] NULL,
	[action_description] [text] NULL,
	[status] [nvarchar](100) NULL,
	[status_date] [datetime] NULL,
	[file_name] [nvarchar](255) NULL,
	[file_description] [text] NULL,
	[file_type] [nvarchar](255) NULL,
	[verified_by] [bigint] NULL,
	[verified_status] [nvarchar](255) NULL,
	[verified_date] [datetime] NULL,
	[created_at] [datetime] NULL DEFAULT (getdate()),
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[inc_id] [int] NULL,
	[sort] [int] NOT NULL CONSTRAINT [DF_site_leak_prevention_assessments_sort]  DEFAULT ((1)),
 CONSTRAINT [PK_site_leak_prevention_assessments_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_leak_risk_analyses]    Script Date: 12/30/2015 10:12:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[site_leak_risk_analyses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sitemaster_id] [int] NULL,
	[activity_id] [bigint] NULL,
	[asset_id] [text] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_site_leak_risk_analyses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[site_business_answers]  WITH CHECK ADD  CONSTRAINT [FK_site_business_answers_site_business_activities] FOREIGN KEY([activity_id])
REFERENCES [dbo].[site_business_activities] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[site_business_answers] CHECK CONSTRAINT [FK_site_business_answers_site_business_activities]
GO
ALTER TABLE [dbo].[site_business_assets]  WITH NOCHECK ADD  CONSTRAINT [site_business_assets$site_business_assets_activity_id_foreign] FOREIGN KEY([activity_id])
REFERENCES [dbo].[site_business_activities] ([id])
GO
ALTER TABLE [dbo].[site_business_assets] CHECK CONSTRAINT [site_business_assets$site_business_assets_activity_id_foreign]
GO
ALTER TABLE [dbo].[site_business_risks]  WITH CHECK ADD  CONSTRAINT [FK_site_business_risks_site_business_assets1] FOREIGN KEY([asset_id])
REFERENCES [dbo].[site_business_assets] ([id])
GO
ALTER TABLE [dbo].[site_business_risks] CHECK CONSTRAINT [FK_site_business_risks_site_business_assets1]
GO
ALTER TABLE [dbo].[site_leak_incident_histories]  WITH NOCHECK ADD  CONSTRAINT [site_leak_incident_histories$site_leak_incident_histories_sitemaster_id_foreign] FOREIGN KEY([sitemaster_id])
REFERENCES [dbo].[sitemasters] ([id])
GO
ALTER TABLE [dbo].[site_leak_incident_histories] CHECK CONSTRAINT [site_leak_incident_histories$site_leak_incident_histories_sitemaster_id_foreign]
GO
ALTER TABLE [dbo].[site_leak_prevention_assessments]  WITH NOCHECK ADD  CONSTRAINT [site_leak_prevention_assessments$site_leak_prevention_assessments_sitemaster_id_foreign] FOREIGN KEY([sitemaster_id])
REFERENCES [dbo].[sitemasters] ([id])
GO
ALTER TABLE [dbo].[site_leak_prevention_assessments] CHECK CONSTRAINT [site_leak_prevention_assessments$site_leak_prevention_assessments_sitemaster_id_foreign]
GO
ALTER TABLE [dbo].[site_leak_risk_analyses]  WITH CHECK ADD  CONSTRAINT [FK_site_leak_risk_analyses_site_leak_risk_analyses] FOREIGN KEY([activity_id])
REFERENCES [dbo].[site_business_activities] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[site_leak_risk_analyses] CHECK CONSTRAINT [FK_site_leak_risk_analyses_site_leak_risk_analyses]
 GO


USE [mscss_qa]
GO
/****** Object:  Trigger [dbo].[update_site_business_answers]    Script Date: 1/4/2016 3:54:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create trigger [dbo].[update_site_business_answers] on [mscss_qa].[dbo].[site_leak_risk_analyses]
AFTER UPDATE,insert
AS 
  declare @id int;
  declare @sitemasterid int;
  declare @activtyid int;
  declare @activities table(activity int);
  declare @deleted_at datetime; 
BEGIN
	SELECT @id=id FROM inserted i;
	SELECT @sitemasterid=sitemaster_id FROM inserted i;
	SELECT @activtyid=activity_id FROM inserted i;
	insert into @activities select activity_id FROM inserted i where deleted_at IS NOT NULL;
	SELECT @deleted_at=deleted_at FROM inserted i;

	if (@deleted_at IS NOT NULL)
		update [mscss_qa].[dbo].site_business_answers SET deleted_at=GETDATE() where sitemaster_id=@sitemasterid and activity_id in (select * from @activities);

END

USE [mscss_qa]
GO
/****** Object:  Trigger [dbo].[insert_assessment_status]    Script Date: 1/4/2016 4:06:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[site_change_assessment_status] on [mscss_qa].[dbo].[site_leak_prevention_assessments]
AFTER INSERT,UPDATE
AS 
	declare @plan_staus_x float;
	declare @plan_staus_y float;
	declare @plan_staus int;
	declare @self_score float;
	declare @onsite_score float;
	declare @overall_stus float;
	declare @id int;
	declare @sid int;
BEGIN 
	SELECT @id=id FROM inserted i;
	SELECT @sid=sitemaster_id FROM inserted i;
    
	 
 SELECT @self_score=[self_assessment_score],@onsite_score=[onsite_assessment_score]  FROM [mscss_qa].[dbo].[sitemasters] WHERE id=@sid;

	 SELECT @plan_staus_y = sum(t.cnt),@plan_staus_x = sum(t.cal) FROM (SELECT status,count(status) as cnt,
		 case WHEN [site_leak_prevention_assessments].[status] IN ('Completed') THEN count(status)*2   
		      WHEN [site_leak_prevention_assessments].[status] IN ('In Progress') THEN count(status)*1  
			  WHEN [site_leak_prevention_assessments].[status] IN ('Not started') THEN 0  
		 END as cal     
	FROM [mscss_qa].[dbo].[site_leak_prevention_assessments] where sitemaster_id=@sid AND deleted_at IS NULL GROUP BY status) as t;

	SET	@plan_staus = (@plan_staus_x / (@plan_staus_y*2)) * 100;

	set @overall_stus = ((@plan_staus +  CEILING(@self_score) +  CEILING(@onsite_score))/300) * 100;

	UPDATE
	 [mscss_qa].[dbo].[sitemasters] SET action_plan_status = @plan_staus ,[overall_status]= @overall_stus WHERE id= @sid
END

