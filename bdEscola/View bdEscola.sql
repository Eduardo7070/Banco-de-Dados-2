USE bdEscola3

--1) Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio.
CREATE VIEW vwPreco_Baixo AS 
SELECT idCurso, nomeCurso, cargaHorariaCurso, valorCurso FROM tbCurso
WHERE valorCurso < (SELECT avg(valorCurso)FROM tbCurso)


SELECT * FROM vwPreco_Baixo


--2) Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.
SELECT nomeCurso FROM vwPreco_Baixo
ORDER BY cargaHorariaCurso

--3) Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.
CREATE VIEW vwAlunos_Turma AS 
SELECT nomeCurso, COUNT(tbMatricula.idAluno) 'Total de alunos', nomeTurma FROM tbCurso
INNER JOIN tbTurma ON tbTurma.idCurso = tbCurso.idCurso
INNER JOIN tbMatricula ON tbMatricula.idTurma = tbTurma.idTurma
INNER JOIN tbAluno ON tbMatricula.idAluno = tbAluno.idAluno
GROUP BY nomeCurso, nomeTurma

SELECT * FROM vwAlunos_Turma



--4) Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.
SELECT nomeTurma FROM vwAlunos_Turma
WHERE [Total de alunos] = (SELECT max([Total de alunos]) FROM vwAlunos_Turma)

--5) Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.
CREATE VIEW vwTurma_Curso AS
SELECT nomeCurso, COUNT(idTurma) 'Quantidade de Turmas' FROM tbCurso
INNER JOIN tbTurma ON  tbTurma.idCurso = tbCurso.idCurso
GROUP BY nomeCurso

SELECT * FROM vwTurma_Curso

--6) Usando a visão “Turma_Curso exiba o curso com menor número de turmas.
SELECT nomeCurso FROM vwTurma_Curso
WHERE [Quantidade de Turmas] = (SELECT min([Quantidade de Turmas]) FROM vwTurma_Curso)


