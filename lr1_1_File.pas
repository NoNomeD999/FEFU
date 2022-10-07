program lr1_1_File;

uses ourtype,ourprocedures;

var
  f1, f2, f3: text;
  s, s1: string;
  k, num, a: integer;
  kol_true:integer;
  rec_sotr_true: Sotr;
  arr_sotr_true:arr_Sotr;
  err: boolean;
  


begin
  
  assign(f1, 'in.txt'); reset(f1);
  assign(f2, 'outTrue.txt'); rewrite(f2);
  assign(f3, 'outFalse.txt'); rewrite(f3);
  a := 0;
  kol_true:=0;
  
  while not eof(f1) and (a<=n) do
    
  begin //начинаем работу со всем файлом
    readln(f1, s);
    a:=a+1;
    //проверяем длину строки
    if length(s)=70  then begin
        num := 0;
   
   //проверка фамилии
        s1 := copy(s, 1, 20);
        check_fam(s1, err);
        if err = false 
           then begin num:=num+1;
                      rec_sotr_true.Fam := s1;
                 end
            else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
   
   //проверка инициалов
       s1 := copy(s, 22, 4);
       check_inic(s1, err);
       if err = false
          then begin num:=num+1;
                     rec_sotr_true.i := s1;
               end
          else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
          
    //проверка пола
        s1 := copy(s, 27, 1);
        check_pol(s1, err);
        if err = false 
           then begin num:=num+1;
                      rec_sotr_true.pol:=s1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
      
  //проверка профессии
        s1 := copy(s, 29, 20);
        check_prof(s1, err);
        if err = false 
           then begin num:=num+1;
                      rec_sotr_true.prof:=s1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
      
      
  //проверка даты рождения
        s1:=copy(s, 50, 10);
        check_DR(s1, err);
        if err = false 
           then begin num:=num+1;
                      rec_sotr_true.DR.dd:=copy(s1,1,2);
                      rec_sotr_true.DR.mm:=copy(s1,4,2);
                      rec_sotr_true.DR.yyyy:=copy(s1,7,4);
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
           
           
  //проверка даты последней аттестации
        s1:=copy(s, 61, 10);
        check_DPA(s1, err);
        if err = false 
           then begin num:=num+1;
                      rec_sotr_true.DPA.dd:=copy(s1,1,2);
                      rec_sotr_true.DPA.mm:=copy(s1,4,2);
                      rec_sotr_true.DPA.yyyy:=copy(s1,7,4);
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1); 
           
     //проверка наличия пробелов
           s1 := copy(s, 21, 1);
        check_prob(s1, err);
        if err = false 
           then begin num:=num+1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
    
    s1 := copy(s, 26, 1);
        check_prob(s1, err);
        if err = false 
           then begin num:=num+1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
           
     s1 := copy(s, 28, 1);
        check_prob(s1, err);
        if err = false 
           then begin num:=num+1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
           
           s1 := copy(s, 49, 1);
        check_prob(s1, err);
        if err = false 
           then begin num:=num+1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
           
           s1 := copy(s, 60, 1);
        check_prob(s1, err);
        if err = false 
           then begin num:=num+1;
                end
           else writeln(f3, 'Ошибка в строке ', a, ' = ', s1);
     //конец цикла работы со строкой
     
      if  (num = 11) 
        then begin
              kol_true:=kol_true+1;
              writeln(kol_true:5,a:5);
              arr_Sotr_true[kol_true]:=rec_Sotr_true;
        end;
   end
      else writeln(f3, 'Ошибка в строке ', a, ' = неверный формат', length(s), '           ', s); 
  
  end;
  
  if not eof(f1) then writeln(f3,'Кол-во строк не соответсвует значению');
  sort(arr_Sotr_true, kol_true);
 
  for k:=1 to kol_true do
    with arr_sotr_true[k] do
      writeln(f2, Fam:20,' ', Prof:20,' ', DPA.dd, '.', DPA.mm, '.', DPA.yyyy);
   //writeln(f2, Fam:20, ' ', i:4, ' ', Pol:1, ' ', Prof:20, ' ', DR:10, ' ', DPA:10);}

  close(f1);
  close(f2);
  close(f3);
end.