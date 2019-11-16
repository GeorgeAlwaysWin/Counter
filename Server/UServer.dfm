object Form1: TForm1
  Left = 1009
  Top = 363
  Width = 229
  Height = 175
  Caption = 'server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Host: TLabeledEdit
    Left = 24
    Top = 24
    Width = 161
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Local Host'
    TabOrder = 0
    Text = '127.0.0.1'
  end
  object Port: TLabeledEdit
    Left = 24
    Top = 72
    Width = 161
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Local Port'
    TabOrder = 1
    Text = '8888'
  end
  object Button1: TButton
    Left = 128
    Top = 104
    Width = 57
    Height = 25
    Caption = 'Change'
    TabOrder = 2
    OnClick = Button1Click
  end
  object TcpServer1: TTcpServer
    Active = True
    LocalHost = '127.0.0.1'
    LocalPort = '8888'
    OnAccept = TcpServer1Accept
    Left = 32
  end
end
