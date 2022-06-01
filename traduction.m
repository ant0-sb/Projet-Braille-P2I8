function phrase = traduction (matrice_tot)

%% initialization des caractères

[listelettres,listechiffres, listeappartenance, listequantificateurs, listequivalent, listespeciale] = alphabet();

%% découpage de la matrice totale en une suite de matrices caractères
A = matrice_tot;
[lignlength, columnlength] = size(A);
lignnumber  = lignlength/3 -1;
columnnumber =columnlength/2 -1;
braille =cell(1,0);
for n = 0 : lignnumber
   for m = 0 : columnnumber
       braille{end +  1}  =  A(3*n+1:3*n+3, 2*m+1:2*m+2);
   
   end
       
    
end

%% traduction des caractères
swaplist = 0;
phrase = strings(50); %matrice de strings, nombre défini arbitrairement et à étendre pour des textes plus longs
k = 1;
capshift =0;
exposantunique=false;
finexposant = false;
for n = 1:length(braille)
    % échangeur de listes
    switch swaplist
        case 0
            liste = listelettres;
        case 1
            liste = listechiffres;
        case 2
            liste = listeappartenance;
        case 3
            liste = listequantificateurs;
        case 4
            liste = listequivalent;
        case 5
            liste = listespeciale;
    end
    
    for lettreref = liste
        %détermine si la liste doit changer à la prochaine itération de la
        %boucle
        if isequal(braille{n},lettreref.valeur)
            if (swaplist == 3)
                swaplist = 0;
            elseif (swaplist == 4)
                swaplist = 1;
            elseif (swaplist == 5)
                swaplist = 1;
            elseif (lettreref.caractere =="chiffre")
                swaplist = 1;
            elseif (lettreref.caractere == ' ')
                swaplist = 0;
            elseif (lettreref.caractere == "appartenance")
                swaplist = 2;
            elseif (lettreref.caractere == "quantificateur")
                swaplist = 3;
            elseif (lettreref.caractere == "equivalence")
                swaplist = 4;
            end

              %{  
            elseif (lettreref.caractere == '-')
                
                    caractere = '-';
                   if (isequal(braille{n+1}, [0,0;0,0;0,0]) == 0 )
                       phrase(1,k) = phrase(1,k) + caractere;
                   else
                       r = 0;
                       while (isequal(braille{n+1}, [0,0;0,0;0,0]))
                           n = n+1;
                           r = r+1;
                       end

                   end
                %}
            
            
            %décalage ASCII éventuel lors de l'apparition d'une majuscule
            if (lettreref.caractere == "caps")
                disp (braille{n+1});
                %empêche le décalage ASCII pour les symboles balisés par le
                %signe des majuscule, ici les accolades
                if (~(isequal(braille{n+1},[0,0;1,0;1,1]) || isequal(braille{n+1},[0,0;0,1;1,1])) )
                    capshift = 32;
                end
            else
                    if (isequal(braille{n},[[0 1];[0 0];[0 0]]))
                        if(~isequal(braille{n+1},[[0 0];[0 1];[0 1]]))
                            exposantunique = true;
                        else
                            finexposant = true;
                        end
                    end
                    %assure un saut de ligne (changement de String) si
                    %plusieurs espaces consécutifs sont détectés
                    if (lettreref.caractere == ' ')
                        if(n < length(braille))
                            if (isequal (braille{n+1}, lettreref.valeur) && ~isequal (braille{n-1}, lettreref.valeur))
                                k = k+1;
                            end
                        end
                    end

                    phrase(k,1) = phrase(k,1) + char(double(lettreref.caractere)-capshift);
                    capshift = 0;
                    if (isequal(braille{n}, [[0 0];[1 0];[1 0]]))
                        if (finexposant)
                            phrase(k,1) = phrase(k,1) + ')';
                            finexposant = false;
                        end
                    end

                    if (exposantunique)
                        if(~isequal(braille{n},[[0 1];[0 0];[0 0]])) %% cette condition empêche l'exposant unique de refermer sa parenthèse trop tôt
                            phrase(k,1) = phrase(k,1) + ')';
                                exposantunique=  false;
                        end
                    end
            end
        end
    end
end
            
