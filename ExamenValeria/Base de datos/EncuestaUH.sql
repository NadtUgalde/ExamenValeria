create database EncuestaUH
use EncuestaUH

create table Encuestas
(	Numero int identity (1,1), 
	Nombre varchar(50),
	Genero varchar (20),
	Edad int, 
	Correo varchar (50), 
	Partido_politico varchar (5),
	constraint pk_numero primary key (numero)
	)

	go

	create procedure Sp_Encuestas
		@Operacion int = 0,
		@numero int = 0,
		@Nombre varchar(50) = '',
		@Genero varchar (20)='',
		@Edad int =0, 
		@Correo varchar (50)='', 
		@Partido_politico varchar (5)=''

		as

		begin

		If @Operacion = 1  --Agregar
			begin
			insert into Encuestas (Nombre,Genero, Edad, Correo, Partido_politico)
			values (@Nombre,@Genero, @Edad,@Correo, @Partido_politico)
			end
		Else if @Operacion =2 --Borrar
			begin
			delete Encuestas where numero=@numero
			end
		Else if @Operacion =3 --Consultar
			begin
			select * from Encuestas
			end
		end
go

 exec Sp_Encuestas 1,0, 'valeria','Femenino', 24 ,'naugalde@gmail.com', PLN
 exec Sp_Encuestas 3

 create table BitacoraEncuestas
		(	ID int identity(1, 1),
			Operacion varchar(20),
			FechaHora datetime default getdate(),
			Usuario varchar(50),
			Numero int,
			Nombre varchar(50),
			Genero varchar(20),
			Edad int,
			Correo varchar(50),
			Partido_politico varchar(5)
			)

		go

		create trigger TR_Encuestas
		on Encuestas
		after insert, update, delete
		as
		begin
			declare @Operacion varchar(20)
			set @Operacion = case
				when exists (select * from inserted) and exists (select * from deleted) then 'Modificar'
				when exists (select * from inserted) then 'Agregar'
				when exists (select * from deleted) then 'Borrar'
			end
    
			insert into BitacoraEncuestas (Operacion, Usuario, Numero, Nombre, Genero, Edad, Correo, Partido_politico)
			select @Operacion, SUSER_SNAME(), deleted.Numero, deleted.Nombre, deleted.Genero, deleted.Edad, deleted.Correo, deleted.Partido_politico
			from deleted
			union all
			select @Operacion, SUSER_SNAME(), inserted.Numero, inserted.Nombre, inserted.Genero, inserted.Edad, inserted.Correo, inserted.Partido_politico
			from inserted --obtiene el usuario de la maquina que lo ingresa
		end

		select *from BitacoraEncuestas



	create procedure Sp_ReporteEncuestas
	@ReporteTipo varchar(50)
		as
		begin
			if @ReporteTipo = 'T'--'CantidadTotalEncuestas'
			begin
				select 'Cantidad Total de Encuestas Realizadas' as Reporte, sum(1) as Cantidad
				from Encuestas
			end
			else if @ReporteTipo = 'M' --'CantidadPersonasMasculinas'
			begin
				select 'Cantidad de Encuestas Masculinas' as Genero, count(*) as Cantidad
				from Encuestas
				where Genero = 'Masculino'
			end
			else if @ReporteTipo = 'F' --'CantidadPersonasFemeninas'
			begin
				select 'Cantidad de Encuestas Femeninas' as Genero, count(*) as Cantidad
				from Encuestas
				where Genero = 'Femenino'
			end
		end

	exec Sp_ReporteEncuestas 'T'
	exec Sp_ReporteEncuestas 'M'
	exec Sp_ReporteEncuestas 'F'