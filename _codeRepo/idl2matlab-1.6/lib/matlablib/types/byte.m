function  num=byte(val)
%function byte(val)
%******** ****
%**
if nargin ~=1, disp('!!! byte.m has to be completed...'); end;
num=0;
if ~isempty(val);
    if ~isnumeric(val);
    	if isa(val,'i2mstr'), val=val(:); end;
        if ischar(val);       num=uint8(val);
        elseif iscell(val);   num=uint8(zeros(size(val)));
        	for i=prod(size(val)):-1:1;
                if     ischar(val{i});    num(i)=str2num(val{i});
                elseif isnumeric(val{i}); num(i)=uint8  (val{i}); end; end;
        end
    else   num=uint8(val); end;
%num=double(num);
end
