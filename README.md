# Automação de banco de dados
A automação de banco de dados envolve a utilização de ferramentas e scripts para realizar tarefas rotineiras e complexas de forma automática. 
Com a automação, é possível otimizar o gerenciamento e a manutenção de bancos de dados, como backups, atualizações, monitoramento e até mesmo a criação de novos bancos ou tabelas.
Este guia é voltado para alunos que desejam aprender e aplicar técnicas de automação de banco de dados, tanto para ambientes de desenvolvimento quanto de produção.

### Estrutura do Guia
  - [Pré-requisitos](#pré-requisitos)
  - [Stored Procedure](#Stored-Procedure)
  - [Automação Trigger](#Trigger)

## 1. Pré-requisitos
Antes de começar, você precisa garantir que tenha os seguintes pré-requisitos instalados:

 - Ferramenta de Banco de dados: [SSMS](https://learn.microsoft.com/en-us/ssms/download-sql-server-management-studio-ssms)
 - Servidor: [SQL Server](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)

## 2. Stored-Procedure
No SQL Server, uma Procedure (ou Procedimento Armazenado) é um conjunto de comandos SQL pré-compilados e armazenados no banco de dados. 
Elas são usadas para executar tarefas repetitivas ou complexas, como inserir, atualizar ou consultar dados de maneira mais eficiente.
Uma vez criada, uma procedure pode ser chamada e executada sempre que necessário, sem a necessidade de reescrever os mesmos comandos SQL repetidamente.

### Como criar uma Procedure
A estrutura de uma Stored Procedure (Procedure Armazenada) no SQL Server é composta por três principais seções:

 - Cabeçalho (Header): Define o nome da procedure e, opcionalmente, parâmetros de entrada/saída.

```
CREATE PROCEDURE NomeDaProcedure
    @Parametro1 Tipo,
    @Parametro2 Tipo OUTPUT
```

 - Corpo (Body): Contém os comandos SQL a serem executados. Pode incluir consultas, inserções, atualizações, ou qualquer lógica SQL.
```
AS
BEGIN
    -- Comandos SQL aqui
    SELECT * FROM Tabela WHERE Coluna = @Parametro1;
END;

```
 - Execução: Após criar, a procedure é chamada com o comando EXEC:

```
AS
BEGIN
    -- Comandos SQL aqui
    SELECT * FROM Tabela WHERE Coluna = @Parametro1;
END;

```

Ao colocar o script em uma nova Query, iremos em "Views" (ou "Exibições" em português), clicaremos com o botão direito do mouse e clicaremos em "Nova Exibição"


![image](https://github.com/user-attachments/assets/2cb96bb7-4e9f-4458-adaf-227a9bb539f6)

Então escolheremos as tabelas para cada consulta, e escolheremos o dados que serão exibidos em um select.

![image](https://github.com/user-attachments/assets/51422f02-3246-4b85-a29c-a7b3297328b9)

Colocaremos o Select na Procedure

```
create procedure Resumo_Pagamentos @nome_pac varchar(40)
as
begin

SELECT dbo.paciente.cpf, dbo.paciente.nome_paciente, dbo.consulta.numero_consulta, dbo.consulta.data_consulta, dbo.pedido_exame.valor_pagar
FROM     dbo.consulta INNER JOIN
                  dbo.paciente ON dbo.consulta.fk_paciente_cpf = dbo.paciente.cpf INNER JOIN
                  dbo.pedido_exame ON dbo.consulta.numero_consulta = dbo.pedido_exame.fk_consulta_numero_consulta


execute Resumo_Pagamentos 'Leonardo Ribeiro';

```

## 3. Trigger
A estrutura de uma Trigger (Gatilho) no SQL Server é composta por três principais seções:

 - Cabeçalho (Header): Define o tipo de trigger (DML - como INSERT, UPDATE ou DELETE), o nome da trigger e a tabela ou vista em que ela será aplicada.

```
CREATE TRIGGER NomeDaTrigger
ON Tabela
AFTER INSERT

```
 - Corpo (Body): Contém a lógica SQL que será executada automaticamente quando o evento definido ocorrer (inserção, atualização ou exclusão). Pode incluir operações adicionais no banco de dados, como outras inserções, atualizações ou verificações.
```
AS
BEGIN
    -- Comandos SQL executados quando a trigger é acionada
    PRINT 'Um registro foi inserido!'
END;

```
- Execução: A trigger é executada automaticamente pelo SQL Server sempre que o evento especificado (como INSERT, UPDATE, ou DELETE) ocorrer na tabela associada.

