function [varargout]=widget_control(varargin)
% PRO widget_control, base, BAD_ID=bad, TIMER=timer
% *** **************
% ***
% RESIZING: only after realize.
% UNUSED  : all_events, set_text_top, set_text_select, modal, delete_col,rows, insert_col,rows
%         (TABLE)column_labels, column_widths(use) row_labels, row_heights(use)
% TO DO   : clear_ev, motion, set_table_select

    I2Mkwn=char('I2M_a1' , 'bad_id' , 'timer' , 'notify_realize' , 'use_table_select' , 'edit_cell' , 'event_pro' , 'event_func' , 'func_get_value' , 'pro_set_value' , 'get_uvalue' , 'get_value' , 'set_uvalue' , 'set_value' , 'destroy' , 'map' , 'realize' , 'sensitive' , 'reset' , 'show' , 'input_focus' , 'default_font' , 'send_event' , 'kill_notify' , 'notify_realize' , 'draw_button_events' , 'get_draw_view' , 'hourglass' , 'set_uname' , 'editable' , 'draw_xsize' , 'draw_ysize' , 'scr_xsize' , 'scr_ysize' , 'xsize' , 'ysize' , 'set_list_top' , 'set_list_select' , 'set_text_select' , 'set_text_top_line' , 'append' , 'clear_events' , 'set_button' , 'set_droplist_select' , 'set_slider_min' , 'set_slider_max' , 'xoffset' , 'yoffset' , 'tlb_get_offset' , 'tlb_set_xoffset' , 'tlb_set_yoffset' , 'tlb_set_title' , 'tlb_get_size' , 'group_leader' , 'I2M_pos');
    I2Mkwv=    {'bise'   , 'bad'    , 'timer' , 'not_r'          , 'use_tab'          , 'edit_cell' , 'eventp'    , 'eventf'     , 'f_get'          , 'p_set'         , 'getu'       , 'getv'      , 'setu'       , 'setv'      , 'destr'   , 'map' , 'realz'   , 'sens'      , 'reset' , 'show' , 'focus'       , 'defont'       , 'send_event' , 'kill_notify' , 'notify_realize' , 'but_ev'             , 'get_draw'      , 'hourglass' , 'uname'     , 'editable' , 'draw_xsize' , 'draw_ysize' , 'scr_xsize' , 'scr_ysize' , 'xsize' , 'ysize' , 'set_list_top' , 'set_list_sel'    , 'set_text_sel'    , 'set_text_top'      , 'append' , 'clear_ev'     , 'set_but'    , 'set_drop_sel'        , 'sl_min'         , 'sl_max'         , 'xoffset' , 'yoffset' , 'tlb_get_offset' , 'tlb_set_xoffset' , 'tlb_set_yoffset' , 'tlb_set_title' , 'tlb_get_size' , 'leader'       , 'I2M_pos'};
    bise=[]; bad=[]; timer=[]; getu=[]; getv=[]; not_r=[]; use_tab=[]; edit_cell=[]; eventp=[]; eventf=[]; f_get=[]; p_set=[]; setu=[]; setv=[]; destr=[]; map=[]; realz=[]; sens=[]; reset=[]; show=[]; focus=[]; defont=[]; send_event=[]; kill_notify=[]; notify_realize=[]; but_ev=[]; get_draw=[]; hourglass=[]; uname=[]; editable=[]; draw_xsize=[]; draw_ysize=[]; scr_xsize=[]; scr_ysize=[]; xsize=[]; ysize=[]; set_list_top=[]; set_list_sel=[]; set_text_sel=[]; set_text_top=[]; append=[]; clear_ev=[]; set_but=[]; set_drop_sel=[]; sl_min=[]; sl_max=[]; xoffset=[]; yoffset=[]; tlb_get_offset=[]; tlb_set_xoffset=[]; tlb_set_yoffset=[]; tlb_set_title=[]; tlb_get_size=[]; leader=[]; I2M_pos=[];

    I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, if (isempty(varargin{I2M+1}) & ~ischar(varargin{I2M+1})), varargin{I2M+1}=1; end; eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

global I2Mfig I2Mfevn I2Mnotr I2Msget I2Mreg I2Mfun I2Mfcar

