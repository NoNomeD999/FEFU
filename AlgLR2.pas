const
  e_f = 0.0000001;

var
  a, b, x, h, ccos, recc, expcos, x_prev, forexp: real;
  m, i, n: integer;

begin
  writeln('Введите диапозон [a;b]');
  readln(a, b);
  writeln('Введите целое число m, больше 0');
  readln(m);
  while m < 1 do begin
    writeln('Некорректный ввод');
    readln(m); end;
    h := (b - a) / m;
    if a=b then m:=0;
  for i := 0 to m do
  begin
    x := a + i * h;
    x_prev := x;
    n := 0;
    ccos := 1;
    recc := 1;
    forexp:=1;
    expcos:=1;
    if x > 10 then
      while x > 10 do
        x := x - 2 * pi;
      while x<-10 do
        x:=x+2*pi;
    
    n := 0;
    while abs(recc) > e_f do
    begin
      n := n + 2;
      recc := recc * -1 * x * x / (n * (n - 1));
      ccos := ccos + recc;
    end;
    n:=0;
    while abs(forexp) > e_f do
    begin
      n+=1;
      forexp:=(forexp*ccos)/n;
      expcos := expcos+forexp;
    end;
    writeln('x',x_prev:10:7, '     ', 'expcos ',expcos:10:9, '     ', 'exp(cos(x)) ',exp(cos(x_prev)):10:9);
  end;
end.
