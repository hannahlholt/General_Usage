function val = i2m_index(expr,sidx)

assignin('caller','i2m__expr',expr);

val=evalin('caller',['i2m__expr(' sidx ')']);

return;
