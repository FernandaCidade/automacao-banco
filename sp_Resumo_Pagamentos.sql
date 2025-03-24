-- store procedure: resumo pagamentos por paciente
create procedure Resumo_Pagamentos @nome_pac varchar(40)
as
begin
--Pegar tabelas: Paciente, consulta 

--  Pegar os dados de paciente: 
-- 								Nome_paciente, CPF 
--	Pegar os dados de consulta:
--								numero_consulta, data consulta
--  Pegar os dados de pedido_exame: 
-- 								valor_pagar

SELECT dbo.paciente.cpf, dbo.paciente.nome_paciente, dbo.consulta.numero_consulta, dbo.consulta.data_consulta, dbo.pedido_exame.valor_pagar
FROM     dbo.consulta INNER JOIN
                  dbo.paciente ON dbo.consulta.fk_paciente_cpf = dbo.paciente.cpf INNER JOIN
                  dbo.pedido_exame ON dbo.consulta.numero_consulta = dbo.pedido_exame.fk_consulta_numero_consulta


execute Resumo_Pagamentos 'Leonardo Ribeiro';

-- drop procedure Resumo_Pagamentos;
