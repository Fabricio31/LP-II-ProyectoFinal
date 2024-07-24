CREATE DATABASE gamers_final_v2;
go
USE gamers_final_v2;
go

CREATE TABLE tb_user(
id_user INT IDENTITY PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
second_name VARCHAR(30) NOT NULL,
last_name_pat VARCHAR(30) NOT NULL,
last_name_mat VARCHAR(30) NOT NULL,
age INT NOT NULL,
email VARCHAR(90) NOT NULL,
num_phone CHAR(9) NOT NULL
);

insert into tb_user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Fabricio','Alexander','Becerra','Azana',20,'fabricio@gmail.com',999888777)

insert into tb_user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Raul','Daniel','Lopez','Carrasco',18,'raul@gmail.com',999888777)

insert into tb_user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Pedro','Manuel','Gonzales','Rios',27,'pedro@gmail.com',999888777)

insert into tb_user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Juan','Romeo','Vergara','Rodriguez',20,'juan@gmail.com',999888777)

insert into tb_user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Luis','Adrian','Tardillo','Sanchez',20,'luis@gmail.com',999888777)

select * from tb_user


CREATE TABLE tb_product(
id_product INT primary key,
name VARCHAR(255) NULL,
stock INT NOT NULL,
price DECIMAL(10,0) NOT NULL,
sku INT NOT NULL,
productDescription VARCHAR(255) NULL,
dateAdded VARCHAR(255) NULL,
addedBy VARCHAR(255) NULL
);
	--	#ID 1000 PARA CONSOLAS
insert into tb_product values (1000,'Xbox Series X',10,600.99,1,'Consola Xbox Series X White Edition','06-06-2023','Admin');
insert into tb_product values (1001,'Play Station 5',10,600.99,2,'Consola Play Station 5 Digital Edition','06-06-2023','Admin');
insert into tb_product values (1002,'PC Gaming',10,600.99,3,'PC Gaming Edition','06-06-2023','Admin');
	--	#ID 2000 PARA JUEGOS
insert into tb_product values (2000,'Red Dead Redemption II',10,600.99,4,'Juego Red Dead Redemption II Epic Games Version','06-06-2023','Admin');
insert into tb_product values (2001,'Cyberpunk 2077',10,600.99,5,'Juego Red Dead Redemption II GOG Version','06-06-2023','Admin');
	--	#ID 3000 PARA ACCESORIOS
insert into tb_product values (3000,'Mando Xbox One Wireless',10,600.99,6,'Mando Xbox One Wireless White Edition','06-06-2023','Admin');


CREATE TABLE tb_console(
id_console INT PRIMARY KEY,
name_console VARCHAR(50) NOT NULL,
description VARCHAR(80) NOT NULL,
FOREIGN KEY(id_console) REFERENCES tb_product(id_product)
);

alter table tb_console
  add model varchar(255) null;

 alter table tb_console
  add year varchar(255) null;

insert into tb_console values (1000,'Xbox Series X','Consola marca Xbox Series X','De Fabrica','2020');
insert into tb_console values (1001,'Play Station 5','Consola marca Play Station 5','De Fabrica','2020');
insert into tb_console values (1002,'PC','PC de sobre mesa 2023','Custom','2023');
select * from tb_console;


--modelo es decir tipo normal o la que tiene mas gb etc
--año  es decir fecha que salio el modelo de la consola 



CREATE TABLE tb_category
(
category_id Integer PRIMARY KEY,
category_name varchar(255)
);
INSERT into tb_category values(001, 'Accion');
INSERT into tb_category values(002, 'Aventura');
INSERT into tb_category values(003, 'Rol');
INSERT into tb_category values(004, 'Simulacion');
INSERT into tb_category values(005, 'Estrategia');
INSERT into tb_category values(006, 'Deportes');
INSERT into tb_category values(007, 'Carreras');
INSERT into tb_category values(008, 'Realidad Virtual');

select * from tb_category;


create table tb_platforms
(
platform_id Integer PRIMARY KEY,
plataform_name varchar(255)
);

insert into tb_platforms values (1,'Steam');
insert into tb_platforms values (2,'Epic Games');
insert into tb_platforms values (3,'GOG');
insert into tb_platforms values (4,'Origin');
insert into tb_platforms values (5,'Ubisoft');
insert into tb_platforms values (6,'Blizzard');

