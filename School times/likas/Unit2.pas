unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure namas(x, y, z, taskai: integer);
begin
if taskai >= 1 then
begin
form2.Canvas.moveto(x + 95*z, y + 200*z);
form2.Canvas.lineto(x + 305*z, y + 200*z);
end;
if taskai >= 2 then
begin
form2.canvas.MoveTo(x + 305*z, y + 200*z);
form2.Canvas.LineTo(x + 305*z, y + 220*z);
end;
if taskai >= 3 then
begin
form2.canvas.MoveTo(x + 305*z, y + 220*z);
form2.Canvas.lineto(x + 95*z, y + 220*z);
end;
if taskai >= 4 then
begin
form2.canvas.MoveTo(x + 95*z, y + 220*z);
form2.canvas.lineto(x + 95*z, y + 200*z);
end;
if taskai >= 5 then
begin
form2.canvas.MoveTo(x + 100*z, y + 100*z);
form2.Canvas.LineTo(x + 300*z, y + 100*z);
end;
if taskai >= 6 then
begin
form2.canvas.MoveTo(x + 300*z,y + 100*z);
form2.Canvas.lineto(x + 300*z,y + 200*z);
end;
if taskai >= 7 then
begin
form2.canvas.MoveTo(x + 300*z,y + 200*z);
form2.Canvas.LineTo(x + 100*z,y + 200*z);
end;
if taskai >= 8 then
begin
form2.canvas.MoveTo(x + 100*z,y + 200*z);
form2.Canvas.LineTo(x + 100*z,y + 100*z);
end;
if taskai >= 9 then
begin
form2.Canvas.moveto(x + 80*z,y + 100*z);
form2.Canvas.LineTo(x + 320*z,y + 100*z);
end;
if taskai >= 10 then
begin
form2.canvas.MoveTo(x + 320*z,y + 100*z);
form2.Canvas.LineTo(x + 260*z,y + 50*z);
end;
if taskai >= 11 then
begin
form2.canvas.MoveTo(x + 260*z,y + 50*z);
form2.Canvas.LineTo(x + 140*z,y + 50*z);
end;
if taskai >= 12 then
begin
form2.canvas.MoveTo(x + 140*z,y + 50*z);
form2.Canvas.LineTo(x + 80*z,y + 100*z);
end;
if taskai >= 13 then
begin
form2.Canvas.moveto(x + 230*z,y + 200*z);
form2.Canvas.lineTo(x + 230*z,y + 125*z);
end;
if taskai >= 14 then
begin
form2.canvas.MoveTo(x + 230*z,y + 125*z);
form2.canvas.lineto(x + 170*z,y + 125*z);
end;
if taskai >= 15 then
begin
form2.canvas.MoveTo(x + 170*z,y + 125*z);
form2.Canvas.LineTo(x + 170*z,y + 200*z);
end;
if taskai >= 16 then
begin
form2.canvas.moveto(x + 230*z,y + 162*z);
form2.Canvas.LineTo(x + 210*z,y + 162*z);
end;
if taskai >= 17 then
begin
form2.canvas.moveto(x + 110*z,y + 125*z);
form2.Canvas.lineto(x + 160*z,y + 125*z);
end;
if taskai >= 18 then
begin
form2.canvas.MoveTo(x + 160*z,y + 125*z);
form2.Canvas.LineTo(x + 160*z,y + 175*z);
end;
if taskai >= 19 then
begin
form2.canvas.MoveTo(x + 160*z,y + 175*z);
form2.Canvas.LineTo(x + 110*z,y + 175*z);
end;
if taskai >= 20 then
begin
form2.canvas.MoveTo(x + 110*z,y + 175*z);
form2.Canvas.LineTo(x + 110*z,y + 125*z);
end;
if taskai >= 21 then
begin
form2.canvas.moveto(x + 240*z,y + 125*z);
form2.Canvas.lineto(x + 290*z,y + 125*z);
end;
if taskai >= 22 then
begin
form2.canvas.MoveTo(x + 290*z,y + 125*z);
form2.Canvas.LineTo(x + 290*z,y + 175*z);
end;
if taskai >= 23 then
begin
form2.canvas.MoveTo(x + 290*z,y + 175*z);
form2.Canvas.LineTo(x + 240*z,y + 175*z);
end;
if taskai >= 24 then
begin
form2.canvas.MoveTo(x + 240*z,y + 175*z);
form2.Canvas.LineTo(x + 240*z,y + 125*z);
end;
if taskai >= 25 then
begin
form2.Canvas.moveto(x + 190*z,y + 50*z);
form2.Canvas.LineTo(x + 190*z,y + 25*z);
end;
if taskai >= 26 then
begin
form2.canvas.MoveTo(x + 190*z,y + 25*z);
form2.canvas.lineto(x + 210*z,y + 25*z);
end;
if taskai >= 27 then
begin
form2.canvas.MoveTo(x + 210*z,y + 25*z);
form2.Canvas.LineTo(x + 210*z,y + 50*z);
end;
if taskai >= 28 then
begin
form2.canvas.MoveTo(x + 200*z,y + 25*z);
form2.Canvas.LineTo(x + 210*z,y + 15*z);
end;
if taskai >= 29 then
begin
form2.canvas.moveto(x + 180*z,y + 200*z);
form2.Canvas.LineTo(x + 180*z,y + 220*z);
end;
if taskai >= 30 then
begin
form2.Canvas.moveto(x + 220*z,y + 200*z);
form2.Canvas.LineTo(x + 220*z,y + 220*z);
end;
if taskai >= 31 then
begin
form2.canvas.moveto(x + 180*z,y + 207*z);
form2.Canvas.LineTo(x + 220*z,y + 207*z);
end;
if taskai >= 32 then
begin
form2.Canvas.MoveTo(x + 180*z,y + 214*z);
form2.Canvas.LineTo(x + 220*z,y + 214*z);
end;
end;
procedure TForm2.Timer1Timer(Sender: TObject);
begin
{form2.Timer1.Enabled:=false;
form2.timer2.enabled:=false;
form2.Hide;}
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
form1.sendkey(key);
end;

