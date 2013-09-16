-- Database Creation
USE master
GO
CREATE DATABASE black_android
GO
USE black_android
GO
-- Table Script Creation
CREATE TABLE [rooms](
   [id] [int] IDENTITY(1,1)
   ,   [number] [nvarchar](-1)
            
   ,   [room_type_id] [int]
CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [room_type_features](
   [id] [int] IDENTITY(1,1)
   ,   [room_type_id] [int]
   ,   [feature_id] [int]
CONSTRAINT [PK_room_type_features] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [features](
   [id] [int] IDENTITY(1,1)
   ,   [feature] [nvarchar](-1)
            
CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [bookings](
   [id] [int] IDENTITY(1,1)
   ,   [room_id] [int]
   ,   [checkin] [DateTime]
   ,   [checkout] [DateTime]
   ,   [first_name] [nvarchar](-1)
            
   ,   [last_name] [nvarchar](-1)
            
   ,   [price] [Float]
   ,   [created] [DateTime]
   ,   [modified] [DateTime]
CONSTRAINT [PK_bookings] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [room_types](
   [id] [int]
   ,   [name] [nvarchar](-1)
            
   ,   [price] [Float]
CONSTRAINT [PK_room_types] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [services](
   [id] [int] IDENTITY(1,1)
   ,   [price] [Float]
CONSTRAINT [PK_services] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [booking_services](
   [id] [int] IDENTITY(1,1)
   ,   [booking_id] [int]
   ,   [service_id] [int]
   ,   [price] [Float]
   ,   [created] [DateTime]
   ,   [modified] [DateTime]
CONSTRAINT [PK_booking_services] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [comments](
   [id] [int] IDENTITY(1,1)
   ,   [booking_id] [int]
   ,   [comment] [DateTime]
   ,   [created] [DateTime]
   ,   [modified] [DateTime]
   ,   [published] [Bit]
CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED(
  id
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
-- Relationships Creation
ALTER TABLE [rooms] WITH CHECK ADD  CONSTRAINT [FK_room_types_rooms] FOREIGN KEY(room_type_id) REFERENCES [room_types] (id)
GO
ALTER TABLE [rooms] CHECK CONSTRAINT [FK_room_types_rooms]
GO
ALTER TABLE [room_type_features] WITH CHECK ADD  CONSTRAINT [FK_features_room_type_features] FOREIGN KEY(feature_id) REFERENCES [features] (id)
GO
ALTER TABLE [room_type_features] CHECK CONSTRAINT [FK_features_room_type_features]
GO
ALTER TABLE [room_type_features] WITH CHECK ADD  CONSTRAINT [FK_room_types_room_type_features] FOREIGN KEY(room_type_id) REFERENCES [room_types] (id)
GO
ALTER TABLE [room_type_features] CHECK CONSTRAINT [FK_room_types_room_type_features]
GO
ALTER TABLE [bookings] WITH CHECK ADD  CONSTRAINT [FK_rooms_bookings] FOREIGN KEY(room_id) REFERENCES [rooms] (id)
GO
ALTER TABLE [bookings] CHECK CONSTRAINT [FK_rooms_bookings]
GO
ALTER TABLE [booking_services] WITH CHECK ADD  CONSTRAINT [FK_services_booking_services] FOREIGN KEY(service_id) REFERENCES [services] (id)
GO
ALTER TABLE [booking_services] CHECK CONSTRAINT [FK_services_booking_services]
GO
ALTER TABLE [booking_services] WITH CHECK ADD  CONSTRAINT [FK_bookings_booking_services] FOREIGN KEY(booking_id) REFERENCES [bookings] (id)
GO
ALTER TABLE [booking_services] CHECK CONSTRAINT [FK_bookings_booking_services]
GO
ALTER TABLE [comments] WITH CHECK ADD  CONSTRAINT [FK_bookings_comments] FOREIGN KEY(booking_id) REFERENCES [bookings] (id)
GO
ALTER TABLE [comments] CHECK CONSTRAINT [FK_bookings_comments]
GO
