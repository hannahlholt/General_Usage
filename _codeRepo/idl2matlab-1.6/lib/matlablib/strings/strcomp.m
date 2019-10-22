function  [res,varargout]=strcomp(varargin)
%function strcomp(exp1, exp2, nchar, /fold_case)
%******** *******
%**
    I2Mkwn=char('I2M_a1' , 'I2M_a2' , 'I2M_a3' , 'fold_case' , 'I2M_pos');
    I2Mkwv=    {'exp1'   , 'exp2'   , 'nchar'  , 'ignore'    , 'I2M_pos'};
    exp1=[]; exp2=[]; nchar=[]; ignore=[]; I2M_pos=[];

    I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

res=0;
if isa(exp1,'i2mstr'); ex1=cellstr(exp1(:)); else, ex1=exp1; end;
if isa(exp2,'i2mstr'); ex2=cellstr(exp2(:)); else, ex2=exp2; end;

if     isnumeric(ex1), res= (str2num(ex2) == ex1);
elseif isnumeric(ex2), res= (str2num(ex1) == ex2);
elseif  ~isempty(ex1) & ~isempty(ex2);
    if   isempty(nchar), if ignore, res=strcmpi (ex1,ex2);       else res=strcmp (ex1,ex2);       end;
    else,                if ignore, res=strncmpi(ex1,ex2,nchar); else res=strncmp(ex1,ex2,nchar); end;
    end;
else, if isempty(ex1) & isempty(ex2), res=1; end; end;

if I2M_out, eval(I2M_out); end;