select * from tb_platforms;


CREATE TABLE tb_game(
id_game INT PRIMARY KEY,
name_game VARCHAR(50) NOT NULL,
description VARCHAR(80) NOT NULL,
type_console INT,
category_id INT,
platform_id INT,
FOREIGN KEY(id_game) REFERENCES tb_product(id_product),
FOREIGN KEY(type_console) REFERENCES tb_console(id_console),
FOREIGN KEY(category_id) REFERENCES tb_category(category_id),
FOREIGN KEY(platform_id) REFERENCES tb_platforms(platform_id)
);

insert into tb_game values (2000,'Red Dead Redemption II','Red Dead Redemption II',1002,002,2);
select * from tb_game;

create table tb_companies
(
	id_company int primary key,
    name_company varchar(255)
);

insert into tb_companies values (1,'Corsair');
insert into tb_companies values (2,'Razer');
insert into tb_companies values (3,'Lenovo');
insert into tb_companies values (4,'Hyperx');
insert into tb_companies values (5,'Logitech');
insert into tb_companies values (6,'Microsoft');
insert into tb_companies values (7,'Play Station');

select * from tb_companies;

CREATE TABLE tb_accessories(
id_accessories INT PRIMARY KEY,
name_accessories VARCHAR(50) NOT NULL,
description VARCHAR(80) NOT NULL,
id_company INT,
FOREIGN KEY(id_accessories) REFERENCES tb_product(id_product),
FOREIGN KEY(id_company) REFERENCES tb_companies(id_company)
);
insert into tb_accessories values (3000,'Mando Xbox One Wireless','Mando para xbox/pc inalambrico',6);
select * from tb_accessories;

CREATE TABLE tb_order_exchange(
id_order INT IDENTITY PRIMARY KEY,
id_user INT,
order_date DATETIME,
id_product INT,
id_user_exchange INT,
FOREIGN KEY(id_user) REFERENCES tb_user(id_user),
FOREIGN KEY(id_product) REFERENCES tb_product(id_product),
FOREIGN KEY(id_user_exchange) REFERENCES tb_user(id_user)
);

insert into tb_order_exchange(id_user,order_date,id_product,id_user_exchange)
values (1,'2023-12-31 23:59:59',2001,2)

select * from tb_order_exchange;

CREATE TABLE tb_order_buy(
id_order INT IDENTITY PRIMARY KEY,
id_user INT,
order_date DATETIME,
id_product INT,
FOREIGN KEY(id_user) REFERENCES tb_user(id_user),
FOREIGN KEY(id_product) REFERENCES tb_product(id_product)
);
insert into tb_order_buy (id_user,order_date,id_product) values (1,'2023-12-31 23:59:59',2000);
insert into tb_order_buy  (id_user,order_date,id_product)values (1,'2023-12-31 23:59:59',3000);
select * from tb_order_buy;


create table tb_admin
(
	id_admin int primary key,
	fullaname_admin varchar(255),
    username_admin varchar(255),
    password_admin varchar(255),
    email_admin varchar(255),
    phone_admin int
);

insert into tb_admin values (1,'Becerra Azana Fabricio Alexander','Admin01','Admin01','admin@gmail.com',999888777);
select * from tb_admin;


--#############################################################################################################################################################################
--#									LOS CAMPOS QUE NO TIENEN # SON LOS NUEVOS           																					#
--#############################################################################################################################################################################
--#TABLAS CON SUS CAMPOS 
	select * from tb_user; 																	--#id_user, first_name, second_name, last_name_pat, last_name_mat, age, email, num_phone
	select * from tb_product;																--#id_product, stock, price, id_user
	select * from tb_console;																--#id_console, name_console, description
    select * from tb_category;	
    select * from tb_platforms;
	select * from tb_game;																	--#id_game, name_game, description, type_console
    select * from tb_companies;
	select * from tb_accessories;															--#id_accessories, name_accessories, description
	select * from tb_order_exchange;														--#id_order, id_user, order_date, id_product, id_user_exchange
	select * from tb_order_buy;																--#id_user, order_date, id_product, id_user_buy
	select * from tb_admin;
