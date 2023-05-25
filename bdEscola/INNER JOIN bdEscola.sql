USE bdEscola3
--1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
			INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
				ORDER BY[nomeAluno] ASC
--2)  Apresentar a quantidade de alunos matriculados por nome do curso;
	SELECT  COUNT(idAluno) 'Alunos Matriculados', nomeCurso FROM tbCurso
		INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso
			INNER JOIN tbMatricula ON tbTurma.idTurma = tbMatricula.idTurma
				GROUP BY nomeCurso
--3 Apresentar a quantidade de alunos matriculados por nome da turma;
	SELECT COUNT(idAluno) 'Alunos Matriculados', nomeTurma FROM tbTurma
		INNER JOIN tbMatricula ON tbTurma.idTurma = tbMatricula.idTurma
			GROUP BY nomeTurma
--4 Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;
SELECT COUNT(idAluno)'Matriculados em Maio de 2016' FROM tbMatricula
	WHERE idAluno LIKE '%05/2016%'
--5 Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
	SELECT nomeAluno, nomeTurma, nomeCurso FROM tbAluno
		INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
			INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
				INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
				GROUP BY nomeAluno, nomeTurma, nomeCurso
				ORDER BY [nomeAluno] ASC
--6 Apresentar o nome dos cursos e os horários em que eles são oferecidos
	SELECT nomeCurso, CONVERT(VARCHAR(5), (horarioTurma), 108) FROM tbCurso
		INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso
	
--7 Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
	SELECT COUNT(naturalidadeAluno) 'Quantidade Alunos Matriculados no ingles', naturalidadeAluno FROM tbAluno
		INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
			INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
			WHERE nomeCurso LIKE '%ingles%'
		GROUP BY naturalidadeAluno, nomeCurso

 -- 8)Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa **
    SELECT tbAluno.nomeAluno, CONVERT(VARCHAR, tbMatricula.dataMaticula, 103) AS "Data da Matricula"
	FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
	
 --9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de ingl�s 
	SELECT DISTINCT  nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbCurso on tbCurso.idCurso= tbCurso.idCurso
	WHERE idCurso LIKE '1' AND nomeAluno LIKE 'a%'

 --10)Apresentar a quantidade de matriculas feitas no ano de 2016
	SELECT SUM(tbMatricula.idTurma) dataMaticula FROM tbMatricula
	WHERE YEAR(dataMaticula)=2016


 --11)Apresentar a quantidade de matriculas por nome do curso
	SELECT  COUNT(idAluno) 'Alunos Matriculados', nomeCurso FROM tbCurso
		INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso
			INNER JOIN tbMatricula ON tbTurma.idTurma = tbMatricula.idTurma
				GROUP BY nomeCurso

 --12)Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00
	SELECT DISTINCT nomeAluno, valorCurso FROM tbMatricula
	INNER JOIN tbAluno ON tbAluno.nomeAluno = tbAluno.nomeAluno
	INNER JOIN tbCurso ON tbCurso.valorCurso = tbCurso.valorCurso
	WHERE valorCurso  > 300 

 --13)Apresentar os nomes dos alunos que fazem o curso de alem�o
	SELECT DISTINCT nomeAluno,idCurso FROM tbAluno
	INNER JOIN tbmatricula ON tbMatricula.idAluno = tbMatricula.idAluno
	INNER JOIN tbCurso ON tbCurso.idCurso = tbCurso.idCurso
	WHERE idCurso like '2'
	 