% I2Mfig(wid,*)= 1=wid, 2=parent, 3=fig, 4=lay, 5=map, 6=uic, 7:10=pos, 11=top ,12=seq, 13=freq, 14=rest, 15=sens ,16=but ,17=grp ,18=bgc
% lay= 1:column, 2:row, 3:none
% uic= 1:base,   2:uic, 3:fig
% but= 0:normal  1:excl 2:nonexcl 3:menu 4:bar

bad=0;
if ~isempty(hourglass), set(gcf,'Pointer','watch'); end;
if ~isempty(reset), fi=get(0,'Children'); I2Mreg=[];
		    while ~isempty(fi), try, delete(fi(1)); catch, return; end; fi=get(0,'Children'); end; end;

if ~isempty(bise), try,
if bise > 0; fii=double(int16(bise)); fig=I2Mfig(fii,3); base=I2Mfig(fii,1);
if fig  > 0; top=I2Mfig(I2Mfig(fii,11),1);

  if realz;  base=top; fii=double(int16(base)); end; but=I2Mfig(fii,16);

  if ~isempty(map);  if map;  I2Mfig(fii, 5)= 1; widget_i2mrec(base,'map');
                           if I2Mfig(fii, 6)==3; widget_i2mrec(base,'basmap'); end; %c'est comme ca!!!
                     else;    I2Mfig(fii, 5)= 0; widget_i2mrec(base,'nomap');  end; end;
  if ~isempty(sens); if sens; I2Mfig(fii,15)= 1; widget_i2mrec(base,'sens');
                     else;    I2Mfig(fii,15)= 0; widget_i2mrec(base,'nosens'); end; end;

  if ischar(not_r),  I2Mnotr{fii}  =not_r; end;
  if ischar(f_get),  I2Msget{fii,1}=f_get; end;
  if ischar(p_set),  I2Msget{fii,2}=p_set; end;

  if     ischar(eventf); I2Mfevn{fii}=['___' eventf];
  elseif ischar(eventp); I2Mfevn{fii}=eventp;  end;

  if ischar(uname);  I2Mfun{fii} =char(uname); end;

  if ~isempty(leader);   I2Mfig(fii,17)=leader;    end;

  if ischar(kill_notify); kill_notify=lower(kill_notify); ev =num2str(base ,20);
     p=strfind(kill_notify,'___');
     if p, if p==1,  kill_notify=strmid(kill_notify,3,50);
           ev =['struct(''structure_name'',''TLB_KILL_REQUEST_EVENTS'',''id'',' num2str(base ,20) ',''top'',' num2str(top,20) ',''handler'', 0 )']; end;
     end;
     if kill_notify == 'i2mrec', kill_notify=''; end;
     if ~isempty(kill_notify),   kill_notify=[kill_notify '(' ev '); ']; end;
     kill_notify=[kill_notify 'widget_i2mrec(' num2str(base,20) ',''del'');'];
     if I2Mfig(fii,6) == 3, that=fig; else, that=base; end;
     set(that,'DeleteFcn',kill_notify);
  end;

  if ischar(notify_realize); notify_realize=lower(notify_realize);
     ev =['struct(''structure_name'',''NOTIFY_REALIZE'',''id'',' num2str(base ,20) ',''top'',' num2str(top,20) ',''handler'', 0 )'];
     if ~isempty(notify_realize), notify_realize=[notify_realize '(' ev '); ']; end;
     if I2Mfig(fii,6) == 3, that=fig; else, that=base; end;
     set(that,'CreateFcn',notify_realize);
  end;

  if ~isempty(but_ev); if ~but_ev, set(base,'ButtonDownFcn',''); else,
     ev=['struct(''structure_name'',''WIDGET_DRAW'',''id'',wwd,''type'',0,''x'',x,''y'',y,''press'',1,''release'',0,''clicks'',1)'];
     cu= 'x=0;y=0;[x,y]=cursor(x,y,0);';
     set(base,'ButtonDownFcn',['wwd=' num2str(fii) ';' cu ' widget_i2mevent(' ev ');']); end;
  end;

  typ=get(base,'type'); if typ == 'uicontrol', styl=get(base,'style'); else, styl='?'; end;

  if ~isempty(sl_min) | ~isempty(sl_max); mim=get(base,'min'); mam=get(base,'max');
   if ~isempty(sl_min);  mim=sl_min; end; if ~isempty(sl_max); mam=sl_max; end;
   if mim > mam, set(base,'min',mam,'max',mim,'string','.'); else set(base,'min',mim,'max',mam); end; end;

  if ~isempty(getu) | ischar(getu);  getu=get(base,'userdata'); end;
  if ~isempty(setu);  set(base,'userdata',setu); end;
  if ~isempty(getv) | ischar(getv);if ~isempty(I2Msget{fii,1}), getv=eval([lower(I2Msget{fii,1}) '(base)'],'');
                      elseif typ =='uimenu'; getv=get(base,'label');
                      elseif typ =='axes';   getv=base;
                      elseif styl=='slider'; getv=get(base,'value'); tiit=get(base,'string'); if tiit(1)=='.', getv=get(base,'min')+get(base,'max')-getv; end;
                      elseif but == 12;      getv=get(base,'value');
                      elseif but == 19;      getv=widget_tabinfo(base,'getv',use_tab,0);
                      else,  getv=get(base,'string'); if iscell(getv), getv=i2mstr(getv'); else getv=i2mstr({getv}); end; end; end;
  if ~isempty(setv) | ischar(setv);
  		      if ~isempty(I2Msget{fii,2}),      eval([lower(I2Msget{fii,2}) '(base,setv)'],'');
                      elseif typ =='uimenu'; set(base,'label',setv);
                      elseif typ =='axes';
                      elseif styl=='slider'; tiit=get(base,'string'); if tiit(1)=='.', mpv=get(base,'min')+get(base,'max')-setv; else mpv=setv; end; set(base,'value',mpv);
                      elseif but == 3.6;     set(base,'string',setv);
                      elseif but == 19; bid=widget_tabinfo(base,'setv',use_tab,setv);
                      else,  [vol,lx,ly]=widget_valset(base,setv,but,append); end; end;

  if ~isempty(editable); if but==19, widget_tabinfo(base,'edit',editable,0);
  			 elseif editable, set(base,'Enable','on'); else, set(base,'Enable','inactive'); end; end;

  if ~isempty(edit_cell); bid=widget_tabinfo(base,'edce',edit_cell,0); end;

  if ~isempty(set_list_top); set(base,'ListboxTop',set_list_top+1); end;

  if ~isempty(set_list_sel); set(base,'value',set_list_sel+1); end;

  if ~isempty(set_drop_sel); set(base,'value',set_drop_sel+1); end;

  if ~isempty(set_but);  set(base,'value',set_but); end;

  if ~isempty(get_draw); get_draw=[0 0]; end;

  if realz;
          widget_i2mrec(base,'create');
          widget_i2mrec(base,'basdim');
          widget_i2mrec(base,'baspos');
          widget_i2mrec(base,'revers');
          widget_i2mrec(base,'basens'); % +notify_realize

          rf=get(fig,'ResizeFcn'); set(fig,'ResizeFcn',''); %Not yet resize_event from here
          set(fig,'position',[20,20,I2Mfig(fii,9:10)+4]);
          widget_i2mrec(base,'basmap');
          if I2Mfig(fii,5), set(I2Mfig(fii,3),'visible','on'); end;

         %set(fig,'ResizeFcn',rf); %Problem: resize_event at this point !!!
  end;
  if ~isempty(timer); widget_signal(base,timer); end;

  if ~isempty(tlb_get_offset);  screen=get(0,'ScreenSize'); pos=get(fig,'position');
                                tlb_get_offset=[pos(1) screen(4)-pos(2)-pos(4)];  end;

  if ~isempty(tlb_set_xoffset); pos=get(fig,'position'); pos(1)=tlb_set_xoffset; set(fig,'position',pos); end;

  if ~isempty(tlb_set_yoffset); screen=get(0,'ScreenSize'); pos=get(fig,'position');
                                pos(2)=screen(4)-tlb_set_yoffset-pos(4); set(fig,'position',pos); end;

  if ~isempty(tlb_get_size);    pos=get(fig,'position'); tlb_get_size=[pos(3:4)]; end;

  if ~isempty(tlb_set_title);   set(fig ,'Name',tlb_set_title); end;

  if  show; figure(fig); end;

  if ~isempty(focus); figure(fig); end;

  if ~isempty(send_event); i2mevent(send_event); end;

  if ~isempty(draw_xsize), bose=I2Mfig(fii,2); bos=int16(bose); pos=I2Mfig(bos,7:10); pos(3)=draw_xsize; I2Mfig(bos,7:10)=pos; set(bose,'position',pos); end;
  if ~isempty(draw_ysize), bose=I2Mfig(fii,2); bos=int16(bose); pos=I2Mfig(bos,7:10); pos(4)=draw_ysize; I2Mfig(bos,7:10)=pos; set(bose,'position',pos); end;

  if ~isempty(scr_xsize),  if typ=='axes'; bose=I2Mfig(fii,2); else bose=base;  end;  bos=int16(bose);
                                                                pos=I2Mfig(bos,7:10); pos(3)=scr_xsize;  I2Mfig(bos,7:10)=pos; set(bose,'position',pos); I2Mfig(bos,19)=0;
                                                               %!! if bos==I2Mfig(bos,11), set(I2Mfig(bos,3),'position',pos); end;
                                                                end;
  if ~isempty(scr_ysize),  if typ=='axes'; bose=I2Mfig(fii,2); else bose=base;  end;  bos=int16(bose);
                                                                pos=I2Mfig(bos,7:10); pos(4)=scr_ysize;  I2Mfig(bos,7:10)=pos; set(bose,'position',pos); I2Mfig(bos,20)=0;
                                                               %!! if bos==I2Mfig(bos,11), set(I2Mfig(bos,3),'position',pos); end;
                                                                end;
  if  but==19,xsize=[]; end;
  if ~isempty(xsize),      if typ=='axes'; bose=I2Mfig(fii,2); else bose=base;  end;  bos=int16(bose);   if (but==13) | (but==16), if but==13, ip=2; else, ip=3; end;
                                                                                                                                   xs=(xsize+ip)*I2Mfcar(1); if I2Mfig(fii,19)>0, xs=xs*I2Mfig(fii,19); end; else xs=xsize; end;
                                                                pos=I2Mfig(bos,7:10); pos(3)=xs;         I2Mfig(bos,7:10)=pos; set(bose,'position',pos); I2Mfig(bos,19)=0; end;
  if  but==19,ysize=[]; end;
  if ~isempty(ysize),      if typ=='axes'; bose=I2Mfig(fii,2); else bose=base;  end;  bos=int16(bose);   if (but==13) | (but==16), ys=(ysize)   *I2Mfcar(2); if I2Mfig(fii,20)>0, ys=ys*I2Mfig(fii,20); end; else ys=ysize; end;
                                                                pos=I2Mfig(bos,7:10); pos(4)=ys;         I2Mfig(bos,7:10)=pos; set(bose,'position',pos); I2Mfig(bos,20)=0; end;

  if ~isempty(xoffset),    if typ=='axes'; bose=I2Mfig(fii,2);  bos=int16(bose); ypar=I2Mfig(int16(I2Mfig(bos,2)),7:10); else, ypar=I2Mfig(int16(I2Mfig(fii,2)),7:10); end;
                           if typ=='axes';                      pos=I2Mfig(bos,7:10); pos(1)=ypar(1)+xoffset;                I2Mfig(bos,7:10)=pos; set(bose,'position',pos); end;
                                                                pos=I2Mfig(fii,7:10); pos(1)=ypar(1)+xoffset;                I2Mfig(fii,7:10)=pos; set(base,'position',pos); end;
  if ~isempty(yoffset),    if typ=='axes'; bose=I2Mfig(fii,2);  bos=int16(bose); ypar=I2Mfig(int16(I2Mfig(bos,2)),7:10); else, ypar=I2Mfig(int16(I2Mfig(fii,2)),7:10); end;
                           if typ=='axes';                      pos=I2Mfig(bos,7:10); pos(2)=ypar(4)-yoffset-pos(4)+ypar(2); I2Mfig(bos,7:10)=pos; set(bose,'position',pos); end;
                                                                pos=I2Mfig(fii,7:10); pos(2)=ypar(4)-yoffset-pos(4)+ypar(2); I2Mfig(fii,7:10)=pos; set(base,'position',pos); end;
  if destr; widget_i2mrec(base,'del'); end;

else,  bad=base; end;
end;

catch, bad=base; end; end;
if I2M_out, eval(I2M_out); end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
