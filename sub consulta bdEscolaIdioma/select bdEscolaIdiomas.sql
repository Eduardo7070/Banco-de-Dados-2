USE bdEscolaIdioma

--a) Criar uma consulta que retorne o nome e o pre�o dos cursos que custem abaixo do valor m�dioSELECT nomeCurso, valorCurso FROM tbCurso
WHERE valorCurso < (SELECT avg(valorCurso) FROM tbCurso)

--b) Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT nomeAluno, rgAluno FROM tbAluno
WHERE dataNascimento = (SELECT max(dataNascimento) FROM tbAluno)

--c) Criar uma consulta que retorne o nome do aluno mais velhoSELECT nomeAluno FROM tbAluno
WHERE dataNascimento = (SELECT min(dataNascimento) FROM tbAluno)

--d) Criar uma consulta que retorne o nome e o valor do curso mais caro
SELECT nomeCurso, valorCurso FROM tbCurso
WHERE valorCurso = (SELECT max(valorCurso) FROM tbCurso)

--e) Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a �ltima matr�culaSELECT nomeAluno, nomeCurso FROM tbAlunoINNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAlunoINNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurmaINNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCursoWHERE dataMatricula = (SELECT max(dataMatricula) FROM tbMatricula)--f) Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de IdiomasSELECT nomeAluno FROM tbAlunoINNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAlunoWHERE dataMatricula = (SELECT min(dataMatricula) FROM tbMatricula)--g) Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de ingl�sSELECT nomeAluno, rgAluno, dataNascimento FROM tbAluno INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAlunoINNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurmaINNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCursoWHERE nomeAluno = (SELECT nomeAluno WHERE nomeCurso LIKE 'INGL�S%')