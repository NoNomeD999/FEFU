unit ourprocedures;
interface
uses ourtype;
var
  y_DR, y_DPA: word;
procedure check_inic(var s1: string; var err: boolean);
procedure check_fam(var s1: string; var err: boolean);
procedure check_prof(var s1: string; var err: boolean);
procedure check_pol(var s1: string; var err: boolean);
procedure check_DR(var s1:string; var err:boolean);
procedure check_DPA(var s1:string; var err:boolean);
procedure sort(var arr_Sotr_true:arr_Sotr; kol_true:integer);
procedure check_prob(var s1: string; var err: boolean);
procedure checkprob2(var s1:string; var err:boolean);
implementation

procedure check_fam(var s1: string; var err: boolean);
var
  i,p: integer;
  j: boolean;
begin
  err := false;
  p:=0;
  j:=false;
                     for i:= 1 to 20 do begin
                         while (s1[i]<>' ') and (err=false)and (j=false) do begin
                               if i<> (p+1) then begin err := true;
                                  s1 := s1 + 'эу че творишь чорт';
                                  end
                                else  j:=true;
                                p:=i;
                      end;
                      
                      end;
           if  not (s1[1] in ['A'..'Z'])
                    then begin 
                      err := true; 
                      s1 := s1 + '- Ошибка в первой букве фамилии. Первая буква должна быть заглавной латинской.'; 
                    end
                    else begin
                      i:=2;
                      while (i<=length(s1))and (s1[i]<>' ') and (err=false) do
                        begin
                          if  not (s1[i] in ['a'..'z', 'A'..'z', '-']) 
                              then begin
                                err := true;//проверка на запрещенные символы
                                s1 := s1 + '- в фамилии запрещенный символ:' + s1[i] + ', номер символа:' + i + ' Используйте для записи фамилии только латинские буквы';
                              end;
                          inc(i);
                        end;
                      while (i<=length(s1))and (err=false) do begin
                          if s1[i]<>' ' 
                            then begin
                              err := true;//проверка на запрещенные символы
                              s1 := s1 + '- в фамилии запрещенный символ:' + s1[i] + ', номер символа:' + i + ' Используйте для записи фамилии только латинские буквы';
                            end;
                          inc(i);
                        end;
                    end;
end;

procedure check_inic(var s1: string; var err: boolean);
begin
 err := false;
 
 if  not (s1[1] in ['A'..'Z']) and not (s1[3] in ['A'..'Z'])
                    then begin 
                      err := true; 
                      s1 := s1 + '- ошибка в букве инициалов.  Инициалы должны быть записаны заглавными латинскими буквами'; 
                    end
                    else begin
                      if (s1[2] <> '.') and (s1[4] <> '.') 
                        then begin
                          err := true;
                          s1 := s1 + '- в поле "Инициалы" замечен недопустимый символ. Инициалы должны быть записаны в формате [A.D.] ';
                        end;
                    end;
end;

procedure check_prof(var s1: string; var err: boolean);
var
  i: integer;
begin
      
  err := false;
 if  not (s1[1] in ['A'..'Z'])
                    then begin 
                      err := true; 
                      s1 := s1 + '- Ошибка в первой букве професии. Первая буква должна быть заглавной латинской'; 
                    end
                    else begin
                      i:=2;
                      while (i<=length(s1))and (s1[i]<>' ') and (err=false) do begin
                          if  not (s1[i] in ['a'..'z', '-']) 
                            then begin
                              err := true;
                              s1 := s1 + '- в поле професии запрещенный символ:' + s1[i] + ', номер символа:' + i;
                            end;
                            inc(i);
                      end;
                      while (i<=length(s1))and (err=false) do begin
                          if s1[i]<>' ' 
                            then begin
                              err := true;
                              s1 := s1 + '- в поле профессии запрещенный символ: ' + s1[i] + ', номер символа:' + i;
                            end;
                          inc(i);
                        end;
                    end;
end;

