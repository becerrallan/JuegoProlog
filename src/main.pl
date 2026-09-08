personaje('Elara', 5, 100).
personaje('kael', 3, 80).
personaje('Rin', 7, 120).
personaje('Allan', 10, 200).


mision(m1, 'Bosque de sombras' , 2, 50).
mision(m2, 'Cueva del Dragon' , 5, 120).
mision(m3, 'Torre Arcana' , 7, 200).

inventario('Elara' , [espada, escudo, pocion]).
inventario('Kael' , [arco, flechas]).
inventario('Rin' , [varita, grimorio, pocion, amuleto]).
inventario('Allan', [escopeta, fusil]).

requiere(m2, escudo). requiere(m2, pocion).
requiere(m3, grimorio). requiere(m3, pocion).


arma('Aplastadora', 59, 'Fuego').
tiene('Allan', arma('Aplastadora', 59, hielo)).
inventario('Allan', [escopeta, fusil, 'Aplastadora']).