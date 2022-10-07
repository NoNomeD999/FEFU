unit ourtype;
interface
const N = 100;

type data = record
  dd: string[2];    //31
  mm: string[2];    //12
  yyyy: string[4];  //1960-2001
end;

type Sotr = record
      Fam: string[20];    //фамилия
      i: string[4];       //инициалы
      pol: string[1];     //пол
      prof: string[20];   //профессия
      DR: data;           //дата рождения
      DPA: data;          //Дата атестации
    end;
    arr_Sotr = array[1..N] of Sotr;
    
implementation
end.