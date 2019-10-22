function  [mat,varargout]=make_array(varargin)
%function make_array(d1,...,d8, /string, /byte, /complex,/dcomplex, dimension=dim, /index, size=sz, value=val, type=tip)
%******** **********
%**
    I2Mkwn=char('I2M_a1' , 'I2M_a2' , 'I2M_a3' , 'I2M_a4' , 'I2M_a5' , 'I2M_a6' , 'I2M_a7' , 'I2M_a8' , 'string' , 'byte' , 'complex' , 'dcomplex' , 'dimension' , 'index' , 'size' , 'value' , 'type' , 'I2M_pos');
    I2Mkwv=    {'d1'     , 'd2'     , 'd3'     , 'd4'     , 'd5'     , 'd6'     , 'd7'     , 'd8'     , 'string' , 'byt'  , 'complx'  , 'dcomplx'  , 'dim'       , 'index' , 'sz'   , 'val'   , 'tip'  , 'I2M_pos'};
    d1=[]; d2=[]; d3=[]; d4=[]; d5=[]; d6=[]; d7=[]; d8=[]; string=[]; byt=[]; complx=[]; dcomplx=[]; dim=[]; index=[]; sz=[]; val=[]; tip=[]; I2M_pos=[];

    I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

struc=0;

if ~isempty(sz), dim=sz(2:1+sz(1)); tip=sz(sz(1)+2); end;

if ~isempty(d1), dim   =d1; if ~isempty(d2), dim(2)=d2; if ~isempty(d3), dim(3)=d3; if ~isempty(d4), dim(4)=d4;
if ~isempty(d5), dim(5)=d5; if ~isempty(d6), dim(6)=d6; if ~isempty(d7), dim(7)=d7; if ~isempty(d8), dim(8)=d8;
end; end; end; end; end; end; end; end;

if ~isempty(val), if isempty(tip), zz=sizz(val); tip=zz(zz(1)+2); end; end;

if ~isempty(tip), if tip==6, complx=1; elseif tip==7, string=1; elseif tip==9, dcomplx=1;
              elseif tip==8, struc =1; elseif tip==1, byt=1;  end; end;

dim=double(uint32(dim));

nel=prod(dim); dom=dim; dim=num2cell(dim);

if string,    mat=strarr(dim{:});
elseif struc, mat=replicate(val,dim{:});
elseif index, mat=0:1:nel-1; mat=reform(mat,dom); else, mat=fltarr(dim{:}); end;
if byt,       mat=uint8 (mat); if ~i2msizz, mat=mat'; end; end;

if ~struc;
    if ~isempty(val), if string mat(:)= strung(val); else mat(:)=val; end;
    elseif index & string, for i=1:nel, mat(i)=strung(i-1); end; end; end;

if complx | dcomplx, mat=complex(mat,mat); end;

if I2M_out, eval(I2M_out); end;
