-- store procedure: exames solicitados em ordem de m�dico
create procedure Exames_Solicitados
as
begin


--Pegar tabelas: medico, consulta e pedido_exame

--  Pegar os dados de medico: 
-- 							Nome_medico, CRM, Especialidade
--	Pegar os dados de consulta:
--								numero_consulta
--	Pegar os dados de pedido de pedido_exame:
--											p.numero_pedido, p.data_exame, e.codigo, e.especificacao
end

execute Exames_Solicitados;

-- drop procedure Exames_Solicitados;

