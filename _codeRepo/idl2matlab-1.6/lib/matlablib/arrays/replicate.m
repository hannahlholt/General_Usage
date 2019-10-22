function mat=replicate(varargin)
%function replicate(val, d1,...,d8)
%******** *********

val=varargin{1};
if isnumeric(val), if length(val) == 1, if val <=255, val=uint8(val); end; end; end;
zz=sizz(val); tip=zz(zz(1)+2);

for i=2:length(varargin), dim(i-1)=varargin{i}; end;

if tip == 8, for i=1:prod(dim), mat(i)=val; end; if length(dim)>1, mat=reshape(mat,dim); end;
else,        mat=make_array('dimension',dim,'type',tip,'value',val); end;
