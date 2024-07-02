--create table file_type(
--	id int identity(1,1), 
--	name nvarchar(100), 
--	description nvarchar(200)
--);

--create table column_per_file(
--	id int identity(1,1), 
--	file_type_id int, 
--	column_id int
--);

--create table [column](
--	id int identity(1,1), 
--	name nvarchar(100)
--);

--insert into file_type values ('Paycheck','Monthly payment'),('Expenses','Money spent monthly')
--insert into [column] values ('Name'),('Net income'),('Taxes'),('Groceries')
--insert into column_per_file values (1,1),(2,1),(1,2),(2,3),(2,4)

--select cpf.id,ft.name,ft.description,c.name from file_type ft 
--	inner join column_per_file cpf on ft.id = cpf.file_type_id 
--	inner join [column] c on c.id = cpf.column_id 
--	where ft.id = 1

select * from column_per_file

alter procedure columnNamePerFile (@fileTypeName nvarchar(100))
as
begin
	select c.name from file_type ft 
		inner join column_per_file cpf on ft.id = cpf.file_type_id 
		inner join [column] c on c.id = cpf.column_id 
		where ft.name = @fileTypeName
end

exec columnNamePerFile 'Expenses'

select * from file_type
select * from column_per_file
select * from [column]


create table #tempTable(
	
)