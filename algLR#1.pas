var
  a, b, c, k1, r, x0, y0, x, y, rr, crcl, mdl: Real; 
  
const
  s1 = 'Параметры не задают график окружности';
  s2 = 'Параметры не задают график модуля ';
  s3 = 'Область D: не образуется';
  s4 = 'Точка является точкой пересечения графиков';
  s5 = 'Точка лежит на границе области D';
  s6 = 'Точка лежит в области D';
  s7 = 'Точка не принадлежит области D';
begin
  writeln ('Введите 3 параметра окружности: '); //sqr(x-x0) + sqr(y-y0) = sqr(r)
  read (r, x0, y0);
  writeln ('Введите 4 параметра модуля: '); //y = k1 * |a * x + b| + c
  read(k1, a, b, c);
  writeln ('Введите координаты точки: ');
  read (x, y);
  rr :=sqr(r);
  crcl :=(sqr(x - x0) + sqr(y - y0));
  mdl := (k1 * abs (a * x + b) + c);
  if r <= 0 then
    writeln(s1)
  else
    if (a = 0) or (k1 >= 0) then
      writeln(s2)
    else
      if (c<=(y0+r)) or 
      (((2*b+1)/a*(-2))<=(x0-r)) or
      (((2*b+1)/a*(-2))>=(x0+r)) then
        writeln(s3)
      else 
        if (rr = crcl) and (y = mdl) then
          writeln(s4)
        else 
          if (crcl=rr) and (y<mdl) or
          (crcl<rr) and (y=mdl) or
          (crcl=rr) and (y>mdl) and (x>=b) or
          (crcl>rr) and (y=mdl) and (x>=b)then
            writeln(s5)
          else
            if (crcl<rr)and (y<mdl)or
          (crcl>rr) and (y>mdl) and (x>b) then
            writeln(s6)
            else writeln(s7)
end.
