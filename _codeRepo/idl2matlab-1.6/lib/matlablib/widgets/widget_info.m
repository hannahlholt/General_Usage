function [res,varargout]=widget_info(varargin)
%PRO widget_info, base, BAD_ID=bad, ...
%*** ***********
%***
%UNUSED : modal, version

    I2Mkwn=char('I2M_a1' , 'active' , 'managed' , 'child' , 'draw_button_events' , 'column_width' , 'row_heights' , 'table_editable' , 'table_edit_cell' , 'table_select' , 'use_table_select' , 'droplist_number' , 'droplist_select' , 'event_pro' , 'event_func' , 'find_by_uname' , 'geometry' , 'list_number' , 'list_num_visible' , 'list_select' , 'list_top' , 'name' , 'parent' , 'realized' , 'slider_min_max' , 'text_editable' , 'text_number' , 'text_top_line' , 'tlb_kill_request_events' , 'type' , 'uname' , 'valid_id' , 'version' , 'I2M_pos');
    I2Mkwv=    {'bise'   , 'active' , 'managed' , 'child' , 'but_ev'             , 'c_width'      , 'r_heights'   , 'tab_edi'        , 'tab_edc'         , 'tab_sel'      , 'use_tab'          , 'drop_num'        , 'drop_sel'        , 'eventp'    , 'eventf'     , 'find_by_u'     , 'geometry' , 'list_num'    , 'list_numv'        , 'list_sel'    , 'list_top' , 'name' , 'parent' , 'realized' , 'slider_mm'      , 'text_edit'     , 'text_num'    , 'text_top'      , 'tlb_kill'                , 'type' , 'uname' , 'valid_id' , 'version' , 'I2M_pos'};   
    bise=[]; active=[]; managed=[]; child=[]; but_ev=[]; c_width=[]; r_heights=[]; tab_edi=[]; tab_edc=[]; tab_sel=[]; use_tab=[]; drop_num=[]; drop_sel=[]; eventp=[]; eventf=[]; find_by_u=[]; geometry=[]; list_num=[]; list_numv=[]; list_sel=[]; list_top=[]; name=[]; parent=[]; realized=[]; slider_mm=[]; text_edit=[]; text_num=[]; text_top=[]; tlb_kill=[]; type=[]; uname=[]; valid_id=[]; version=[]; I2M_pos=[];

    I2M_lst={}; I2M_out=''; lv=length(varargin); if rem(lv,2) ~= 0, I2M_ok=0; else, I2M_ok=1;
for I2M=1:2:lv; I2M_tmp=varargin{I2M}; if ~ischar(I2M_tmp); I2M_ok=0; break; end; I2Mx=strmatch(I2M_tmp,I2Mkwn); if length(I2Mx) ~=1, if I2M==1, I2M_ok=0; break; end; else, eval([I2Mkwv{I2Mx} '=varargin{I2M+1};']); I2M_lst{(I2M+1)/2}=I2Mkwv{I2Mx}; end; end; end;
if ~I2M_ok; for I2M=1:lv; eval([I2Mkwv{I2M} '=varargin{I2M};']); end; end;
if ~isempty(I2M_pos); for I2M=1:length(I2M_pos); I2Ms=num2str(I2M); I2M_out=[I2M_out 'varargout{' I2Ms '}=' I2M_lst{I2M_pos(I2M)} '; ']; end; end;

global I2Mfig I2Mfevn I2Msget I2Mfgap I2Mreg I2Mfun

%I2Mfig(wid,*)= 1=wid, 2=parent, 3=fig, 4=lay, 5=map, 6=uic, 7:10=pos, 11=top ,12=seq, 13=freq, 14=rest, 15=sens ,16=but ,17=grp ,18=bgc, 19:20=szz
%lay= 1:column, 2:row, 3:none
%uic= 1:base,   2:uic, 3:fig
%but= 0:normal  1:excl 2:nonexcl 3:menu 4:bar

res=[];
if ~isempty(active) , I2Mreg.I2Mbid=0; names=fieldnames(I2Mreg); if length(names)>1, res=1; end; end;
if ~isempty(managed), I2Mreg.I2Mbid=0; names=fieldnames(I2Mreg); if length(names)>1, res=1; if isempty(bise), for j=1:length(names); res(j)=getfield(I2Mreg,names{j}); end; end; end; end;

