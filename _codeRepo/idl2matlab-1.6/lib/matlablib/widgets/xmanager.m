function [varargout]=xmanager(varargin)
%PRO XMANAGER, name, base, event_handler='' ...
%*** ********
%*** 
%Unused: no_block

    I2Mkwn=char('I2M_a1' , 'I2M_a2' , 'event_handler' , 'cleanup' , 'group_leader' , 'just_reg' , 'no_block' , 'I2M_pos');
    I2Mkwv=    {'name'   , 'bise'   , 'eventh'        , 'cleanup' , 'leader'       , 'just_reg' , 'no_block' , 'I2M_pos'};
    name=[]; bise=[]; eventh=[]; cleanup=[]; leader=[]; just_reg=[]; no_block=[]; I2M_pos=[];

    I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

global I2Mfig I2Mfevn I2Mfgap I2Mreg I2Mftim I2Mserial

if ~isempty(bise),

base=I2Mfig(int16(bise),1); fii=double(int16(base));

if  isempty(name);    name=['i2m' num2str(double(fii))]; end;
if  isempty(eventh);  eventh=[lower(name) '_event'];     end;
if ~isempty(leader);  I2Mfig(fii,17)=leader;             end;
if ~isempty(cleanup); widget_control('I2M_a1',base,'kill_notify',cleanup); end;

I2Mfevn{fii}=eventh;
I2Mreg   = setfield(I2Mreg, lower(name) , base);

if isempty(just_reg); %Timer Handler.
      eval('fclose(I2Mserial)','');
      eval('delete(I2Mserial)','');
      if ispc, porc='com1'; else, porc='/dev/ttyS0'; end;
 r=1; eval('I2Mserial  =serial  (porc,''TimerFcn'',''getsignal'',''ErrorFcn'',''getsignal'');','r=0;');
 if   (r),  eval('fopen (I2Mserial);','r=0;'); end;
 if   (r),  fclose(I2Mserial); I2Mserial.ReadAsyncMode='manual'; else, I2Mserial=[]; end;
 I2Mftim = 0;
end;
end;
if I2M_out, eval(I2M_out); end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