--#############################################################################################################################################################################
--#TABLAS PARA CRUD 
	--# select * from tb_product;  --DSW CRUD YA ESTA HECHO
   -- # select * from tb_console;  --DSW CRUD PARA
   -- # select * from tb_game;	   --DSW CRUD PARA
   -- # select * from tb_accessories; --DSW CRUD PARA
	--# NUEVAS OPCIONES PARA CRUD :
   -- # select * from tb_category;	--DSW  OPCIONAL
	--# select * from tb_platforms;	--DSW  OPCIONAL
    --# select * from tb_companies;	--DSW  OPCIONAL
    
--#############################################################################################################################################################################
--#TABLAS RELACIONAS 
	select * from tb_user; 																	
	select * from tb_product;																
	select * from tb_console;																
    select * from tb_category;	
    select * from tb_platforms;
	select * from tb_game;																
    select * from tb_companies;
	select * from tb_accessories;															
	select * from tb_order_exchange;														
	select * from tb_order_buy;																
	select * from tb_admin;
    
	select * from tb_game g join tb_console c on g.type_console = c.id_console 
							join tb_category y on g.category_id = y.category_id
							join tb_platforms p on g.platform_id = p.platform_id;


	select 
	g.id_game,g.name_game,g.description,g.type_console,c.name_console,g.category_id,y.category_name,g.platform_id,p.plataform_name 
	from tb_game g join tb_console c on g.type_console = c.id_console 
				   join tb_category y on g.category_id = y.category_id
				   join tb_platforms p on g.platform_id = p.platform_id;
    

	select * from tb_accessories a join tb_companies c on a.id_company = c.id_company ;

	select 
    a.id_accessories,a.name_accessories,a.description,a.id_company,c.name_company
    from tb_accessories a join tb_companies c on a.id_company = c.id_company  ;  
    
    select * from tb_order_exchange o join tb_user u on o.id_user = u.id_user
									  join tb_product p on o.id_product = p.id_product
									  join tb_game g on p.id_product = g.id_game
									  join tb_user z on o.id_user_exchange = z.id_user;
    
    
	select * from tb_order_buy o join tb_user u on o.id_order = u.id_user
								 join tb_product p on o.id_product = p.id_product
								 join tb_game g on p.id_product =g.id_game;
    
    
    select * from tb_order_buy o join tb_user u on o.id_order = u.id_user 
								 join tb_product p on o.id_product = p.id_product
								 join tb_accessories a on p.id_product =a.id_accessories;
    
    
--#############################################################################################################################################################################
														--	#VISTA GENERAL DE LA BASE DE DATOS 
--#############################################################################################################################################################################
--#VISTA DE TODOS LOS PRODUCTOS COMPRADOS
select 
b.id_order,b.id_user,u.first_name,u.email,b.order_date,b.id_product,p.price
from tb_order_buy b join tb_user u on b.id_user = u.id_user join tb_product p on b.id_product = p.id_product 
 ;
-- #VISTA DE TODOS LOS JUEGOS COMPRADOS
select 
b.id_order,b.id_user,u.first_name,u.email,b.order_date,b.id_product,g.name_game,g.type_console,c.name_console,p.price
from tb_order_buy b join tb_user u on b.id_user = u.id_user join tb_product p on b.id_product = p.id_product join tb_game g on p.id_product = g.id_game join tb_console c 
on g.type_console = c.id_console  
 ;
 -- #VISTA DE TODOS LOS ACCESORIOS COMPRADOS
select 
b.id_order,b.id_user,u.first_name,u.email,b.order_date,b.id_product,a.name_accessories,p.price
from tb_order_buy b join tb_user u on b.id_user = u.id_user join tb_product p on b.id_product = p.id_product join tb_accessories a on p.id_product = a.id_accessories
 ; 
 --- ############################################################################################################################################################################# 
  

-- Esta se va usar para listar los productos sin relacionar
 select * from tb_product

 /*
  select * from tb_product p join tb_game g on p.id_product = g.id_game

  select * from tb_product p join tb_game g on p.id_product = g.id_game join tb_console c on  g.type_console= c.id_console
							 join tb_category y on  g.category_id = y.category_id
							 join tb_platforms s on g.platform_id = s.platform_id
 */

