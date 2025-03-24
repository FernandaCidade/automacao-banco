-- store procedure: agenda m�dicos
create procedure Agenda_Medicos
as
begin

--Pegar tabelas: medico, consulta e paciente

--  Pegar os dados de medico: 
-- 							nome_medico, especialidade, crm
--	Pegar os dados de consulta:
--								numero_consulta, data_consulta, horario_consulta
--	Pegar os dados de paciente:
--							nome_paciente, cpf, nome_plano, tipo_plano



SELECT dbo.medico.crm, dbo.medico.nome_medico, dbo.medico.especialidade, dbo.consulta.numero_consulta, dbo.consulta.data_consulta, dbo.consulta.horario_consulta, dbo.paciente.cpf, dbo.paciente.nome_paciente, dbo.paciente.nome_plano, 
                  dbo.paciente.tipo_plano
FROM     dbo.consulta INNER JOIN
                dbo.medico ON dbo.consulta.fk_medico_crm = dbo.medico.crm INNER JOIN
                dbo.paciente ON dbo.consulta.fk_paciente_cpf = dbo.paciente.cpf




end



execute Agenda_Medicos;

-- drop procedure Agenda_Medicos;

