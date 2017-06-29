:- use_module(library('clp/bounds')).
afficher_liste([X|L]) :- writeln(X), afficher_liste(L).
% affiche un séparateur si la liste ne contient plus qu un seul élément :
afficher_liste([X]) :- writeln(X), writeln(-----------------------------------------------).

% appartient_a(X,L) : vrai si l élément X appartient à la liste L
appartient_a(X,L) :- append(_,[X|_],L).

 distance_de_est(A,B,C) :- V1 is (A-B)*(A-B)/C,
                    V1 is C.
superieur_a(A,B) :- A >  B.
different(A,B) :- A \==  B.
inferieur_a(A,B) :- superieur_a(B,A).
superieur_a_de(A,B,C) :- A is B+C.
inferieur_a_de(A,B,C) :- A is B-C.

liste_des_famille_activite([
famille_activite(_,_,_,_,_),
famille_activite(_,_,_,_,_),
famille_activite(_,_,_,_,_),
famille_activite(_,_,_,_,_)
]).

test_famille_activite :-

liste_des_famille_activite(Famille_activite),

appartient_a(famille_activite(alenas  ,A9,_,_,_),Famille_activite),
appartient_a(famille_activite(bordez  ,A5,_,A6,_),Famille_activite),
appartient_a(famille_activite(legendre,_,A10,_,A11),Famille_activite),
appartient_a(famille_activite(prieur  ,_,A1,A4,A2),Famille_activite),
%                                Activite
appartient_a(famille_activite(_,cinema    ,_,_,_),Famille_activite),
appartient_a(famille_activite(_,fromagerie,_,_ ,_ ),Famille_activite),
appartient_a(famille_activite(_,magasins  ,_,A7,_),Famille_activite),
appartient_a(famille_activite(_,musee     ,_,_ ,_ ),Famille_activite),
%                                sport
appartient_a(famille_activite(_,_,bowling ,_ ,_),Famille_activite),
appartient_a(famille_activite(_,_,curling ,_,_ ),Famille_activite),
appartient_a(famille_activite(_,_,natation,_,A3),Famille_activite),
appartient_a(famille_activite(_,_,patinage,_,A12),Famille_activite),
%                                    pluie
appartient_a(famille_activite(_,_,_,2,_ ),Famille_activite),
appartient_a(famille_activite(_,_,_,3,_ ),Famille_activite),
appartient_a(famille_activite(_,_,_,4,_ ),Famille_activite),
appartient_a(famille_activite(_,_,_,5,_),Famille_activite),
%                                    enfants
appartient_a(famille_activite(_,_,_,A13,2),Famille_activite),
appartient_a(famille_activite(_,_,_,A14,3),Famille_activite),
appartient_a(famille_activite(_,_,_,_,4),Famille_activite),
appartient_a(famille_activite(_,_,_,A8,5),Famille_activite),

% different (X) \== Y
different(A1,patinage),
different(A5,musee),
different(A9,cinema),
different(A9,musee),
different(A10,bowling),
% distance_de_est(X,Y,Z) |X-Y| = Z
% superieur_a_de(X,Y,Z) X=Y+Z
superieur_a_de(A2,A3,2),
superieur_a_de(A6,A7,1),
superieur_a_de(A13,A14,2),
% inferieur_a_de(X,Y,Z) X=Y-Z
inferieur_a_de(A6,A8,1),
inferieur_a_de(A11,A12,2),
% superieur_a (X,Y) X>Y
% superieur_a(A1,A2),
% inferieur_a (X,Y) X<Y
inferieur_a(A4,4),
afficher_liste(Famille_activite).
