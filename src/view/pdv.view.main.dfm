object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 590
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 65
    Align = alTop
    TabOrder = 0
  end
  object FlowPanel1: TFlowPanel
    Left = 0
    Top = 65
    Width = 847
    Height = 458
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 712
      Height = 368
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 523
    Width = 847
    Height = 67
    Align = alBottom
    TabOrder = 2
    object edtCodBarras: TEdit
      Left = 1
      Top = 1
      Width = 845
      Height = 21
      Align = alTop
      NumbersOnly = True
      TabOrder = 0
      Text = 'edtCodBarras'
    end
  end
  object Button1: TButton
    Left = 616
    Top = 557
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
  object DataSource1: TDataSource
    Left = 480
    Top = 241
  end
end
