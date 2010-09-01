unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unit2, unit8, Grids, DBGrids, StdCtrls, Mask, DBCtrls;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
  begin
    if form11.RadioButton2.Checked then begin
      datamodule2.Query28.Close;
      datamodule2.Query28.Params[0].AsString := form11.Edit1.Text;
      datamodule2.Query28.Params[1].AsString := form11.Edit2.Text;
      datamodule2.Query28.ExecSQL;
      datamodule2.Query29.Close;
      datamodule2.Query29.Params[0].AsString := form11.Edit1.Text;
      datamodule2.Query29.Params[1].AsString := form11.Edit2.Text;
      datamodule2.Query29.open;
      unit8.vardas := form11.Edit1.Text;
      unit8.pavarde := form11.Edit2.Text;
      unit8.autorius := form11.DBEdit1.Field.AsInteger;
    end else begin
      unit8.vardas := form11.dbgrid1.fields[1].asstring;
      unit8.pavarde := form11.dbgrid1.fields[2].asstring;
      unit8.autorius := form11.dbgrid1.fields[0].asinteger;
    end;
    form11.Close;
  end;

procedure TForm11.RadioButton1Click(Sender: TObject);
  begin
    form11.RadioButton2.Checked := not(form11.RadioButton1.Checked);
    form11.DBGrid1.Visible := form11.RadioButton1.Checked;
    form11.Label1.Visible := form11.RadioButton2.Checked;
    form11.Label2.Visible := form11.RadioButton2.Checked;
    form11.Edit1.Visible := form11.RadioButton2.Checked;
    form11.Edit2.Visible := form11.RadioButton2.Checked;
  end;

procedure TForm11.RadioButton2Click(Sender: TObject);
  begin
    form11.RadioButton1.Checked := not(form11.RadioButton2.Checked);
    form11.DBGrid1.Visible := form11.RadioButton1.Checked;
    form11.Label1.Visible := form11.RadioButton2.Checked;
    form11.Label2.Visible := form11.RadioButton2.Checked;
    form11.Edit1.Visible := form11.RadioButton2.Checked;
    form11.Edit2.Visible := form11.RadioButton2.Checked;
  end;

end.