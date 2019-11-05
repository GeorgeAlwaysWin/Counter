object Form1: TForm1
  Left = 1121
  Top = 363
  Width = 136
  Height = 56
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
  object TcpServer1: TTcpServer
    Active = True
    LocalHost = '127.0.0.1'
    LocalPort = '8888'
    OnAccept = TcpServer1Accept
    Left = 32
  end
end