procedure check_pol(var s1: string; var err: boolean);
begin   
  err := false;
  
  if  not (s1 = 'M') and not (s1 = 'F')
      then begin 
        err := true; 
        s1 := s1 + '- в поле "Пол" замечен недопустимый символ. Для записи пола используйте только заглавные латинские буквы (F или M)';
      end;
end;

procedure check_DR(var s1 : string; var err : boolean);
var
  d, m, y : integer; //d - day, m - month, y - year
  err_d, err_m, err_y : integer;
begin
  err:= false;
  
  val(copy(s1,1,2), d, err_d); //переводим день в число
  val(copy(s1,4,2), m, err_m); //переводим месяц в число
  val(copy(s1,7,4), y, err_y); //переводим год в число
  y_DR:=y;
   
  if (err_d <> 0) or (s1[1] = ' ') or (s1[2] = ' ') then begin err := true; 
                             s1 := s1 + '- в поле "Дата рождения" (день) замечен(-ы) недопустимый(-ые) символ(-ы) используйте для ввода цифры';
                       end
      else if (err_m <> 0)  or (s1[4] = ' ') or (s1[5] = ' ') then begin err := true;
                                      s1 := s1 + '- в поле "Дата рождения" (месяц) замечен(-ы) недопустимый(-ые) символ(-ы) используйте для ввода цифры';
                                end
          else if (err_y <> 0) then begin err := true;
                                          s1 := s1 + '- в поле "Дата рождения" (год) замечен(-ы) недопустимый(-ые) символ(-ы) используйте для ввода цифры';
                                    end
              else if (y < 1960) or (y > 2000) then begin err := true; 
                                                          s1 := s1 + '- в поле «Дата рождения» в значении год встречено недопустимое значение. Значения должны соответствовать (1960...2000) ';
                                                    end
                  else if (m < 1) or (m > 12) then begin err := true;
                                                         s1 := s1 + '- в поле «Дата рождения» в значении месяц встречено недопустимое значение. Значения должны соответствовать (1..12).';
                                                   end
                     else if (s1[3] <> '.') or (s1[6] <> '.') then begin err := true; 
                                                         s1 := s1 + '- в поле «Дата рождения» замечен(-ы) недопустимый(-ые) разделитель(-и) используйте в качестве разделителя(-ей) точки.';
                                                                     end
                      else case m of 
                              2: begin
                                  if (y mod 4 = 0) or (y mod 100 <> 0) and (y mod 400 = 0) 
                                        then if (d >= 1) and (d <= 29) then err := false
                                                                       else begin err := true;
                                                                                  s1 := s1 + '- в поле «Дата рождения» в значении день встречено недопустимое значение. Значения должны соответствовать (1..31)';
                                                                            end
                                        else if (d >= 1) and (d <= 28) then err := false
                                                                       else begin err := true;
                                                                                  s1 := s1 + '- В поле «Дата рождения» в значении день встречено недопустимое значение. Значения должны соответствовать (1..31)';
                                                                            end;
                                 end;
                              4, 6, 9, 11: if (d >= 1) and (d <= 30) then err := false
                                                                     else begin err := true;
                                                                                s1 := s1 + '- В поле «Дата рождения» в значении день встречено недопустимое значение. Значения должны соответствовать (1..31)';
                                                                          end;
                              else if (d >= 1) and (d <= 31) then err := false
                                                             else begin err := true;
                                                                        s1 := s1 + '- В поле «Дата рождения» в значении день встречено недопустимое значение. Значения должны соответствовать (1..31)';
                                                                  end;  
                          end;
end;


procedure check_DPA(var s1 : string; var err : boolean);
var
  d, m, y : integer; //d - day, m - month, y - year
  err_d, err_m, err_y : integer;
