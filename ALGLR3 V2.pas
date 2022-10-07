
const
  e_f = 0.0000001;

var
  a, b, x, xx, h, ccos, recc, expcos, forexp, max, min  : real;
  m, i, n, k,j,c,v,p,s: integer;
  z : array [1..20,1..20] of real;
function funkciz(x:real):real; 
begin
    xx:=x;
    m := 0;
    ccos := 1; 
    recc := 1;
    forexp:=1;
    expcos:=1;
    if x > 10 then
      while x > 10 do
        x := x - 2 * pi;
      while x<-10 do
        x:=x+2*pi;
    m := 0;
    while abs(recc) > e_f do
    begin
      m := m + 2;
      recc := recc * -1 * x * x / (m * (m - 1));
      ccos := ccos + recc;
    end;
    m:=0;
    while abs(forexp) > e_f do
    begin
      m+=1;
      forexp:=(forexp*ccos)/m;
      expcos := expcos+forexp;
    end;
   funkciz:=expcos;//xx;
  end;
  
  
  begin
  writeln('Введите диапазон [a;b]');
  readln(a, b);
  writeln('Введите целое число n, больше 0, размер матрицы');
  readln(n);
  while n < 1 do begin
    writeln('Некорректный ввод');
    readln(n); end;
    h := (b - a) / (n*n-1);
    if a=b then n:=0;
//for i := 0 to n*n do begin x := a + i * h; write(funkciz(x):10:7, ' ');end;
  
  writeln;
  writeln;
  k:=0;
 
  if n mod 2 <> 0 then 
                      for j:=n downto 1 do 
                          if j mod 2 <>0 then   
                                            for i:=n downto 1 do 
                                                begin x := a + k * h;
                                                      z[i,j]:=funkciz(x);
                                                      k:=k+1;
                                                end
                                          else 
                                            for i:=1 to n do 
                                              begin x := a + k * h;
                                                    z[i,j]:=funkciz(x);
                                                    k:=k+1;
                                              end
                   else
                   for j:=n downto 1 do 
                          if j mod 2 = 0 then   
                                            for i:=n downto 1 do 
                                                begin x := a + k * h;
                                                      z[i,j]:=funkciz(x);
                                                      k:=k+1;
                                                end
                                          else 
                                            for i:=1 to n do 
                                              begin x := a + k * h;
                                                    z[i,j]:=funkciz(x);
                                                    k:=k+1;
                                              end;                 
                  
  for i:=1 to n do 
    begin for j:=1 to n do write (z[i,j]:10:7,' ');
          writeln;
    end;
  
  p:=n;
  while p>=1 do
  begin 
   max:=z[p,1]; min:=z[p,1]; m:=p;k:=1;c:=p;v:=1; 
   s:=0;
   for i:=p to n do 
        begin
              s:=s+1;
              if z[i,s]>max then begin max:=z[i,s]; m:=i;k:=s end;
              if z[i,s]<min then begin min:=z[i,s]; c:=i; v:=s end;
        end;
   p:=p-1;
   
   z[m,k]:=min;
   z[c,v]:=max;
  end;
       
 
 
 
 p:=n;s:=1;
  while p>2 do
  begin 
   max:=z[1,s+1]; min:=z[1,s+1]; m:=1;k:=s+1;c:=1;v:=s+1;
   for i:=1 to n-s do 
        begin
              if z[i,i+s]>max then begin max:=z[i,i+s]; m:=i;k:=i+s end;
              if z[i,i+s]<min then begin min:=z[i,i+s]; c:=i; v:=i+s end;
        end;
   p:=p-1;
   z[m,k]:=min;
   z[c,v]:=max;
   s:=s+1; 
  end;
    
    writeln;
    writeln;
    for i:=1 to n do 
    begin for j:=1 to n do write (z[i,j]:10:7, ' ');
          writeln;
    end;
   
                    
end. 
