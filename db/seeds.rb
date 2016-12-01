# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserType.where(nombre: 'Estudiante').first_or_create!
UserType.where(nombre: 'Docente').first_or_create!
UserType.where(nombre: 'Directivo').first_or_create!

QuestionType.where(codigo: 'PP',
                  descripcion: "Es el promedio de calificación otorgado al profesor por sus alumnos en la dimensión
                                de Planeación y Proceso Aprendizaje Enseñanza. Es el resultado del promedio de
                                calificación de las preguntas 1 al 12.").first_or_create!
QuestionType.where(codigo: 'EV',
                  descripcion: "Evaluación del Aprendizaje, promedio de las preguntas 13 al 20.").first_or_create!
QuestionType.where(codigo: 'EL',
                  descripcion: "Espíritu Lasallista, promedio de las preguntas 21 al 28.").first_or_create!
QuestionType.where(codigo: 'OG',
                  descripcion: "Opinión General, es el promedio de las preguntas 29 y 30.").first_or_create!
QuestionType.where(codigo: 'OG',
                  descripcion: "Calificación global, resulta del promedio general de todos las preguntas de la escala,
                                incluye del 1 al 30.").first_or_create!

AnswerType.where(scala: 0, descripcion: 'Totalmente en desacuerdo').first_or_create!
AnswerType.where(scala: 2.5, descripcion: 'En desacuerdo').first_or_create!
AnswerType.where(scala: 5, descripcion: 'Ni en acuerdo, ni en desacuerdo').first_or_create!
AnswerType.where(scala: 7.5, descripcion: 'De acuerdo').first_or_create!
AnswerType.where(scala: 10, descripcion: 'Totalmente de acuerdo').first_or_create!

AnswerType.where(descripcion: 'Siempre o casi siempre', scala: 10).first_or_create!
AnswerType.where(descripcion: 'Algunas veces', scala: 5).first_or_create!
AnswerType.where(descripcion: 'Nunca o casi nunca', scala: 0).first_or_create!

if Question.all.blank?
  Question.where(descripcion: 'El profesor propone bibliografía y recursos informáticos que son útiles para la clase.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor distribuye adecuadamente el tiempo y las actividades para cumplir los temas del curso.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor desarrolla las actividades de aprendizaje, siguiendo un orden lógico que promueve y facilita tu aprendizaje.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor imparte la materia de manera que te lleva a investigar más sobre los temas vistos.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor te cuestiona de forma que promueve tu razonamiento y capacidad para resolver problemas.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor presenta los contenidos del tema de manera gráfica, ordenada y sintetizada para facilitar tu comprensión.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor imparte su clase de tal manera que entiendes la información y puedes explicarla con tus propias palabras.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor promueve la participación de los alumnos en diferentes actividades de aprendizaje.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor promueve el diálogo, la reflexión y el debate sobre los temas tratados.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor utiliza métodos didácticos auxiliares (gráficas, medios visuales y otros) que mejoran sus exposiciones.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor cubre satisfactoriamente los temas previstos en el programa.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor relaciona los contenidos del tema con la vida diaria.',
                  question_type_id: 1, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor verifica en cada clase si los contenidos han sido comprendidos por todo el grupo.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor da a conocer los resultados de los trabajos oportunamente para que corrijan sus errores.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor entrega calificaciones y retroalimenta a los alumnos, indicando las fallas y aciertos.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor entrega los resultados de la evaluación dentro del periodo establecido para ello.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor utiliza formas de evaluación adecuadas al contenido de la materia.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor califica la materia tomando en cuenta los aspectos relevantes del curso.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor revisa las tareas, trabajos y exámenes para retroalimentar el aprendizaje.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor, al calificar, aplica los mismos criterios para todos los alumnos sin mostrar preferencia por alguno de ellos.',
                  question_type_id: 2, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor con su actitud o comentarios indica que le interesan todos sus alumnos por igual.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor se muestra accesible y brinda apoyo apropiado para el aprendizaje.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor evita hacer comentarios que pueden denigrar al alumno.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor escucha con respeto las opiniones de los alumnos.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor cumple en su persona lo que exige a los demás.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor acepta las diferencias individuales de los alumnos.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor da a cada alumno la atención que necesita para que todos logren la meta propuesta.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'El profesor es congruente entre lo que expresa a los alumnos y lo que manifiesta en los hechos.',
                  question_type_id: 3, user_type_id: 1).first_or_create!
  Question.where(descripcion: '¿Consideras que aprendiste en las clases de este profesor?',
                  question_type_id: 4, user_type_id: 1).first_or_create!
  Question.where(descripcion: 'Si tuvieras oportunidad de volver a tomar clases con este profesor, ¿lo harías?',
                  question_type_id: 4, user_type_id: 1).first_or_create!
end
if Admin.all.blank?
  Admin.create!(email: 'sei@sei.com', password: '123123')
end
