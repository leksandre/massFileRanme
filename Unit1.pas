unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure  searsh_run;
    procedure  searsh(dir: string);
    procedure add_im(name:string);   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  const max=100;
var  ms,exs:array [1..max] of string;
      image:string;   coun,i,glob,sec_k:integer;
      f:TextFile;



implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
i:=1;
if FileExists('ex.txt') then begin
AssignFile(f,'ex.txt');
Reset(f);
while not eof(f) do  begin
ReadLn(f,exs[i]); inc(i);  end;
CloseFile(f); end;
 coun:=1; glob:=1;
 searsh_run;
end;


procedure TForm1.add_im(name:string);
var r,e,d,p:string;  f:TextFile;  j,t:integer;
begin     

  if not FileExists(name)  then exit;

  for j:=1 to i do
  if name = exs[j] then exit;

r:=ExtractFileName(name);
e:=ExtractFileExt(name);
d:=ExtractFileDir(name);
  if   r=image then EXIT;                                          

p:=StringReplace(r,Edit1.Text,Edit2.Text, [rfIgnoreCase]);

RenameFile({d+'\'+r}name,d+'\'+p);
                                                           

   

{Delete(r,length(r)-length(e)+1,length(e));
ms[coun]:=r;
RenameFile(name,d+'\_'+intTOstr(coun)+e);    }

Inc(coun);




//p:=ExtractFilePath(name);
//ShowMessage(r+'       '+#13#10+e+'       '+#13#10+d+'       '+#13#10+r+'       ');
//If (r ='.jpg')or(r = '.jpeg')or(r = '.bmp')or(r = '.ico')or(r='.emf')or(r = '.wmf')
//then  Form1.ListBox1.Items.Add(name); 

end;


procedure TForm1.searsh(dir: string);
var f,f2:TSearchRec;
   //sttime:SYSTEMTIME;
begin
FindFirst(dir+'*',faAnyFile,f);
repeat    if coun>=max  then exit;      if sec_k>coun  then exit;
if (f.attr and  faDirectory)<>0 then begin
//Application.ProcessMessages;
if DirectoryExists(dir+f.Name+'\')and ('.' <> f.Name)  and ('..' <> f.Name) and ('...' <> f.Name) and ('....' <> f.Name)
then searsh(dir+f.Name+'\')  end  else add_im(dir+f.Name);
f2:=f;
FindNext(f);
until    (f.Name=F2.Name) and (F.Size=F2.Size);
FindClose(f);
    // Application.ProcessMessages;

end;         //  CopyFile(Pchar(dir+f.Name),Pchar(locdir+'\'+f.Name),true);



procedure TForm1.searsh_run;
var
 ff:TSearchRec;
  dir_image:string;

begin
image:=ExtractFileName(ParamStr(0));  sec_k:=1;
dir_image:=ExtractFileDir((ExtractFileDir(ParamStr(0)))+'\');
if DirectoryExists (dir_image)  then   
if FindFirst(dir_image+'\*',faAnyFile,ff) = 0 then
repeat            if coun>=max  then exit;      if sec_k>coun  then exit;
if (ff.attr and  faDirectory)<>0 then begin
if DirectoryExists(dir_image+'\'+ff.Name+'\') and ('.' <> ff.Name)  and ('..' <> ff.Name) and ('...' <> ff.Name) and ('....' <> ff.Name)
then searsh(dir_image+'\'+ff.Name+'\') end else add_im(dir_image+'\'+ff.Name);
until FindNext(ff) <> 0;
 FindClose(ff);


 // searsh(dir_image+'\'+ff.Name+'\',temp+ff.Name+'\');
 // procedure searsh(dir: string; locdir:string);
//  ListBox1.Items[170];
 // CopyFile(Pchar(DriveLetter+':\'+ff.Name),Pchar(temp+ff.Name),true);
end;



end.
