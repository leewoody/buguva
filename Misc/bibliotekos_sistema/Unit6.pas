unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unit2, StdCtrls, DBCtrls;

type
  TForm6 = class(TForm)
    DBText1: TDBText;
    Button1: TButton;
    Label1: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText13: TDBText;
    Label12: TLabel;
    DBText14: TDBText;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
  begin
    form6.Close;
  end;

end.