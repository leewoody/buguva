object Form6: TForm6
  Left = 204
  Top = 218
  BorderStyle = bsNone
  Caption = 'Form6'
  ClientHeight = 453
  ClientWidth = 688
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alCustom
    Stretch = True
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 56
    Top = 32
  end
end