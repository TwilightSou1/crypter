uses graphABC;

var
  ch, temp2:char;
  inputt, outputt:string;
  menu,crypt,uncrypt,start1,start2,check:boolean;
  input, output: text;
  i,key,temp,encount:integer;
  
procedure menumouse(x, y, press:integer);
begin
  if (press = 1) and (x>150) and (x<450) and (y>200) and (y<250)  then 
    begin
    uncrypt:=true;
    menu:=false;
  end;

  
  if (press = 1) and (x>150) and (x<450) and (y>100) and (y<150)  then 
  begin
    crypt:=true;
    menu:=false;
  end;
  

end;


  
begin

  window.Caption := 'Шифровальщик';
  SetWindowSize(600, 400);
  window.IsFixedSize := true;
  
  LockDrawing;
  
  menu:=true;
  
  if FileExists('input.txt') <> true then
  begin
    while true do
    begin
    writeln('Файл input.txt отсутствует');
    redraw
    end;
  end;
  
  assign(input,'input.txt');
  Reset(input);
  read(input,inputt);
  close(input);
  
  if FileExists('output.txt') <> true then
  begin
    while true do
    begin
    writeln('Файл output.txt отсутствует');
    redraw
    end;
  end;
  
  assign(output,'output.txt');
  
  while true do
  begin
  
    while menu = true do
    begin
      ClearWindow(clYellow);
      OnMouseUp:=menumouse;
      
      SetPenColor(clblue);
      SetFontColor(clBlue);
      SetBrushColor(clTransparent);
      SetFontSize(25);
      
      SetBrushColor(clYellowGreen);
      Rectangle(150,200,450,250);
      
      TextOut(200,204,'Расшифровка');

      SetBrushColor(clYellowGreen);
      Rectangle(150,100,450,150);
      
      TextOut(200,104,'Шифрование');
      
      Redraw;
      
    end;
    
    while crypt = true do
    begin
    ClearWindow(clLightBlue);
    
    SetBrushColor(clTransparent);
    TextOut(0,340,'Введите ключ:');  
    
    Redraw;
    
    readln(key);
    while key > 26 do key:=key-26;
    while i<>length(inputt) do
    begin
    
    i:=i+1;
    temp:=key-1;
    while temp <> 0 do
    begin

    if (inputt[i]>#96) and (inputt[i]<#123) then start1:=true;
    if start1 = true then
    begin
    
    if check = false then begin
      ch:=succ(inputt[i]);
      temp2:=ch;
      check:=true;
    end;
    
    if check = true then begin
      ch:=succ(temp2);
      temp2:=ch;
    end;
    
    temp:=temp-1;
    if ch >#122 then 
    begin
    encount:=26;
    while encount<>0 do
      begin
        ch:=pred(ch);
        encount:=encount-1;
      end;
    end;
    start1:=false;
    end
    else 
    if (inputt[i]>#64) and (inputt[i]<#91)then start2:=true;
    if start2 = true then
    begin
      
    if check = false then begin
      ch:=succ(inputt[i]);
      temp2:=ch;
      check:=true;
    end;
    
    if check = true then begin
      ch:=succ(temp2);
      temp2:=ch;
    end;
      
      temp:=temp-1;
      if (ch >#90)  then 
      begin
      encount:=26;
      while encount<>0 do
        begin
          ch:=pred(ch);
          encount:=encount-1;
        end;
      end;
    end;
    start2:=false;
    if inputt[i]=' ' then 
    begin
      ch:=' ';
      temp:=temp-1;
    end;

    end;
    outputt:=outputt+ch;
    check:=false;
    end;
    
    rewrite(output);
    write(output, outputt);
    close(output);
    
    Halt;
    
    end;
    
    while uncrypt = true do
    begin
    ClearWindow(clLightBlue);
    
    if key= 0 then
    begin
    SetBrushColor(clTransparent);
    TextOut(0,340,'Введите ключ:');
    end;
    
    
    Redraw;
    
    readln(key);
    while key > 26 do key:=key-26;
    while i<>length(inputt) do
    begin
    
    i:=i+1;
    temp:=key-1;
    while temp <> 0 do
    begin
    if (inputt[i]>#96) and (inputt[i]<#123) then start1:=true;
    if start1 = true then
    begin
    
    if check = false then begin
      ch:=pred(inputt[i]);
      temp2:=ch;
      check:=true;
    end;
    
    if check = true then begin
      ch:=pred(temp2);
      temp2:=ch;
    end;
    
    temp:=temp-1;
    if ch <#97 then 
    begin
    encount:=26;
    while encount<>0 do
      begin
        ch:=succ(ch);
        encount:=encount-1;
      end;
    end;
    start1:=false;
    end
    else 
    if (inputt[i]>#64) and (inputt[i]<#91)then start2:=true;
    if start2 = true then
    begin
      
    if check = false then begin
      ch:=pred(inputt[i]);
      temp2:=ch;
      check:=true;
    end;
    
    if check = true then begin
      ch:=pred(temp2);
      temp2:=ch;
    end;
      
      temp:=temp-1;
      if (ch <#65)  then 
      begin
      encount:=26;
      while encount<>0 do
        begin
          ch:=succ(ch);
          encount:=encount-1;
        end;
      end;
    end;
    start2:=false;
    if inputt[i]=' ' then 
    begin
      ch:=' ';
      temp:=temp-1;
    end;
    end;
    outputt:=outputt+ch;
    check:=false;
    end;
    
    rewrite(output);
    write(output, outputt);
    close(output);
    
    Halt;
    
    end;
    
  end;
  
end.