function [listelettres,listechiffres, listeappartenance, listequantificateurs, listequivalent, listespeciale] = alphabet()

a = lettre;
a.caractere = 'a';
a.valeur = [[1  0];[0 0]; [0 0]];

b = lettre;
b.caractere = 'b'; 
b.valeur = [[1 0];[1 0];[0 0]];

c = lettre;
c.caractere = 'c';
c.valeur = [[1 1];[0 0];[0 0]];

d = lettre;
d.caractere = 'd';
d.valeur = [[1 1];[0 1];[0 0]];

e = lettre;
e.caractere = 'e';
e.valeur = [[1 0];[0 1];[0 0]];

f = lettre;
f.caractere = 'f';
f.valeur = [[1 1];[1 0];[0 0]];

g = lettre;
g.caractere = 'g';
g.valeur = [[1 1];[1 1];[0 0]];

h = lettre;
h.caractere = 'h';
h.valeur = [[1 0];[1 1];[0 0]];

i = lettre;
i.caractere = 'i';
i.valeur = [[0 1]; [1 0]; [0 0]];

j = lettre;
j.caractere = 'j';
j.valeur = [[0 1];[1 1];[0 0]];

k = lettre;
k.caractere ='k';
k.valeur = [[1 0];[0 0];[1 0]];

l = lettre;
l.caractere = 'l';
l.valeur =[[1 0];[1 0];[1 0]];

m = lettre;
m.caractere = 'm';
m.valeur  =[[1 1];[0 0];[1 0]];

n = lettre;
n.caractere = 'n';
n.valeur = [[1 1];[0 1];[1 0]];

o = lettre;
o.caractere = 'o';
o.valeur = [[1 0];[0 1];[1 0]];

p = lettre;
p.caractere = 'p';
p.valeur = [[1 1];[1 0];[1 0]];

q = lettre;
q.caractere = 'q';
q.valeur = [[1 1];[1 1];[1 0]];

r = lettre;
r.caractere = 'r';
r.valeur = [[1 0];[1 1];[1 0]];

s = lettre;
s.caractere = 's';
s.valeur = [[0 1];[1 0];[1 0]];

t = lettre;
t.caractere = 't';
t.valeur = [[0 1];[1 1];[1 0]];

u = lettre;
u.caractere = 'u';
u.valeur = [[1 0];[0 0];[1 1]];

v = lettre;
v.caractere = 'v';
v.valeur = [[1 0];[1 0];[1 1]];

w = lettre;
w.caractere = 'w';
w.valeur = [[0 1];[1 1];[0 1]];

x = lettre;
x.caractere = 'x';
x.valeur = [[1 1];[0 0];[1 1]];

y = lettre;
y.caractere = 'y';
y.valeur = [[1 1];[0 1];[1 1]];

z = lettre;
z.caractere = 'z';
z.valeur = [[1 0];[0 1];[1 1]];

a_grave = lettre;
a_grave.caractere = 'à';
a_grave.valeur = [[1 0];[1 1];[1 1]];

e_grave = lettre;
e_grave.caractere = 'è';
e_grave.valeur = [[0 1];[1 0];[1 1]];

e_aigu = lettre;
e_aigu.caractere = 'é';
e_aigu.valeur = [[1 1];[1 1];[1 1]];

a_circonflexe = lettre;
a_circonflexe.caractere = 'â';
a_circonflexe.valeur = [[1 0];[0 0];[0 1]];

e_circonflexe = lettre;
e_circonflexe.caractere = 'ê';
e_circonflexe.valeur = [[1 0];[1 0];[0 1]];

i_circonflexe =lettre;
i_circonflexe.caractere = 'î';
i_circonflexe.valeur = [[1 1];[0 0];[0 1]];

o_circonflexe = lettre;
o_circonflexe.caractere = 'ô';
o_circonflexe.valeur = [[1 1];[0 1];[0 1]];

u_circonflexe =  lettre;
u_circonflexe.caractere= 'û';
u_circonflexe.valeur = [[1 0];[0 1];[0 1]];

e_trema = lettre;
e_trema.caractere = 'ë';
e_trema.valeur = [[1 1];[1 0];[0 1]];

i_trema  = lettre;
i_trema.caractere ='ï';
i_trema.valeur = [[1 1];[1 1];[0 1]];

u_trema  =  lettre;
u_trema.caractere = 'ü';
u_trema.valeur = [[1 0];[1 1];[0 1]];

espace = lettre;
espace.caractere =' ';
espace.valeur = [[0 0];[0 0];[0 0]];

caps = lettre;
caps.caractere = "caps";
caps.valeur = [[0 1];[0 0];[0 1]];

chiffre =  lettre;
chiffre.caractere = "chiffre";
chiffre.valeur = [[0 0];[0 0];[0 1]];

exposantunique = lettre;
exposantunique.caractere = '^(';
exposantunique.valeur = [[0 1];[0 0];[0 0]];

exposant = lettre;
exposant.caractere = '';
exposant.valeur = [[0 0];[0 1];[0 1]];

finexposant = lettre;
finexposant.caractere = '';
finexposant.valeur = [[0 0];[1 0];[1 0]];



zero = lettre;
zero.caractere = '0';
zero.valeur = [[0 1];[0 1];[1 1]];

un = lettre;
un.caractere = '1';
un.valeur = [[1 0];[0 0];[0 1]];

deux = lettre;
deux.caractere = '2';
deux.valeur = [[1 0];[1 0];[0 1]];

