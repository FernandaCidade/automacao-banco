-- store procedure: exames solicitados em ordem de m�dico
create procedure Exames_Solicitados
as
begin


--Pegar tabelas: medico, consulta e pedido_exame, exame

--  Pegar os dados de medico: 
-- 							Nome_medico, CRM, Especialidade
--	Pegar os dados de consulta:
--								numero_consulta
--	Pegar os dados de pedido de pedido_exame:
--											p.numero_pedido, p.data_exame
--  Pegar os dados de pedido de exame:
--                              e.codigo, e.especificacao



SELECT dbo.medico.crm, dbo.medico.nome_medico, dbo.medico.especialidade, dbo.consulta.numero_consulta, dbo.pedido_exame.numero_pedido, dbo.pedido_exame.data_exame, dbo.exame.codigo, dbo.exame.especificacao
FROM     dbo.consulta INNER JOIN
                  dbo.medico ON dbo.consulta.fk_medico_crm = dbo.medico.crm INNER JOIN
                  dbo.pedido_exame ON dbo.consulta.numero_consulta = dbo.pedido_exame.fk_consulta_numero_consulta INNER JOIN
                  dbo.exame ON dbo.pedido_exame.fk_exame_codigo = dbo.exame.codigo

end

execute Exames_Solicitados;

-- drop procedure Exames_Solicitados;

