function  [mat,varargout]=indgen(varargin)
%function indgen(d1,...,d8, /string, /complex,/dcomplex, type=tip)
%******** ******
%**
    I2Mkwn=char('I2M_a1' , 'I2M_a2' , 'I2M_a3' , 'I2M_a4' , 'I2M_a5' , 'I2M_a6' , 'I2M_a7' , 'I2M_a8' , 'string' , 'complex' , 'dcomplex' , 'type' , 'I2M_pos');
    I2Mkwv=    {'d1'     , 'd2'     , 'd3'     , 'd4'     , 'd5'     , 'd6'     , 'd7'     , 'd8'     , 'string' , 'complx'  , 'dcomplx'  , 'tip'  , 'I2M_pos'};
    d1=[]; d2=[]; d3=[]; d4=[]; d5=[]; d6=[]; d7=[]; d8=[]; string=[]; complx=[]; dcomplx=[]; tip=[]; I2M_pos=[];

    I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

dim=[];
if ~isempty(d1), dim   =d1; if ~isempty(d2), dim(2)=d2; if ~isempty(d3), dim(3)=d3; if ~isempty(d4), dim(4)=d4;
if ~isempty(d5), dim(5)=d5; if ~isempty(d6), dim(6)=d6; if ~isempty(d7), dim(7)=d7; if ~isempty(d8), dim(8)=d8;
end; end; end; end; end; end; end; end;

mat=make_array('dimension',dim, 'type',tip, 'index',1, 'string',string, 'complex',complx, 'dcomplex',dcomplx);

if I2M_out, eval(I2M_out); end;