begin
  err:= false;
  
  val(copy(s1,1,2), d, err_d); //переводим день в число
  val(copy(s1,4,2), m, err_m); //переводим месяц в число
  val(copy(s1,7,4), y, err_y); //переводим год в число
  y_DPA:=y;
  if (err_d <> 0) or (s1[1] = ' ') or (s1[2] = ' ') then begin err := true; 
                             s1 := s1 + '- в поле "Дата последней аттестации"(день) замечен(-ы) недопустимый(-ые) символ(-ы) используйте для ввода цифры';
                       end;
       if (err_m <> 0)  or (s1[4] = ' ') or (s1[5] = ' ') then begin err := true;
                                      s1 := s1 + '- в поле "Дата последней аттестации"(месяц) замечен(-ы) недопустимый(-ые) символ(-ы) используйте для ввода цифры';
                                end
         else if (m < 1) or (m > 12) then begin err := true;
                                                         s1 := s1 + '- в поле «Дата последней аттестации» в значении месяц встречено недопустимое значение. Значение должно соответствовать (1..12)';
                                                   end;
           if (err_y <> 0) then begin err := true;
                                          s1 := s1 + '- в поле "Дата последней аттестации"(год) замечен(-ы) недопустимый(-ые) символ(-ы) используйте для ввода цифры';
                                    end
              else if (y < 1982) or (y > 2022) then begin err := true; 
                                                          s1 := s1 + '- в поле «Дата последней аттестации» в значении год встречено недопустимое значение. Значение должно соответствовать (1982...2022)';
                                                    end
                  
                    else if (s1[3] <> '.') or (s1[6] <> '.') then begin err := true; 
                                                         s1 := s1 + '- в поле "Дата последней аттестации" замечен(-ы) недопустимый(-ые) разделитель(-и) используйте в качестве разделителя(-ей) точки';
                                                                     end
                         else if not (y_DR + 18 <= y_DPA) then begin err:=true;
                                                         s1 := s1 + 'в поле "Дата последней аттестации" замечено недопустимое значение. Дата последней аттестации должна превышать дату рождения минимум на 18 лет.';
                                                                     end
                      else case m of 
                              2: begin
                                  if (y mod 4 = 0) or (y mod 100 <> 0) and (y mod 400 = 0) 
                                      then if (d >= 1) and (d <= 29) then err := false
                                                                     else begin err := true;
                                                                                s1 := s1 + '- в поле «Дата последней аттестации» в значении день встречено недопустимое значение. Значение должно соответствовать (1...29)';
                                                                          end
                                      else if (d >= 1) and (d <= 28) then err := false
                                                                     else begin err := true;
                                                                                s1 := s1 + '- в поле «Дата последней аттестации» в значении день встречено недопустимое значение. Значение должно соответствовать (1...28)';
                                                                          end;
                                 end;
                              4, 6, 9, 11: if (d >= 1) and (d <= 30) then err := false
                                                                     else begin err := true;
                                                                                s1 := s1 + '- в поле «Дата последней аттестации» в значении день встречено недопустимое значение. Значение должно соответствовать (1...30)';
                                                                          end;
                              else if (d >= 1) and (d <= 31) then err := false
                                                             else begin err := true;
                                                                        s1 := s1 + '- в поле «Дата последней аттестации» в значении день встречено недопустимое значение. Значение должно соответствовать (1...31)';
                                                                  end;  
                          end;
end;


procedure sort(var arr_Sotr_true:arr_Sotr; kol_true:integer);
var c: Sotr;
    i, j:integer;
begin
  for i := kol_true downto 2 do 
    for j := 1 to kol_true-1  do begin
      if arr_Sotr_true[j].Fam > arr_Sotr_true[j+1].Fam then begin
        c := arr_Sotr_true[j];
        arr_Sotr_true[j] := arr_Sotr_true[j+1];
        arr_Sotr_true[j+1] := c; 
      end;
    end;
end;

procedure check_prob(var s1: string; var err: boolean);
begin   
  err := false;
  
  if  not (s1 = ' ')
      then begin 
        err := true; 
        s1 := s1 + '– между полем(-ями) отсутствуют пробелы';
      end;
end;

procedure checkprob2(var s1:string; var err:boolean);
var i,p:integer;
begin
for i:= 1 to length (s1) do begin
while s1[i] <> ' ' do begin
p:=i;
if i<> p+1 then begin err := true;
            s1 := s1 + 'эу че творишь чорт';
end;
end;
end;
end;
end.