% plotts
% --------------------------------------------
% Equivalent to :
% function PLOTTS [[[, X], Y], Z]
%                      ,/CONTINUE
%
% in IDL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    IDL2SCILAB Project
%
%--------------------------------------------------------
%   ILL (Institut Laue Langevin)
%
%   38000 GRENOBLE Cedex
%--------------------------------------------------------
% Fonction : fonction plotts
% Auteurs :
%                 Cortina Stephane
%                 Bourtembourg Reynald
% Date creation : 15 / 04 / 2003
% Modifications : 24 / 07 / 2003
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% A REVOIR PLUS QUE SERIEUSEMENT, surtout la maniere de determiner le nombre d'arguments passes !
% KG Z = scalaire ou tableau a un seul element  ~= argument z qui peut etre un tableau

function [varargout]=plotts(varargin)

I2Mkwn=char('I2M_a1' , 'I2M_a2' , 'I2M_a3' , 'continue','thick','psym'   ,'linestyle' ,  'symsize' , 'color'     , 't3d' ,'I2M_pos');
    I2Mkwv=    {'d1'     , 'd2' , 'd3'     , 'relier'  ,'epais','symbole','styleLigne', 'tailleSym','colorIndice','t3dKG','I2M_pos'};
    % variables utilis�es
		global i2mvs_p
		% fonctions � afficher
    d1=[]; d2=[]; d3=[];
    % keywords pr�sent si =1
    relier=''; opt='.';
		% keywords graphiques
		epais = ''; symbole=''; styleLigne=''; tailleSym=''; colorIndice=''; t3dKG='';

     I2M_pos=[]; I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

% fin du passage des parametres

    i=''; l='';

hold on;

if isempty(d2)
    % un seul param : d1=tableau de 2 ou 3 vecteurs
        % on a 2 ou 3 vecteurs
        a = d1(1,:);
        b = d1(2,:);
        dim=size(d1,1);
        % si on a trois vecteurs
        if dim==3
            c = d1(3,:);
        % si 2 vecteurs
        else
            c= a-a;
        end;
        % keyword /CONTINUE ?
        if ~isempty(relier)
            t=get(gcf,'currentpoint');
            % on relie chaque point de d1 avec le pt de reference
           % for (i=1:1:size(d1,2))
            %    l = line([t(1) a(i)],[t(2) b(i)]);
            % end;
             l = line([t(1) a(1)],[t(2) b(1)]);
        end;
        % on relie 2 � 2 les points contenus ds le tableau d1
        for (i=1:1:size(d1,2)-1)
            l = line([a(i) a(i+1)],[b(i) b(i+1)]);
        end;
        % on effectu l'affichage
        plot3(a,b,c,opt);
        % on stocke le dernier point affich�
        set(gcf,'currentpoint',[a(size(d1,2)),b(size(d1,2))])

else
      % si on a 2 vecteurs
        if isempty(d3)
            d3 = d1-d1;
        end;
        % si on a /continue
        if ~isempty(relier)
                t=get(gcf,'currentpoint');
                for (i=1:1:size(d1,2))
                    l = line([t(1) d1(i)],[t(2) d2(i)]);
                    t(1)=d1(i);
                    t(2)=d2(i);
                end;
       end;
       set(gcf,'currentpoint',[d1(size(d1,2)),d2(size(d2,2))])
       % plot + liaison entre les points
       plot3(d1,d2,d3,opt);
        for (i=1:1:size(d1,2)-1)
           l = line([d1(i) d1(i+1)],[d2(i) d2(i+1)]);
       end;
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% TRAITEMENT DES KEYWORDS GRAPHIQUES %%%%%%%%%%%%%%%%%%%
% Traitement de /COLOR
i2m_color(colorIndice,l,'plots');
% Traitement de /THICK
i2m_thick(l,epais);
% traitement de /PSYM
i2m_psym(symbole,l);
% traitement de /LINESTYLE
i2m_linestyle(styleLigne,l,symbole);
% traitement de /SYMSIZE
i2m_symsize(tailleSym,l);
% Traitement de /T3D
i2m_t3d(t3dKG);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if I2M_out; eval(I2M_out); end;