procedure TForm2.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
form1.sendkey(0);
end;

procedure TForm2.Timer2Timer(Sender: TObject);
var key: word;
    t: trect;
    s: string;
begin
key := form1.showkey;
if (key=58)
then begin form1.sendkey(0);
form1.usetaskai(0); end;
form2.Timer1.Enabled:=true;
if (key=49)
then begin form1.sendkey(0); form1.usetaskai(1);
form2.Timer1.Enabled:=true;end;
if (key=50)
then begin form1.sendkey(0); form1.usetaskai(2);
form2.Timer1.Enabled:=true;end;
if (key=51)
then begin form1.sendkey(0); form1.usetaskai(3);
form2.Timer1.Enabled:=true;end;
if (key=52)
then begin form1.sendkey(0); form1.usetaskai(4);
form2.Timer1.Enabled:=true;end;
t.Left:=0;
t.Top:=0;
t.Right:=form1.Width;
t.Bottom:=form1.Height;
form2.Canvas.FillRect(t);
namas(-100, -20 , 3, form1.taskas[form1.komanda]);
str(form1.taskas[form1.komanda], s);
form2.Canvas.Font.Size := 32;
form2.Canvas.Font.Name:='Times New Roman';
form2.Canvas.TextOut(100,700, 'Komandos vardas: '+
form1.vardai[form1.komanda]);
form2.Canvas.TextOut(100,650,'Turimi taskai:' + s);
if key = 27 then begin
form2.Timer1.Enabled:=false;
form2.timer2.enabled:=false;
form2.Hide;
form1.sendkey(0);
form1.reikia:=true;
form1.komanda := 0;
end;
end;

procedure TForm2.Button1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
form1.sendkey(key);
end;

procedure TForm2.Button1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
form1.sendkey(0);
end;

end.
