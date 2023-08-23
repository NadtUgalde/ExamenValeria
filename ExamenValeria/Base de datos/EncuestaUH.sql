create database EncuestaUH
use EncuestaUH

create table Encuestas
(	Numero int identity (1,1), 
	Nombre varchar(50), 
	Edad int, 
	Genero varchar (20),
	Correo varchar (50), 
	Partido_politico varchar (5),
	constraint pk_numero primary key (numero)
	)

	go

	create procedure Sp_Encuestas
		@Operacion int = 0,
		@numero int = 0,
		@Nombre varchar(50) = '',
		@Edad int =0, 
		@Genero varchar (20)='',
		@Correo varchar (50)='', 
		@Partido_politico varchar (5)=''

		as

		begin

		If @Operacion = 1  --Agregar
			begin
			insert into encuestaUH values (@Nombre,@Edad,@Genero,@Correo, @Partido_politico)
			end
		Else if @Operacion =2 --Borrar
			begin
			delete encuestaUH where numero=@numero
			end
		Else if @Operacion =3 --Modificar
			begin
			update encuestaUH set Nombre=@Nombre, edad=@Edad, genero=@Genero, correo=@Correo, partido_poliico=@Partido_politico
			where numero=@numero
			end
		Else if @Operacion =4 --Consultar
			begin
			select * from encuestaUH
			end
		end
go

--no lo he creado 
	CREATE procedure reportes
	@operacion int = 0,
	@numero int = 0,
	@nombre varchar(50) ='',
	@genero varchar (20)=''
	  as
		begin
			IF @OPERACION = 1  -- Reporte de todo  
				BEGIN 			
				SELECT  p.nombre as Bodega,b.nombre as Producto, pb.CANTIDAD as Cantidad
				FROM producto_bodega pb
				order by PB.CANTIDAD ASC
				END
			ELSE IF @OPERACION = 2 -- Reporet con filtro
				BEGIN 
				SELECT  p.nombre as Bodega,b.nombre as Producto, pb.CANTIDAD as Cantidad
				FROM producto_bodega pb
				where b.id = @id
				order by PB.CANTIDAD ASC
			END

			ELSE IF @OPERACION = 3 -- Reporte con filtro
				BEGIN 
				SELECT  p.nombre as Bodega,b.nombre as Producto, pb.CANTIDAD as Cantidad
				FROM producto_bodega pb
				INNER JOIN BODEGA b on b.id = pb.id_bodega
				INNER JOIN PRODUCTO1 p on p.id = pb.id_producto
				where p.nombre like '%'+ @nombre +'%'
				order by PB.CANTIDAD ASC
			END
		end
	GO
	--no lo he terminado 
