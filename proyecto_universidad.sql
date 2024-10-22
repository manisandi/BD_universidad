USE [Universidad]
GO
/****** Object:  Table [dbo].[Entidad_Cursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Cursos](
	[Codigo_Curso] [nvarchar](50) NOT NULL,
	[Curso] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_Profesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Profesores](
	[Codigo_Profesor] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_Profesores_Cursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Profesores_Cursos](
	[ID_Asignacion] [int] NOT NULL,
	[Codigo_Curso] [nvarchar](50) NOT NULL,
	[FK_Codigo_Profesor] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK__Entidad___0D8D5A8617F3EFF2] PRIMARY KEY CLUSTERED 
(
	[ID_Asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ListadoCursosProfesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear la función
CREATE FUNCTION [dbo].[ListadoCursosProfesores]()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        c.Codigo_Curso,
        c.Curso,
        p.Nombre AS Nombre_Profesor,
        p.Apellidos AS Apellidos_Profesor
    FROM 
        dbo.Entidad_Cursos AS c
    INNER JOIN 
        dbo.Entidad_Profesores_Cursos AS pc 
        ON c.Codigo_Curso = pc.Codigo_Curso
    INNER JOIN 
        dbo.Entidad_Profesores AS p 
        ON pc.FK_Codigo_Profesor = p.Codigo_Profesor
    WHERE
        c.IsDeleted = 0
        AND pc.IsDeleted = 0
        AND p.IsDeleted = 0
);

GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[ID_Alumno] [int] NOT NULL,
	[Cedula] [varchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Telefono_1] [nvarchar](15) NULL,
	[Telefono_2] [nvarchar](15) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[direccion] [nvarchar](max) NULL,
	[email] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK__Alumno__88C5CE6CE2FBF267] PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos_Horarios_Profesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos_Horarios_Profesores](
	[horario_id] [int] NOT NULL,
	[FK_codigo_curso] [nvarchar](50) NOT NULL,
	[dia_semana] [varchar](20) NULL,
	[hora_inicio] [time](7) NULL,
	[hora_fin] [time](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK__Cursos_H__5A38722806C4B239] PRIMARY KEY CLUSTERED 
(
	[horario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_Matricula_Alumnos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Matricula_Alumnos](
	[ID_Matricula] [int] NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[Codigo_Curso] [nvarchar](50) NULL,
	[fecha_matricula] [date] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK__Entidad___230086D75D370F0C] PRIMARY KEY CLUSTERED 
(
	[ID_Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad_Notas_Cursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad_Notas_Cursos](
	[ID_Nota] [int] NOT NULL,
	[ID_Alumno] [int] NOT NULL,
	[Codigo_Curso] [nvarchar](50) NULL,
	[Nota_Asignada] [decimal](5, 2) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Entidad___A3147DAE4226EF40] PRIMARY KEY CLUSTERED 
(
	[ID_Nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (1, N'807650321', N'María', N'Gutiérrez', N'8767-4321', N'8976-8765', CAST(N'1997-07-13' AS Date), N'Santa Lucia,Dota', N'mariagtz123@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (2, N'203450789', N'Carlos', N'López', N'8798-9876', NULL, CAST(N'1997-04-23' AS Date), N'lomas del Rio', N'carlitozlopez@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (3, N'304560890', N'Luisa', N'Martínez', N'6878-2345', N'555-7890', CAST(N'1994-03-05' AS Date), N'santo doningo, Heredia', N'luisam_artinez@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (4, N'405670901', N'Pedro', N'Hernández', N'7656-6789', NULL, CAST(N'2003-09-15' AS Date), N'Santa Ana', N'phernandez_85@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (5, N'506780012', N'Laura', N'Pérez', N'8755-3456', NULL, CAST(N'1990-02-28' AS Date), N'Desamparados', N'lperez1987@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (6, N'607890123', N'Andrés', N'García', N'8978-8901', N'7989-2345', CAST(N'2001-04-28' AS Date), N'desamparados', N'andresgarcia99@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (7, N'708900234', N'Ana', N'Rodríguez', N'8976-4567', NULL, CAST(N'2004-08-24' AS Date), N'San Pedro', N'anarodriguez_21@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (8, N'809010345', N'Javier', N'Díaz', N'7654-9012', NULL, CAST(N'1897-09-14' AS Date), N'Guadalupe,El Alto', N'jdiaz_73@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (9, N'900120356', N'Sofía', N'Torres', N'7676-5678', N'7078-1234', CAST(N'1998-04-29' AS Date), N'San Gabriel, Aserri', N'sofia.torres89@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (10, N'112230344', N'Gabriel', N'Sánchez', N'6587-2345', NULL, CAST(N'1993-03-18' AS Date), N'Llano Grande, Nicoya', N'gabrielsanchez76@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (11, N'202330455', N'Valeria', N'Ramírez', N'6123-6789', NULL, CAST(N'1997-01-23' AS Date), N'Moravia,San Jose', N'valeria.ram@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (12, N'303440566', N'Diego', N'Fernández', N'8132-1234', N'6983-5678', CAST(N'1990-08-28' AS Date), N'Villas del Sol,Curridabat', N'dfernandez_67@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (13, N'404550667', N'Carolina', N'Gómez', N'7612-9876', NULL, CAST(N'2001-06-27' AS Date), N'Tirrases,Curridabat', N'carogomez123@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (14, N'505660788', N'Mateo', N'Alvarez', N'8129-2345', NULL, CAST(N'2002-07-19' AS Date), N'La Libertad,Hojancha', N'mateo.alv@gmail.com', 0, NULL)
INSERT [dbo].[Alumno] ([ID_Alumno], [Cedula], [Nombre], [Apellidos], [Telefono_1], [Telefono_2], [Fecha_Nacimiento], [direccion], [email], [IsDeleted], [Activo]) VALUES (15, N'606770899', N'Isabella', N'Vargas', N'7989-7890', N'6555-2345', CAST(N'2005-08-09' AS Date), N'San Luis,Desamparados', N'isavargas44@gmail.com', 0, NULL)
GO
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (1, N'CS101', N'Lunes', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (2, N'CS102', N'Martes', CAST(N'10:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (3, N'CS103', N'Miércoles', CAST(N'13:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (4, N'CS104', N'Jueves', CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (5, N'CS105', N'Viernes', CAST(N'11:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (6, N'CS106', N'Lunes', CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (7, N'CS107', N'Martes', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (8, N'CS108', N'Miércoles', CAST(N'10:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (9, N'CS109', N'Jueves', CAST(N'13:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (10, N'CS110', N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (11, N'CS111', N'Lunes', CAST(N'11:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (12, N'CS112', N'Martes', CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (13, N'CS113', N'Miércoles', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (14, N'CS114', N'Jueves', CAST(N'10:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (15, N'CS115', N'Viernes', CAST(N'13:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[Cursos_Horarios_Profesores] ([horario_id], [FK_codigo_curso], [dia_semana], [hora_inicio], [hora_fin], [IsDeleted], [Activo]) VALUES (16, N'CS116', N'Lunes', CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
GO
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS101', N'Introduction to Computer Science', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS102', N'Advanced Programming', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS103', N'Database Management', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS104', N'Web Development', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS105', N'Artificial Intelligence', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS106', N'Software Engineering', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS107', N'Network Security', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS108', N'Data Science', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS109', N'Mobile Applications', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS110', N'Cloud Computing', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS111', N'IoT Fundamentals', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS112', N'Machine Learning', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS113', N'Cybersecurity', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS114', N'Game Development', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS115', N'Virtual Reality', 0, NULL)
INSERT [dbo].[Entidad_Cursos] ([Codigo_Curso], [Curso], [IsDeleted], [Activo]) VALUES (N'CS116', N'Blockchain Technology', 0, NULL)
GO
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (1, 1, N'CS101', CAST(N'2024-01-15' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (2, 2, N'CS102', CAST(N'2024-01-16' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (3, 3, N'CS103', CAST(N'2024-01-17' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (4, 4, N'CS104', CAST(N'2024-01-18' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (5, 5, N'CS105', CAST(N'2024-01-19' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (6, 6, N'CS106', CAST(N'2024-01-20' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (7, 7, N'CS107', CAST(N'2024-01-21' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (8, 8, N'CS108', CAST(N'2024-01-22' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (9, 9, N'CS109', CAST(N'2024-01-23' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (10, 10, N'CS110', CAST(N'2024-01-24' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (11, 11, N'CS111', CAST(N'2024-01-25' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (12, 12, N'CS112', CAST(N'2024-01-26' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (13, 13, N'CS113', CAST(N'2024-01-27' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (14, 14, N'CS114', CAST(N'2024-01-28' AS Date), 0, NULL)
INSERT [dbo].[Entidad_Matricula_Alumnos] ([ID_Matricula], [ID_Alumno], [Codigo_Curso], [fecha_matricula], [IsDeleted], [Activo]) VALUES (15, 15, N'CS115', CAST(N'2024-01-29' AS Date), 0, NULL)
GO
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (1, 3, N'CS116', CAST(95.00 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (2, 8, N'CS102', CAST(85.75 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (3, 14, N'CS103', CAST(92.00 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (4, 15, N'CS104', CAST(88.50 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (5, 13, N'CS105', CAST(90.25 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (6, 12, N'CS106', CAST(87.75 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (7, 7, N'CS107', CAST(91.25 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (8, 10, N'CS108', CAST(89.00 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (9, 9, N'CS109', CAST(86.50 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (10, 11, N'CS110', CAST(93.75 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (11, 1, N'CS111', CAST(87.00 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (12, 2, N'CS112', CAST(94.25 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (13, 4, N'CS113', CAST(88.75 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (14, 5, N'CS114', CAST(90.50 AS Decimal(5, 2)), 0)
INSERT [dbo].[Entidad_Notas_Cursos] ([ID_Nota], [ID_Alumno], [Codigo_Curso], [Nota_Asignada], [IsDeleted]) VALUES (15, 6, N'CS115', CAST(92.25 AS Decimal(5, 2)), 0)
GO
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P123', N'Ana', N'Gómez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P124', N'José', N'Martínez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P125', N'Elena', N'Pérez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P126', N'Miguel', N'González', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P127', N'Laura', N'Hernández', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P128', N'Francisco', N'López', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P129', N'Ana', N'García', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P130', N'Diego', N'Rodríguez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P131', N'Sofía', N'Díaz', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P132', N'Javier', N'Torres', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P133', N'Lucía', N'Sánchez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P134', N'Mateo', N'Ramírez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P135', N'Valeria', N'Fernández', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P136', N'Gabriel', N'Gómez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P137', N'Carolina', N'Alvarez', 0, NULL)
INSERT [dbo].[Entidad_Profesores] ([Codigo_Profesor], [Nombre], [Apellidos], [IsDeleted], [Activo]) VALUES (N'P138', N'Isabella', N'Vargas', 0, NULL)
GO
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (1, N'CS101', N'P123', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (2, N'CS102', N'P124', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (3, N'CS103', N'P125', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (4, N'CS104', N'P126', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (5, N'CS105', N'P127', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (6, N'CS106', N'P128', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (7, N'CS107', N'P129', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (8, N'CS108', N'P130', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (9, N'CS109', N'P131', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (10, N'CS110', N'P132', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (11, N'CS111', N'P133', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (12, N'CS112', N'P134', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (13, N'CS113', N'P135', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (14, N'CS114', N'P136', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (15, N'CS115', N'P137', 0, NULL)
INSERT [dbo].[Entidad_Profesores_Cursos] ([ID_Asignacion], [Codigo_Curso], [FK_Codigo_Profesor], [IsDeleted], [Activo]) VALUES (16, N'CS116', N'P138', 0, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Alumno_Cedula]    Script Date: 11/8/2024 23:23:36 ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [UQ_Alumno_Cedula] UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Alumno_Email]    Script Date: 11/8/2024 23:23:36 ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [UQ_Alumno_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_ID_Alumno]    Script Date: 11/8/2024 23:23:36 ******/
ALTER TABLE [dbo].[Entidad_Notas_Cursos] ADD  CONSTRAINT [UQ_ID_Alumno] UNIQUE NONCLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumno] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Alumno] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Cursos_Horarios_Profesores] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Cursos_Horarios_Profesores] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Entidad_Cursos] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Entidad_Cursos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Entidad_Matricula_Alumnos] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Entidad_Matricula_Alumnos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Entidad_Notas_Cursos] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Entidad_Profesores] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Entidad_Profesores] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Entidad_Profesores_Cursos] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Entidad_Profesores_Cursos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Cursos_Horarios_Profesores]  WITH CHECK ADD  CONSTRAINT [FK_Cursos_Horarios_Profesores_Entidad_Cursos] FOREIGN KEY([FK_codigo_curso])
REFERENCES [dbo].[Entidad_Cursos] ([Codigo_Curso])
GO
ALTER TABLE [dbo].[Cursos_Horarios_Profesores] CHECK CONSTRAINT [FK_Cursos_Horarios_Profesores_Entidad_Cursos]
GO
ALTER TABLE [dbo].[Entidad_Matricula_Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_Matricula_Alumnos_Alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[Alumno] ([ID_Alumno])
GO
ALTER TABLE [dbo].[Entidad_Matricula_Alumnos] CHECK CONSTRAINT [FK_Entidad_Matricula_Alumnos_Alumno]
GO
ALTER TABLE [dbo].[Entidad_Notas_Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_Notas_Cursos_Alumno] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[Alumno] ([ID_Alumno])
GO
ALTER TABLE [dbo].[Entidad_Notas_Cursos] CHECK CONSTRAINT [FK_Entidad_Notas_Cursos_Alumno]
GO
ALTER TABLE [dbo].[Entidad_Notas_Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_Notas_Cursos_Entidad_Cursos] FOREIGN KEY([Codigo_Curso])
REFERENCES [dbo].[Entidad_Cursos] ([Codigo_Curso])
GO
ALTER TABLE [dbo].[Entidad_Notas_Cursos] CHECK CONSTRAINT [FK_Entidad_Notas_Cursos_Entidad_Cursos]
GO
ALTER TABLE [dbo].[Entidad_Profesores_Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_Profesores_Cursos_Entidad_Cursos1] FOREIGN KEY([Codigo_Curso])
REFERENCES [dbo].[Entidad_Cursos] ([Codigo_Curso])
GO
ALTER TABLE [dbo].[Entidad_Profesores_Cursos] CHECK CONSTRAINT [FK_Entidad_Profesores_Cursos_Entidad_Cursos1]
GO
ALTER TABLE [dbo].[Entidad_Profesores_Cursos]  WITH CHECK ADD  CONSTRAINT [FK_Entidad_Profesores_Cursos_Entidad_Profesores] FOREIGN KEY([FK_Codigo_Profesor])
REFERENCES [dbo].[Entidad_Profesores] ([Codigo_Profesor])
GO
ALTER TABLE [dbo].[Entidad_Profesores_Cursos] CHECK CONSTRAINT [FK_Entidad_Profesores_Cursos_Entidad_Profesores]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAlumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAlumno]
    @ID_Alumno INT
