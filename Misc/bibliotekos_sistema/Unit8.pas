unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, unit2, unit1;

type
  TForm8 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    Label11: TLabel;
    Button3: TButton;
    Label12: TLabel;
    Label13: TLabel;
    Button4: TButton;
    Button5: TButton;
    Edit6: TEdit;
    UpDown1: TUpDown;
    Label14: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit7: TEdit;
    Label15: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  kalba: string;
  sritis: string;
  autorius: integer;
  vardas, pavarde: string;

implementation

uses Unit9, Unit10, Unit11;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
  begin
    datamodule2.Query25.Close;
    datamodule2.Query25.open;
    form9.showmodal;
    form8.label8.Caption := unit8.kalba;
  end;

procedure TForm8.Button2Click(Sender: TObject);
  begin
    datamodule2.Query26.Close;
    datamodule2.Query26.open;
    form10.showmodal;
    form8.label10.Caption := unit8.sritis;
  end;

procedure TForm8.Button3Click(Sender: TObject);
  begin
    datamodule2.Query27.Close;
    datamodule2.Query27.open;
    form11.showmodal;
    form8.Label12.Caption := vardas + ' ' + pavarde;
    form8.Label13.Caption := inttostr(autorius);
  end;

procedure TForm8.ComboBox1Change(Sender: TObject);
  begin
    if form8.ComboBox1.ItemIndex = 0 then begin
      form8.Label3.Caption := 'Metai';
      form8.DateTimePicker1.Visible := false;
      form8.Edit3.Visible := true;
      form8.Label4.Visible := true;
      form8.edit4.Visible := true;
      form8.Label15.Visible := true;
      form8.edit7.Visible := true;
    end else begin
      form8.Label3.Caption := 'Data';
      form8.DateTimePicker1.Visible := true;
      form8.Edit3.Visible := false;
      form8.Label4.Visible := false;
      form8.edit4.Visible := false;
      form8.Label15.Visible := false;
      form8.edit7.Visible := false;
    end;
  end;

procedure TForm8.Button4Click(Sender: TObject);
  var st, x: longint;
  begin
    if form8.ComboBox1.ItemIndex = 0 then begin
      datamodule2.query30.close;
      datamodule2.query30.Params[0].AsString := form8.Edit1.Text;
      datamodule2.query30.Params[1].AsString := form8.Edit2.Text;
      datamodule2.query30.Params[2].AsString := form8.Edit7.Text;
      datamodule2.query30.Params[3].AsString := form8.Edit3.Text;
      datamodule2.query30.Params[4].AsString := form8.Edit4.Text;
      datamodule2.query30.Params[5].AsString := form8.Edit5.Text;
      datamodule2.query30.Params[6].AsString := kalba;
      datamodule2.query30.Params[7].AsString := sritis;
      datamodule2.query30.Params[8].AsInteger := autorius;
      datamodule2.query30.ExecSQL;
    end else begin
      datamodule2.query31.close;
      datamodule2.query31.Params[0].AsString := form8.Edit1.Text;
      datamodule2.query31.Params[1].AsString := form8.Edit2.Text;
      datamodule2.query31.Params[2].AsString := datetostr(form8.DateTimePicker1.date);
      datamodule2.query31.Params[3].AsString := form8.Edit5.Text;
      datamodule2.query31.Params[4].AsString := kalba;
      datamodule2.query31.Params[5].AsString := sritis;
      datamodule2.query31.Params[6].AsInteger := autorius;
      datamodule2.query31.ExecSQL;
    end;
    datamodule2.query32.Close;
    datamodule2.query32.open;
    st := form1.DBEdit3.Field.AsInteger;
    datamodule2.Query33.Close;
    for x := 1 to form8.UpDown1.Position do
      begin
        datamodule2.Query33.close;
        datamodule2.Query33.params[0].AsInteger := st + x;
        datamodule2.Query33.params[1].AsString := form8.Edit1.Text;
        datamodule2.Query33.ExecSQL;
      end;
    datamodule2.Query1.Close;
    datamodule2.Query1.open;
    form8.Close;
  end;

procedure TForm8.Button5Click(Sender: TObject);
  begin
    form8.Close;
  end;

end.
