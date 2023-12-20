-- 1)Selezionare cognome e nome tutti gli insegnanti, ordinati per cognome e poi per nome in ordine alfabetico (100)
select t.surname , t.name 
from teachers t 
order by t.surname , t.name ;

-- 2) Selezionare tutti gli insegnamenti (courses) che valgono almeno 12 crediti (cfu) (375)
select *
from courses c 
where c.cfu >=12;

-- 3) Selezionare tutti gli studenti nati nel 1990 (160)
select *
from students s 
where year(s.date_of_birth)= 1990;

-- 4)Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
select *
from courses c
where c.period = 'I semestre' and  c.`year` =1;

-- 5)Da quanti dipartimenti è composta l’università?
select count(*)
from departments d ;

-- 6) Contare tutti gli insegnanti il cui cognome termina con la “E” (8)
select count(*)
from teachers t 
where t.surname like '%e';

-- 7)Selezionare nome, cognome e codice fiscale di tutti gli studenti iscritti al Corso di Laurea in Economia, in ordine alfabetico
select s.name , s.surname , s.fiscal_code
from students s
join `degrees` d on s.degree_id = d.id 
where d.name = 'Corso di Laurea in Economia'
order by s.surname , s.name ;

-- 8)Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select *
from `degrees` d
join departments d2  on d.department_id =d2.id 
where d2.name = 'Dipartimento di Neuroscienze' and d.name like '%Magistrale%';

-- BONUS
-- Selezionare nome e cognome di tutti gli studenti che hanno superato l’esame del corso “maxime laboriosam nostrum” (39)
select s.name , s.surname 
from students s 
join exam_student es on s.id = es.student_id 
join exams e on es.exam_id = e.id 
join courses c on e.course_id = c.id 
where c.name = 'maxime laboriosam nostrum' and es.vote >=18;

-- Elencare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

select *
from teachers t 
join course_teacher ct on t.id = ct.teacher_id 
join courses c on ct.course_id = c.id 
join `degrees` d on c.degree_id = d.id 
join departments d2 on d.department_id = d2.id 
where d2.name = 'Dipartimento di Matematica';






