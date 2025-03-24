
create procedure Historico_Pagamentos
as
begin
select


--Pegar tabelas: Paciente, consulta e pedido_exame

--  Pegar os dados de paciente: 
-- 								Nome_paciente, CPF 
--	Pegar os dados de consulta:
--								numero_consulta, data consulta
--	Pegar os dados de pedido_exame:
--								data_exame, valor_pagar


SELECT dbo.paciente.cpf, dbo.paciente.nome_paciente, dbo.consulta.numero_consulta, dbo.consulta.data_consulta, dbo.pedido_exame.data_exame, dbo.pedido_exame.valor_pagar
FROM     dbo.consulta INNER JOIN
                  dbo.paciente ON dbo.consulta.fk_paciente_cpf = dbo.paciente.cpf INNER JOIN
                  dbo.pedido_exame ON dbo.consulta.numero_consulta = dbo.pedido_exame.fk_consulta_numero_consulta




end

execute Historico_Pagamentos;

--drop procedure Historico_Pagamentos;