trois = lettre;
trois.caractere = '3';
trois.valeur = [[1 1];[0 0];[0 1]];

quatre = lettre;
quatre.caractere= '4';
quatre.valeur = [[1 1];[0 1];[0 1]];

cinq = lettre;
cinq.caractere  = '5';
cinq.valeur  = [[1 0];[0 1];[0 1]];

six = lettre;
six.caractere  = '6';
six.valeur  = [[1 1];[1 0];[0 1]];

sept = lettre;
sept.caractere = '7';
sept.valeur = [[1 1];[1 1];[0 1]];

huit = lettre;
huit.caractere = '8';
huit.valeur = [[1 0];[1 1];[0  1]];

neuf = lettre;
neuf.caractere = '9';
neuf.valeur = [[0 1];[1 0];[0 1]];

plus = lettre;
plus.caractere = '+';
plus.valeur = [[0 0];[1 1];[1 0]];

egal = lettre;
egal.caractere = '=';
egal.valeur = [[0 0];[1 1];[1 1]];

moins = lettre;
moins.caractere = '-';
moins.valeur = [[0 0];[0 0];[1 1]];

divise = lettre;
divise.caractere = '/';
divise.valeur = [[0 0];[1 1];[0 0]];

fraction = lettre;
fraction.caractere = '/';
fraction.valeur = [[0 1];[0 0];[1 0]];

multiplie = lettre;
multiplie.caractere = '*';
multiplie.valeur = [[0 0];[0 1];[1 0]];

virgule =  lettre;
virgule.caractere = ',';
virgule.valeur = [[0 0];[1 0];[0 0]];

point_virgule = lettre;
point_virgule.caractere = ';';
point_virgule.valeur = [[0 0];[1 0];[1 0]];

deux_points = lettre;
deux_points.caractere = ':';
deux_points.valeur = [[0 0];[1 1];[0 0]];

point = lettre;
point.caractere  = '.';
point.valeur = [[0 0];[1 1];[0 1]];

point_interrogation = lettre;
point_interrogation.caractere = '?';
point_interrogation.valeur = [[0 0];[1 0];[0 1]];

point_exclamation = lettre;
point_exclamation.caractere = '!';
point_exclamation.valeur = [[0 0];[1 1];[1 0]];

guillemet = lettre;
guillemet.caractere = '"';
guillemet.valeur = [[0 0];[1 1];[1 1]];

parenthese_gauche = lettre;
parenthese_gauche.caractere = '(';
parenthese_gauche.valeur = [[0 0];[1 0];[1 1]];

parenthese_droite = lettre;
parenthese_droite.caractere = ')';
parenthese_droite.valeur = [[0 0];[0 1];[1 1]];

apostrophe = lettre;
apostrophe.caractere = char("'");
apostrophe.valeur = [[0 0];[0 0];[1 0]];

tiret = lettre;
tiret.caractere = '-';
tiret.valeur = [[0 0];[0 0];[1 1]];

appartient = lettre;
appartient.caractere = '∈';
appartient.valeur = [[1 0];[0 0];[0 1]];

appartientpas = lettre;
appartientpas.caractere = '∉';
appartientpas.valeur = [[0 1];[0 0];[1 0]];

ensemblevide = lettre;
ensemblevide.caractere = 'Ø';
ensemblevide.valeur =[[0 1];[0 1];[1 1]];

appartenance = lettre;
appartenance.caractere = "appartenance";
appartenance.valeur = [[0 1];[0 1];[0 0]];

pourtout = lettre;
pourtout.caractere = '∀';
pourtout.valeur = [[0 1];[0 0];[1 0]];

quantificateur = lettre;
quantificateur.caractere = "quantificateur";
quantificateur.valeur = [[0 1];[0 1];[0 1]];

equivalent = lettre;
equivalent.caractere = '⇔';
equivalent.valeur = [[0 0];[1 1];[0 0]];

equivalence = lettre;
equivalence.caractere = "equivalence";
equivalence.valeur = [[0 0];[0 1];[0 0]];

accoladegauche = lettre;
accoladegauche.caractere = '{';
accoladegauche.valeur = [[0 0];[1 0];[1 1]];

accoladedroit = lettre;
accoladedroit.caractere = '}';
accoladedroit.valeur = [[0 0];[0 1];[1 1]];

superieur = lettre;
superieur.caractere = '>';
superieur.valeur = [[0 1];[0 1];[1 0]];







%% création des différentes bibliothèques de caractères
listelettres = [a b c d e f g h i j k l m n o p q r s t u v w x y z a_grave e_grave e_aigu a_circonflexe  e_circonflexe i_circonflexe o_circonflexe u_circonflexe e_trema i_trema u_trema espace caps chiffre virgule point_virgule deux_points point point_interrogation point_exclamation guillemet parenthese_gauche parenthese_droite apostrophe exposant exposantunique zero appartenance quantificateur equivalence];
listechiffres = [zero un deux trois quatre cinq  six  sept huit neuf e r s x plus moins multiplie divise fraction egal exposantunique exposant finexposant espace accoladegauche accoladedroit appartenance quantificateur equivalence caps];
listeappartenance = [appartient appartientpas ensemblevide r chiffre quantificateur equivalence caps];
listequantificateurs = [pourtout chiffre appartenance equivalence caps accoladegauche accoladedroit];
listequivalent = [equivalent superieur chiffre appartenance quantificateur caps];
listespeciale = [accoladegauche accoladedroit chiffre appartenance quantificateur equivalence];
%% 
return


end