-- Esta se va usar para listar los productos + juegos
  select 
  p.id_product,g.name_game,p.stock,p.price,c.id_console,c.name_console,g.category_id,y.category_name,g.platform_id,s.plataform_name
   from tb_product p join tb_game g on p.id_product = g.id_game 
                     join tb_console c on  g.type_console= c.id_console
					 join tb_category y on  g.category_id = y.category_id
					 join tb_platforms s on g.platform_id = s.platform_id
					 go

/*
select * from tb_product p join tb_accessories a on  p.id_product = a.id_accessories 
						   join tb_companies c on a.id_company = c.id_company

*/
-- Esta se va usar para listar los productos + accesorios
select 
p.id_product,a.name_accessories,p.stock,p.price,c.id_company,c.name_company 
from tb_product p join tb_accessories a on  p.id_product = a.id_accessories 
join tb_companies c on a.id_company = c.id_company
go

		
-- STORE PROCEDURE PARA PRODUCTOS --
create proc usp_productos
as
	select * from tb_product
GO

exec usp_productos
go


create or alter proc usp_add_productos
@id int,
@nom varchar(255),
@stock int,
@price decimal,
@sku int,
@productDescription varchar(255),
@dateAdded varchar(255),
@addedBy varchar(255)
as
insert tb_product Values (@id,@nom,@stock,@price,@sku,@productDescription,@dateAdded,@addedBy)

exec usp_add_productos '1','USP','10','600.99','6','DESDE USP','06-06-2023','Admin'
go

create or alter proc usp_update_productos
@id int,
@nom varchar(255),
@stock int,
@price decimal,
@sku int,
@productDescription varchar(255),
@dateAdded varchar(255),
@addedBy varchar(255)
as
Update tb_product set name=@nom, stock=@stock,price=@price,sku=@sku,productDescription=@productDescription,dateAdded=@dateAdded,addedBy=@addedBy
where id_product=@id

exec usp_update_productos '1','USP actualizado','10','600.99','6','DESDE USP','06-06-2023','Admin'
go

create or alter proc usp_search_productos
@nom varchar(255)
as
select id_product, name, stock, price,sku, productDescription,dateAdded,addedBy from tb_product
where name like '%'+@nom+'%'


EXEC usp_search_productos 'PC GAMING'
go

create or alter proc usp_delete_productos
@idpro int
as
begin
delete tb_product where id_product=@idpro
end

select * from tb_product

exec usp_delete_productos 1

-- STORE PROCEDURE PARA ACCESORIOS --
create or alter proc usp_accesorios
as
select * from tb_accessories
go


create or alter proc usp_add_accesorios
@id int,
@nom varchar(255),
@desc varchar(255),
@company int
as
insert tb_accessories Values (@id,@nom,@desc,@company)

--exec usp_add_accesorios 3002,'Prueba','Prubea','5'
--go

create or alter proc usp_update_accesorios
@id int,
@nom varchar(255),
@desc varchar(255),
@company int
as
Update tb_accessories set name_accessories=@nom, description=@desc,id_company=@company
where id_accessories=@id

--exec usp_update_accesorios 3000,'Teclado Gaming Logitech Wireless','Teclado Gaming Logitech Wireless',5
go

create or alter proc usp_search_accesorios
@nom varchar(255)
as
select id_accessories, name_accessories, description, id_company from tb_accessories
where name_accessories like '%'+@nom+'%'

EXEC usp_search_accesorios 'Teclado'
go
-- Agregando Modulo Iniciar Sesion: 
create table tb_employee
(
	nombre varchar(20) not null UNIQUE,
	clave varchar(20) not null,
	email varchar(255) not null
)
go

insert tb_employee
Values('jperez','12345','jperez@gmail.com'),('pgarcia','54321','pgarcia@gmail.com')
go

create or alter proc usp_users
As
Select * from tb_employee
go

insert into tb_employee values ('test','test','test@test.com')
---- Registrar la canasta pedido
create table tb_pedido
(
	idpedido int not null primary key,
	fechapedido datetime default(getdate()),
	dnicli varchar(8),
	nomcli varchar(150),
	emailcli varchar(255)
)
go
create table tb_pedidodeta
(
	idpedido int references tb_pedido,
	idproducto int references tb_product,
	preUni decimal,
	cantidad int
)
go

