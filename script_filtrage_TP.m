%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Partie 3 - Filtrage                                                     %
%                                                                         %
% Recherche des frequences caracteristiques d'un bruit dans une           %
% image                                                                   %
% Passage dans l'espace frequentiel - Transformee de Fourier              %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;


% Lecture/ecriture du fichier image dans une matrice I
[FILENAME, PATHNAME] = uigetfile('data/filtrage/*.tif');
I=imread(strcat(PATHNAME,FILENAME));
if(size(I,3)>1)
    I=rgb2gray(I);
end
I=double(I);

% Affichage de l'image avec une barre d'echelle de couleur
figure('numbertitle','off','name','Image')
imagesc(I)
title('Domaine image')
axis square
colormap(gray)
colorbar
pause

% Spectre obtenu par Transformee de Fourier (fftn) 
% recentree (fftshift) de la matrice I
ITF=fftshift(fftn(I));
% Amelioration du contraste de l'image - meilleure lisibilite
ITF2=log(1000+abs(ITF));

% Affichage du spectre avec une barre d'echelle de couleur
h = figure('numbertitle','off','name','Spectre');
imagesc(ITF2);
title('Domaine frequentiel')
axis square
colormap(gray)
colorbar
pause


% Selection des coordonn�es (x,y) des frequences a supprimer
nt = input('Nombre de taches a filtrer : ');
x=zeros(1,nt);
y=zeros(1,nt);

mode= input('Choix du filtre (0=passe bande / 1=coupe bande) : ');
R= input('Choix du rayon pour le filtre : ');

fprintf('Cliquer les %d taches sur le spectre',nt)
fprintf('');
figure(h);
[x,y] = ginputc(nt,'Color','y','lineWidth',2);
% [x,y] = ginput(nt);


% On filtre sur le spectre seulement les taches voulues
[n,m]=size(ITF);
if mode==1
    filtre=ones(n,m);
    val=0.0;
else
    filtre=zeros(n,m);
    val=1.0;
end

y=round(y);
x=round(x);
for l=1:nt
    for j=y(l)-R:y(l)+R
	  for i=x(l)-R:x(l)+R
		  if ((i-x(l))^2+(j-y(l))^2<R^2)
             filtre(j,i)=val;
		  end
	  end
    end
end

% Affichage pour verification du spectre filtre
figure('numbertitle','off','name','Spectre apres filtrage')
imagesc(ITF2.*(filtre))
title('Taches filtrees')
axis square
colormap(gray)
colorbar
pause

% Affichage du plan recherche par Transform�e de Fourier inverse (ifftn)
ITFinv=real(ifftn(ifftshift(ITF.*filtre)));
figure('numbertitle','off','name','Image apres filtrage');
subplot(1,2,1); imagesc(I); axis image; colormap(gray); shading interp; colorbar;
title('Image originale');
subplot(1,2,2); imagesc(ITFinv); axis image; colormap(gray); shading interp; colorbar;
title('Image filtree');

