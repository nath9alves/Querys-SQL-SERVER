--Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:

--valor1 = 10
--valor2 = 5
--valor3 = 34
--valor4 = 7


--a)Crie uma nova vari�vel para armazenar o resultado da soma entre
--valor1 e valor2. Chame essa vari�vel de soma.

DECLARE @Resultado VARCHAR(4)
SET @Resultado = '15'
SELECT @Resultado AS Soma

--b)Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4. Chame essa vari�vel de subtracao.

DECLARE @Resultado VARCHAR(4)
SET @Resultado = '27'
SELECT @Resultado AS 'Subtra��o'

--c)Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o valor4. Chame essa vari�vel de multiplicacao.

DECLARE @Resultado VARCHAR(4)
SET @Resultado = '7'
SELECT @Resultado AS 'Multiplica��o'

--d)Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.
--Arredonde o resultado da letra d) para 2 casas decimais.

DECLARE @Resultado FLOAT
SET @Resultado = '4.85'
SELECT @Resultado AS 'DIVIS�O'

-------- > Resposta Alternativa Para Todas as quest�es acima <--------

DECLARE @Valor1 FLOAT
DECLARE @Valor2 FLOAT
DECLARE @Valor3 FLOAT
DECLARE @Valor4 FLOAT
DECLARE @ValorDiv FLOAT
DECLARE @ValorSoma FLOAT
DECLARE @ValorSub FLOAT
DECLARE @ValorMult FLOAT

SET @Valor1 = 10.3
SET @Valor2 = 5
SET @Valor3 = 34
SET @Valor4 = 7

SET @ValorDiv = @Valor3 / @Valor4
SET @ValorSoma = @Valor1 + @Valor2
SET @ValorSub = @Valor3 - @Valor4
SET @ValorMult = @Valor1 * @Valor4

SELECT @ValorDiv AS DIVIS�O
SELECT @ValorSoma AS SOMA
SELECT @ValorSub AS SUBTRA��O
SELECT @ValorMult AS MULTIPLICA��O


------------------------------------------------------------------------------------------------------------------------------------------//


-- Quest�o 2

--Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser especificado.


--a.Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.

DECLARE @Produto VARCHAR
SET @Produto = '1'
SELECT FORMAT (1, 'Celular') AS 'Produto'

--b.Declare uma vari�vel chamada �quantidade� e atribua o valor de 12.

DECLARE @Quantidade VARCHAR
SET @Quantidade = '2'
SELECT FORMAT (2, '12') AS 'Quantidade'


--c.Declare uma vari�vel chamada �preco� e atribua o valor 9.99.

DECLARE @Preco DECIMAL (5,2)
SET @Preco = 9.99
SELECT @Preco AS Preco


--d.Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre �quantidade� e �preco�.

DECLARE @Faturamento DECIMAL (5,2)
SET @Faturamento = 119.88
SELECT @Faturamento AS Faturamento

--e.Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.

DECLARE @Produto VARCHAR
DECLARE @Quantidade DECIMAL
DECLARE @Preco DECIMAL (5,2)
DECLARE @Faturamento DECIMAL (5,2)

SET @Produto = 1
SET @Quantidade = 12
SET @Preco = 9.99
SET @Faturamento = 119.88

SELECT @Produto AS Produto,
@Quantidade AS Quantidade,
@Preco AS Pre�o,
@Faturamento AS Faturamento


-------- > Resposta Alternativa Para Todas as quest�es acima <--------


DECLARE @Produto VARCHAR (30) = 'Celular'
DECLARE @Quantidade int = 12
DECLARE @Preco FLOAT = 9.99
DECLARE @Faturamento FLOAT = @Quantidade * @Preco 


SELECT @Produto AS Produto,
@Quantidade AS Quantidade,
@Preco AS Pre�o,
@Faturamento AS Faturamento


------------------------------------------------------------------------------------------------------------------------------------------//


--Quest�o 3


--Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de usu�rios. Em resumo, esses dados s�o:

--- Nome do usu�rio
--- Data de nascimento
--- Quantidade de pets que aquele usu�rio possui

--Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este usu�rio. Para simular estes dados, crie 3 vari�veis,
--chamadas: nome, data_nascimento e num_pets. Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.

--Dica: voc� precisar� utilizar as fun��es CAST e FORMAT para chegar no
--resultado.


DECLARE @Nome_usuario VARCHAR (50)
DECLARE @Data_Nascimento DATE
DECLARE @Qtd_Pets INT

SET @Nome_usuario = 'Andr�'
SET @Data_Nascimento = '1998/02/10'
SET @Qtd_Pets = 2

SELECT @Nome_usuario AS Nome,
FORMAT (@Data_Nascimento, 'dd/MM/yyyy') AS Data_Nascimento,
CAST (@Qtd_Pets AS VARCHAR(10)) AS Quantidade_Pets


-------- > Resposta Alternativa Para a Quest�o Acima <--------


DECLARE @nome VARCHAR (30),
@nascimento DATETIME,
@pets INT

SET @nome = 'Andr�'
SET @nascimento = '10/02/1998'
SET @pets = 2

SELECT 'Meu nome � ' + @nome + ', nasci em ' + FORMAT (@nascimento, 'dd/MM/yyyy') + ' e tenho ' + FORMAT (@pets, '0') + ' pets.'


------------------------------------------------------------------------------------------------------------------------------------------//


--Quest�o 4

--Voc� acabou de ser promovido e o seu papel ser� realizar um controle de qualidade sobre as lojas da empresa.

--A primeira informa��o que � passada a voc� � que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas
--fecharam. O seu primeiro desafio � descobrir o nome dessas lojas que fecharam no ano de 2008, para que voc� possa entender o motivo e mapear 
--planos de a��o para evitar que outras lojas importantes tomem o mesmo caminho.

--O seu resultado dever� estar estruturado em uma frase, com a seguinte estrutura:

--�As lojas fechadas no ano de 2008 foram: � + nome_das_lojas
--Obs: utilize o comando PRINT (e n�o o SELECT!) para mostrar o resultado.


DECLARE @nome_loja VARCHAR(100)
SET @nome_loja = ''

SELECT @nome_loja = @nome_loja + Storename + ', '
FROM DimStore
WHERE FORMAT (closedate, 'yyy') = 2008

PRINT 'As lojas fechadas no ano de 2008 foram: ' + @nome_loja


------------------------------------------------------------------------------------------------------------------------------------------//


--Quest�o 05


--Voc� precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para uma subcategoria espec�fica: �Lamps�.

--Utilize o conceito de vari�veis para chegar neste resultado.


SELECT * FROM DimProductSubcategory

DECLARE @id_subcategoria INT
DECLARE @subcategoria VARCHAR(100)

SET @subcategoria = 'R�dio'
SET @id_subcategoria = (SELECT ProductSubcategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = @subcategoria)

SELECT * FROM DimProduct

WHERE ProductSubcategoryKey = @id_subcategoria