try,
if ~isempty(bise); base=I2Mfig(int16(bise),1);
 for j=1:length(base); bose=base(j); fii=double(int16(bose)); fig=I2Mfig(fii,3); top=I2Mfig(I2Mfig(fii,11),1);
   if ~isempty(child);	  res(j)=0; idx=find(I2Mfig(:,2) == bose);
			  if (idx), [tmp,srt]=sort(I2Mfig(idx,12));
			  res(j)=I2Mfig(idx(srt(1)),1); end; end;

   if ~isempty(but_ev);	  res(j)=0; evp=get(bose,'ButtonDownFcn'); if ~isempty(evp), res(j)=1; end; end;

   if ~isempty(c_width);  res=widget_tabinfo(base,'c_xs',use_tab,0); end;
   if ~isempty(r_heights);res=widget_tabinfo(base,'r_ys',use_tab,0); end;
   if ~isempty(tab_edi);  res=widget_tabinfo(base,'t_ed',use_tab,0); end;
   if ~isempty(tab_edc);  res=widget_tabinfo(base,'t_ec',use_tab,0); end;
   if ~isempty(tab_sel);  res=widget_tabinfo(base,'t_se',use_tab,0); end;

   if ~isempty(drop_num); str=get(bose,'String'); res(j)=n_elements(str); end;

   if ~isempty(drop_sel); res(j)=get(bose,'Value')-1; end;

   if     ~isempty(eventf);   rs=I2Mfevn{fii};if isempty(rs), rs=' '; else, p=strfind(eventp,'___'); if p, if p==1, rs=strmid(eventp,3,50); else, rs=' '; end; else, rs=' '; end; end;
                                                                           if isempty(res), res={rs}; else res{j}=rs; end;
   elseif ~isempty(eventp);   rs=I2Mfevn{fii};if isempty(rs), rs=' '; end; if isempty(res), res={rs}; else res{j}=rs; end; end;
   
   if ~isempty(find_by_u);res(j)=0; if ~iscellstr(I2Mfun), for i=1:length(I2Mfun), if length(I2Mfun{i})==0, I2Mfun{i}=''; end; end; end;
   			  idx=strmatch(find_by_u,I2Mfun,'exact');
   			  if idx, if length(idx)>1; figs=I2Mfig(idx,3); idy=(figs == fig); if idy, idx=idx(idy); else, idx=[]; end; end;
   			          if idx, res(j)=I2Mfig(idx(1),1); end; end; end;

   if ~isempty(geometry); typ=get(bose,'type');
   			  if typ=='axes'; bise=I2Mfig(fii,2); fkk=int16(bise); pos=I2Mfig(fkk,7:10); dx=pos(3); dy=pos(4); else, fkk=fii; pos=I2Mfig(fkk,7:10); dx=0; dy=0; end;
			  KPfig=[];
			  if pos(3)*pos(4) <= 0; %be sure base is realized ...
   			     KPfig=I2Mfig; try, widget_i2mrec(bose,'create'); widget_i2mrec(bose,'basdim');
   			     if typ=='axes'; pos=I2Mfig(fkk,7:10); dx=pos(3); dy=pos(4); else, pos=I2Mfig(fkk,7:10); end; catch, I2Mfig=KPfig; end;
			  end;
			  pas=I2Mfig(int16(I2Mfig(fkk,2)),7:10);
			  xof=pos(1)-pas(1); yof=pas(4)-pos(4)-pos(2)+pas(2);
			  if  I2Mfig(fii,6)~=2, pad=I2Mfgap; else, pad=0; end;
   			  rs =struct('structure_name','WIDGET_GEOMETRY','xoffset',xof,'yoffset',yof,'xsize',pos(3),'ysize',pos(4),'scr_xsize',pos(3),'scr_ysize',pos(4),'draw_xsize',dx,'draw_ysize',dy,'margin',0,'xpad',pad,'ypad',pad,'space',pad);
			  if  isempty(res), res=rs; else res(j)=rs; end;
			  if ~isempty(KPfig), I2Mfig=KPfig; end;
   			  end;
   
   if ~isempty(list_num); str=get(bose,'String'); res(j)=n_elements(str); end;
   
   if ~isempty(list_numv);str=get(bose,'String'); res(j)=n_elements(str); end;
   
   if ~isempty(list_sel); res(j)=get(bose,'Value')-1; end;
   
   if ~isempty(list_top); res(j)=get(bose,'ListboxTop')-1; end;
   
   if ~isempty(name);     typ=get(bose,'type'); if typ == 'uicontrol', typ=get(bose,'style'); end;
			  switch typ;
			  case 'frame';    rs='FRAME';    case 'slider'; rs='SLIDER'
			  case 'edit';     rs='TEXT';     case 'axes';   rs='DRAW';
			  case 'text';     rs='LABEL';    case 'listbox';rs='LIST';
			  case 'popupmenu';rs='DROPLIST'; case 'table';  rs='TABLE';
			  otherwise;       rs='BUTTON';   end;
			  if isempty(res), res={rs}; else res{j}=rs; end; end;
   
   if ~isempty(parent);   res(j)=I2Mfig(fii,2); if I2Mfig(fii,6)==3, res(j)=0; end; end;
   
   if ~isempty(realized); res(j)=0; if I2Mfig(fii,1)==bose, if prod(I2Mfig(fii,7:10)) >0, res(j)=1; end; end; end;
   
   if ~isempty(slider_mm);res(1,j)=get(bose,'Min'); res(2,j)=get(bose,'Max'); end;
   
   if ~isempty(text_edit);res(j)=0; ena=get(bose,'Enable'); if ena=='on', res(j)=1; end; end;
   
   if ~isempty(text_num); str=get(bose,'String'); res(j)=n_elements(str); end;
   
   if ~isempty(text_top); res(j)=0; end;
   
   if ~isempty(tlb_kill); res(j)=0; str=get(fig,'DeleteFcn'); chn=strfind(str,'TLB_KILL'); if ~isempty(chn), res(j)=1; end; end;
   
   if ~isempty(type);     typ=get(bose,'type'); if typ == 'uicontrol', typ=get(bose,'style'); end;
			  switch typ;
			  case 'frame';    res(j)=0; case 'slider'; res(j)=2
			  case 'edit';     res(j)=3; case 'axes';   res(j)=4;
			  case 'text';     res(j)=5; case 'listbox';res(j)=6;
			  case 'popupmenu';res(j)=8; case 'table';  res(j)=9;
			  otherwise;       res(j)=1; end;  end;
   
   if ~isempty(uname);    rs=I2Mfun{fii};if isempty(rs), rs=' '; end; if isempty(res), res={rs}; else res{j}=rs; end; end;
   
   if ~isempty(valid_id); if I2Mfig(fii,1)==bose, res(j)=1; else, res(j)=0; end; end;
   
   if ~isempty(version);  res=struct('structure_name','WIDGET_VERSION','style','','toolkit','','release','');
 end;
 end;
end;

catch, disp(lasterr);      end;
if isempty(res), res=0;    end;
if iscell (res), if length(res)>1, res=i2mstr(res); else, res=res{1}; end; end;
if I2M_out, eval(I2M_out); end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
