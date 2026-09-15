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
inventario('Allan', [escopeta, fusil, 'Aplastadora']).

requiere(m2, escudo). requiere(m2, pocion).
requiere(m3, grimorio). requiere(m3, pocion).


arma('Aplastadora', 59, 'Fuego').
tiene('Allan', arma('Aplastadora', 59, hielo)).

xp_para_subir(NivelActual, XP) :- 
    XP is NivelActual * 30.

vida_restante(VidaMax, Danio, Final) :-
    Final is VidaMax - Danio.

xp_acumulado(0,0).
xp_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    xp_acumulado(N1, Prev),
    Total is Prev + (N * 30).


danio_acumulado(0,0).
danio_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    danio_acumulado(N1, Prev),
    Total is Prev + (N * 10).

mismo_nivel(P1, P2) :-
    personaje(P1, N, _),
    personaje(P2, N, _),
    P1 \== P2.


es_balanceado(P) :-
    personaje(P, _, Vida),
    Vida =:= 100.

mas_fuerte(P1, P2) :-
    personaje(P1, Nivel1, Vida1),
    personaje(P2, Nivel2, Vida2),
    Nivel1 > Nivel2.

mismo_objeto(P1, P2, Objeto) :-
    inventario(P1, Inventario1),
    inventario(P2, Inventario2),
    member(Objeto, Inventario1),
    member(Objeto, Inventario2).


ser(presente, tercera, singular, " es").
ser(pasado, tercera, singular, " fue").

conjugar_accion(Verbo, Tiempo, Persona, Numero, C) :-
    (Verbo = "ser" ->
        ser(Tiempo, Persona, Numero, C)
    ; C = Verbo ).


puede_aceptar(Personaje, ID_Mision) :-
    personaje(Personaje, Nivel, _),
    mision(ID_Mision, _, Dificultad, _),
    Nivel >= Dificultad.


tiene_requerido(Personaje, Objeto) :-
    inventario(Personaje, Lista),
    member(Objeto, Lista).

fusionar_equipo(P1, P2, EquipoFusionado) :-
    inventario(P1, Inventario1),
    inventario(P2, Inventario2),
    append(Inventario1, Inventario2, EquipoFusionado).

generar_reporte(Personaje, ID_Mision, Reporte) :-
    puede_aceptar(Personaje, ID_Mision),
    mision(ID_Mision, NombreMision, _, RecompensaXP),
    conjugar_accion("ser", presente, tercera, singular, F),
    atomic_list_concat(
        [Personaje, F, " capaz de completar ", NombreMision, " por ", RecompensaXP, " XP "],
    '', Reporte).