AS
BEGIN
    UPDATE [dbo].[Alumno]
    SET [IsDeleted] = 1
    WHERE [ID_Alumno] = @ID_Alumno;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCursosHorariosProfesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCursosHorariosProfesores]
    @horario_id INT
AS
BEGIN
    UPDATE [dbo].[Cursos_Horarios_Profesores]
    SET [IsDeleted] = 1
    WHERE [horario_id] = @horario_id;
END;

GO
/****** Object:  StoredProcedure [dbo].[DeleteEntidadCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEntidadCursos]
    @Codigo_Curso NVARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[Entidad_Cursos]
    SET [IsDeleted] = 1
    WHERE [Codigo_Curso] = @Codigo_Curso;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEntidadMatriculaAlumnos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEntidadMatriculaAlumnos]
    @ID_Matricula INT
AS
BEGIN
    UPDATE [dbo].[Entidad_Matricula_Alumnos]
    SET [IsDeleted] = 1
    WHERE [ID_Matricula] = @ID_Matricula;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEntidadNotasCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEntidadNotasCursos]
    @ID_Nota INT
AS
BEGIN
    UPDATE [dbo].[Entidad_Notas_Cursos]
    SET [IsDeleted] = 1
    WHERE [ID_Nota] = @ID_Nota;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEntidadProfesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEntidadProfesores]
    @Codigo_Profesor NVARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[Entidad_Profesores]
    SET [IsDeleted] = 1
    WHERE [Codigo_Profesor] = @Codigo_Profesor;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteEntidadProfesoresCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEntidadProfesoresCursos]
    @ID_Asignacion INT
AS
BEGIN
    UPDATE [dbo].[Entidad_Profesores_Cursos]
    SET [IsDeleted] = 1
    WHERE [ID_Asignacion] = @ID_Asignacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarEntidadAlumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertarEntidadAlumno]
    @Cedula INT,
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50),
    @Telefono_1 NVARCHAR(15),
    @Telefono_2 NVARCHAR(15)
AS
BEGIN
        INSERT INTO Alumno (Cedula, Nombre, Apellidos, Telefono_1, Telefono_2)
        VALUES (@Cedula, @Nombre, @Apellidos, @Telefono_1, @Telefono_2);
END
;
GO
/****** Object:  StoredProcedure [dbo].[InsertarEntidadCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarEntidadCursos]
    @Codigo_Curso NVARCHAR(50),
    @Curso NVARCHAR(100),
    @Activo BIT
AS
BEGIN
        INSERT INTO Entidad_Cursos (Codigo_Curso, Curso, Activo)
        VALUES (@Codigo_Curso, @Curso, @Activo);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarEntidadProfesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarEntidadProfesores]
    @Codigo_Profesor NVARCHAR(50),
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50)
AS
BEGIN
        INSERT INTO Entidad_Profesores (Codigo_Profesor, Nombre, Apellidos)
        VALUES (@Codigo_Profesor, @Nombre, @Apellidos);
END
;
GO
/****** Object:  StoredProcedure [dbo].[Nuevo_Entidad_Notas_Cursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Nuevo_Entidad_Notas_Cursos]
    @Parametro1 INT
AS
BEGIN
    -- Definición del nuevo procedimiento
    SELECT * FROM SomeTable WHERE SomeColumn = @Parametro1;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarAlumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar un Alumno lógicamente
CREATE PROCEDURE [dbo].[sp_EliminarAlumno]
    @ID_Alumno INT
AS
BEGIN
    UPDATE dbo.Alumno
    SET Activo = 0
    WHERE ID_Alumno = @ID_Alumno;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCursoHorarioProfesor]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar un CursoHorarioProfesor lógicamente
CREATE PROCEDURE [dbo].[sp_EliminarCursoHorarioProfesor]
    @horario_id INT
AS
BEGIN
    UPDATE dbo.Cursos_Horarios_Profesores
    SET Activo = 0
    WHERE horario_id = @horario_id;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEntidadCurso]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar un EntidadCurso lógicamente
CREATE PROCEDURE [dbo].[sp_EliminarEntidadCurso]
    @Codigo_Curso NVARCHAR(50)
AS
BEGIN
    UPDATE dbo.Entidad_Cursos
    SET Activo = 0
    WHERE Codigo_Curso = @Codigo_Curso;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEntidadMatriculaAlumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar una EntidadMatriculaAlumno lógicamente
CREATE PROCEDURE [dbo].[sp_EliminarEntidadMatriculaAlumno]
    @ID_Matricula INT
AS
BEGIN
    UPDATE dbo.Entidad_Matricula_Alumnos
    SET Activo = 0
    WHERE ID_Matricula = @ID_Matricula;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEntidadProfesor]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar una EntidadProfesor lógicamente
CREATE PROCEDURE [dbo].[sp_EliminarEntidadProfesor]
    @Codigo_Profesor NVARCHAR(50)
AS
BEGIN
    UPDATE dbo.Entidad_Profesores
    SET Activo = 0
    WHERE Codigo_Profesor = @Codigo_Profesor;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEntidadProfesorCurso]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar una EntidadProfesorCurso lógicamente
CREATE PROCEDURE [dbo].[sp_EliminarEntidadProfesorCurso]
    @ID_Asignacion INT
AS
BEGIN
    UPDATE dbo.Entidad_Profesores_Cursos
    SET Activo = 0
    WHERE ID_Asignacion = @ID_Asignacion;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarAlumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarAlumno]
    @ID_Alumno INT,
    @Cedula VARCHAR(50),
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50),
    @Telefono_1 NVARCHAR(15),
    @Telefono_2 NVARCHAR(15),
    @Fecha_Nacimiento DATE,
    @direccion NVARCHAR(MAX),
    @email NVARCHAR(50)
AS
BEGIN
    UPDATE dbo.Alumno
    SET
        Cedula = @Cedula,
        Nombre = @Nombre,
        Apellidos = @Apellidos,
        Telefono_1 = @Telefono_1,
        Telefono_2 = @Telefono_2,
        Fecha_Nacimiento = @Fecha_Nacimiento,
        direccion = @direccion,
        email = @email
    WHERE ID_Alumno = @ID_Alumno;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCursosHorariosProfesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarCursosHorariosProfesores]
    @horario_id INT,
    @FK_codigo_curso NVARCHAR(50),
    @dia_semana VARCHAR(20),
    @hora_inicio TIME(7),
    @hora_fin TIME(7)
AS
BEGIN
    UPDATE dbo.Cursos_Horarios_Profesores
    SET
        FK_codigo_curso = @FK_codigo_curso,
        dia_semana = @dia_semana,
        hora_inicio = @hora_inicio,
        hora_fin = @hora_fin
    WHERE horario_id = @horario_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEntidadCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEntidadCursos]
    @Codigo_Curso NVARCHAR(50),
    @Curso NVARCHAR(100),
    @Activo BIT
AS
BEGIN
    UPDATE dbo.Entidad_Cursos
    SET
        Curso = @Curso,
        Activo = @Activo
    WHERE Codigo_Curso = @Codigo_Curso;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEntidadMatriculaAlumnos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEntidadMatriculaAlumnos]
    @ID_Matricula INT,
    @ID_Alumno INT,
    @Codigo_Curso NVARCHAR(50),
    @fecha_matricula DATE
AS
BEGIN
    UPDATE dbo.Entidad_Matricula_Alumnos
    SET
        ID_Alumno = @ID_Alumno,
        Codigo_Curso = @Codigo_Curso,
        fecha_matricula = @fecha_matricula
    WHERE ID_Matricula = @ID_Matricula;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEntidadNotasCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEntidadNotasCursos]
    @ID_Nota INT,
    @ID_Alumno INT,
    @Codigo_Curso NVARCHAR(50),
    @Nota_Asignada DECIMAL(5, 2)
AS
BEGIN
    UPDATE dbo.Entidad_Notas_Cursos
    SET
        ID_Alumno = @ID_Alumno,
        Codigo_Curso = @Codigo_Curso,
        Nota_Asignada = @Nota_Asignada
    WHERE ID_Nota = @ID_Nota;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEntidadProfesores]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEntidadProfesores]
    @Codigo_Profesor NVARCHAR(50),
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50)
AS
BEGIN
    UPDATE dbo.Entidad_Profesores
    SET
        Nombre = @Nombre,
        Apellidos = @Apellidos
    WHERE Codigo_Profesor = @Codigo_Profesor;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEntidadProfesoresCursos]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarEntidadProfesoresCursos]
    @ID_Asignacion INT,
    @Codigo_Curso NVARCHAR(50),
    @FK_Codigo_Profesor NVARCHAR(50)
AS
BEGIN
    UPDATE dbo.Entidad_Profesores_Cursos
    SET
        Codigo_Curso = @Codigo_Curso,
        FK_Codigo_Profesor = @FK_Codigo_Profesor
    WHERE ID_Asignacion = @ID_Asignacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerNotasAlumno]    Script Date: 11/8/2024 23:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	-- Crear el procedimiento almacenado
CREATE PROCEDURE [dbo].[VerNotasAlumno]
    @ID_Alumno INT
AS
BEGIN
    SELECT 
        a.Nombre AS Nombre_Alumno,
        a.Apellidos AS Apellidos_Alumno,
        c.Nombre AS Nombre_Curso,
        n.Nota
    FROM 
        Alumno a
        INNER JOIN Nota n ON a.ID_Alumno = n.ID_Alumno
        INNER JOIN Curso c ON n.ID_Curso = c.ID_Curso
    WHERE 
        a.ID_Alumno = @ID_Alumno;
END;
GO
