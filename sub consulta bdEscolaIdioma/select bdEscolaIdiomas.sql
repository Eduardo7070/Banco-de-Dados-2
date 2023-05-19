USE bdEscolaIdioma

--a) Criar uma consulta que retorne o nome e o pre�o dos cursos que custem abaixo do valor m�dio
WHERE valorCurso < (SELECT avg(valorCurso) FROM tbCurso)

--b) Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT nomeAluno, rgAluno FROM tbAluno
WHERE dataNascimento = (SELECT max(dataNascimento) FROM tbAluno)

--c) Criar uma consulta que retorne o nome do aluno mais velho
WHERE dataNascimento = (SELECT min(dataNascimento) FROM tbAluno)

--d) Criar uma consulta que retorne o nome e o valor do curso mais caro
SELECT nomeCurso, valorCurso FROM tbCurso
WHERE valorCurso = (SELECT max(valorCurso) FROM tbCurso)

--e) Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a �ltima matr�cula