create or alter proc usp_pedido_add
@id int,
@dni varchar(8),
@nom varchar(150),
@email varchar(255)
as 
insert tb_pedido(idpedido,dnicli,nomcli,emailcli) values (@id,@dni,@nom,@email)
go

exec usp_pedido_add 1,'72185855','Fabricio','correo@correo.com'
go

create or alter proc usp_pedido_deta_add
@id int,
@idproducto int,
@pre decimal,
@cantidad int
as 
insert tb_pedidodeta values (@id,@idproducto,@pre,@cantidad)
go

exec usp_pedido_deta_add 1,'2000',599,1
go

create or alter proc usp_productos_actualizar
@idproducto int,
@cantidad int
as 
update tb_product set stock-=@cantidad where id_product = @idproducto
go

exec usp_productos_actualizar 2000,1
go

-- Store Procedure Consolas
create or alter proc usp_console
As
Select * from tb_console
go

exec usp_console
go

create or alter proc usp_search_console
@nom varchar(255)
as
select id_console, name_console, description, model, year from tb_console
where name_console like '%'+@nom+'%'

EXEC usp_search_console 'Xbox Series X'
go

create or alter proc usp_add_console
@id int,
@nom varchar(255),
@desc varchar(255),
@model varchar(255),
@year varchar(255)
as
insert tb_console Values (@id,@nom,@desc,@model,@year)

exec usp_add_console 1003,'Prueba','Prubea','Prueba','2023'
go

create or alter proc usp_update_console
@id int,
@nom varchar(255),
@desc varchar(255),
@model varchar(255),
@year varchar(255)
as
Update tb_console set name_console=@nom, description=@desc,model=@model, year=@year
where id_console=@id

exec usp_update_console 1003,'Prueba','Actualizado','Prueba','2023'
go

-- Store Procedure Juegos
create or alter proc usp_juegos
As
Select * from tb_game
go

exec usp_juegos
go

create or alter proc usp_search_juegos
@nom varchar(255)
as
select id_game, name_game, description, type_console, category_id, platform_id from tb_game
where name_game like '%'+@nom+'%'

EXEC usp_search_juegos 'Red Dead Redemption II'
go

create or alter proc usp_add_juegos
@id int,
@nom varchar(255),
@desc varchar(255),
@console int,
@categ int,
@plat int
as
insert tb_game Values (@id,@nom,@desc,@console,@categ,@plat)

exec usp_add_juegos 2001,'Prueba','Prubea','1002','2','2'
go

create or alter proc usp_update_juegos
@id int,
@nom varchar(255),
@desc varchar(255),
@console int,
@categ int,
@plat int
as
Update tb_game set name_game= @nom, description = @desc, type_console = @console, category_id = @categ, platform_id = @plat
where id_game = @id

exec usp_update_juegos 2001,'Prueba','Actualizado','1002','2','2'
go


-- Store Procedure Company
create or alter proc usp_company
As
Select * from tb_companies
go

exec usp_company
go

-- Store Procedure para CODIGO DE CATEGORIA	CODIGO DE PLATAFORMA CODIGO DE CONSOLA
create or alter proc usp_consolas
As
Select * from tb_console
go

exec usp_consolas
go

create or alter proc usp_categoria
As
Select * from tb_category
go

exec usp_categoria
go

create or alter proc usp_plataforma
As
Select * from tb_platforms
go

exec usp_plataforma
go


-- Añadiendo reportes a la canasta

--select * from tb_pedido

--select idpedido, idproducto, name, productDescription, preUni, cantidad from tb_pedidodeta d join tb_product p on d.idproducto = p.id_product order by idpedido asc


-- tb_pedido, tb_pedidodeta, tb_product

select d.idpedido, idproducto, name,productDescription, preUni,cantidad,fechapedido,nomcli,emailcli,dnicli from tb_pedidodeta d join tb_pedido p on d.idpedido = p.idpedido join tb_product t on d.idproducto = t.id_product order by p.idpedido asc;
go

-- Store Procedure Reporte de Compras

create or alter proc usp_reporte
as
select d.idpedido, idproducto, name,productDescription, preUni,cantidad,fechapedido,nomcli,emailcli,dnicli from tb_pedidodeta d join tb_pedido p on d.idpedido = p.idpedido join tb_product t on d.idproducto = t.id_product order by p.idpedido asc
go

exec usp_reporte
go

