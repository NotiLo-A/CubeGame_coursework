object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  TextHeight = 15
  object Panel1: TPanel
    Left = 291
    Top = 192
    Width = 23
    Height = 22
    Caption = 'Panel1'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 240
    Top = 157
    Width = 14
    Height = 97
    Caption = 'Panel2'
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 341
    Top = 154
    Width = 14
    Height = 97
    Caption = 'Panel2'
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 242
    Top = 241
    Width = 113
    Height = 15
    Caption = 'Panel2'
    TabOrder = 3
  end
  object Panel5: TPanel
    Left = 242
    Top = 146
    Width = 113
    Height = 15
    Caption = 'Panel2'
    TabOrder = 4
  end
  object Panel6: TPanel
    Left = 132
    Top = 61
    Width = 185
    Height = 41
    Caption = 'Panel6'
    TabOrder = 5
  end
  object Panel7: TPanel
    Left = 416
    Top = 76
    Width = 185
    Height = 41
    Caption = 'Panel7'
    TabOrder = 6
  end
  object Panel8: TPanel
    Left = 84
    Top = 160
    Width = 185
    Height = 41
    Caption = 'Panel8'
    TabOrder = 7
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 551
    Top = 278
  end
end
