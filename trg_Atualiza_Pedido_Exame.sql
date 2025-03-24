-- gatilho de c�lculo de valor a pagar da tabela pedido_exame 
create trigger Atualiza_Pedido_Exame
	on pedido_exame
	after insert
	as
    begin 
		SET NOCOUNT ON
		
		declare @num_ped as integer;
		select @num_ped = numero_pedido from inserted;
		
		
		declare @num_cons as integer;
		select @num_cons = fk_consulta_numero_consulta from inserted;
		
		
		
		declare @cod_ex as integer;
		select @cod_ex = fk_exame_codigo from inserted;
		
		
		declare @prc as money;
		select @prc = preco from exame where codigo = @cod_ex;
		
		
		
		declare @cpf_pac as varchar(20);
		select @cpf_pac = fk_paciente_cpf from consulta where numero_consulta = @num_cons;
		
		
		
		declare @tp_plan as varchar(20);
		select @tp_plan = tipo_plano from paciente where cpf = @cpf_pac;
	

		-- plano Especial
		if @tp_plan = 'Especial'
		begin
				update pedido_exame set valor_pagar = @prc - @prc * 100 / 100 where numero_pedido = @num_ped;
		end
		-- plano Padr�o
		if @tp_plan = 'Padr�o'
		begin
				update pedido_exame set valor_pagar = @prc - @prc * 30 / 100 where numero_pedido = @num_ped;
		end
		-- plano B�sico
		if @tp_plan = 'B�sico'
		begin
				update pedido_exame set valor_pagar = @prc - @prc * 10 / 100 where numero_pedido = @num_ped;
		end
		print 'Trigger (Atualiza Pedido de Exame) Encerrada';
	end


	-- drop trigger Atualiza_Pedido_Exame;
