function  cel=strarr(varargin)
%function strarr(d1, d2, ...)
%******** ******
%**
ln=length(varargin);
if ln == 1; sz=i2msizz(varargin{1}); else for i=ln:-1:1; sz(i)=varargin{i}; end; end;
sz=double(int32(sz));
cel=cell(sz);
for i=1:prod(sz); cel{i}=''; end;
%if length(cel) == 1; cel=''; else, cel=i2mstr(cel); end;
cel=i2mstr(cel);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

