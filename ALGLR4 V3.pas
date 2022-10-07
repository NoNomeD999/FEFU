const
  num = 5;

var
  in1, outp: text;
  s, slovo: string;
  c: boolean;
  k: char;
  max, stroka, prog, pr, i, j, w: integer;
  mas: array [1..num, 1..num] of integer;

begin
  for i := 1 to num do
    for j := 1 to num do
      mas[i, j] := 0;
  assign(in1, 'in1.txt');
  assign(outp, 'out.txt');
  reset(in1);
  rewrite(outp);
  while not eof(in1) do 
  begin
    readln(in1, s);
    slovo := '';
    inc(stroka);
    s := s + ' ';
    c := false;
    for i := 1 to length(s) do
    begin
      case s[i] of 
        '=':
          begin
            if s[i - 1] = ':'
              then c := true
            else if c = true
            then begin
              inc(mas[prog, 3]);
              c := false;
            end;
          end;
        '>', '<':
          begin
            if c = true
            then begin
              inc(mas[prog, 3]);
              c := false;
            end;
          end;
        ' ',')','(',';':
          begin
            if s <> '' then 
            begin
              if slovo = 'program' then 
              begin
                inc(prog);
                mas[prog, 1] := stroka;
                mas[prog, 2] := pos('program', s);
                slovo := '';
              end
              else begin
                writeln(slovo,'*');
                slovo := slovo + ' ';
                if slovo = 'if ' then
                  inc(mas[prog, 3]);
                if slovo = 'while ' then
                  inc(mas[prog, 3]);
                if slovo = 'repeat ' then
                  inc(mas[prog, 3]);
                if slovo = 'and ' then
                  begin if c=true then
                    inc(mas[prog, 3]);
                    c:=false;
                    end;
                if slovo = 'or ' then
                  begin if c=true then
                    inc(mas[prog, 3]);
                    c:=false;
                    end;
                slovo := '';
              end;
            end;
            
          end;
        //';': c := false
      else begin slovo := slovo + s[i] end;
      end;
    end;
  end;
  for i := 1 to 3 do
    writeln('Количество логических выражений в программе ', i, ' равно ', mas[i, 3]);
  max := mas[1, 3];
  pr := 1;
  if mas[2, 3] > max then begin
    max := mas[2, 3];
    pr := 2;
  end;
  if mas[3, 3] > max then begin
    max := mas[3, 3];
    pr := 3;
  end;  
  close(in1);
  close(outp);
  reset(in1);
  rewrite(outp);  
  stroka := 0;
  while not eof(in1) do
  begin
    readln(in1, s);
    inc(stroka);
    if pr = 3 then begin
      if stroka = mas[3, 1] then
        writeln(outp, copy(s, mas[3, 2], length(s) - mas[3, 2]))
      else if stroka > mas[3, 1] then
        writeln(outp, s);
    end;
    if pr = 2 then begin
      if (stroka = mas[2, 1]) and (mas[2, 1] = mas[1, 1]) 
      and (mas[2, 1] = mas[3, 1]) then
        writeln(outp, copy(s, mas[2, 2], mas[2, 2] - mas[3, 2]))
      else if (stroka = mas[2, 1]) and (mas[2, 1] = mas[1, 1]) then
        writeln(outp, copy(s, mas[2, 2], length(s) - mas[2, 2]))
      else if (stroka = mas[2, 1]) and (mas[2, 1] = mas[3, 1]) then
        writeln(outp, copy(s, mas[2, 2], mas[2, 2] - mas[3, 2]))
      else if stroka = mas[2, 1] then
        writeln(outp, copy(s, mas[2, 2], length(s)))
      else if (stroka > mas[2, 1]) and (stroka < mas[3, 1]) then
        writeln(outp, s)
      else if stroka = mas[3, 1] then
        writeln(outp, copy(s, 1, mas[3, 2] - 1))
    end;
    if pr = 1 then begin
      if (stroka = mas[1, 1]) and (mas[1, 1] = mas[2, 1]) then
        writeln(outp, copy(s, mas[1, 1], mas[2, 2] - mas[1, 2]))
      else if (stroka >= mas[1, 1]) and (stroka < mas[2, 1]) then
        writeln(outp, s)
      else if stroka = mas[2, 1] then 
        writeln(outp, copy(s, 1, mas[2, 2] - 1))
    end;
  end;
  close(in1);
  close(outp);
end.