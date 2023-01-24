object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exemplos Thread'
  ClientHeight = 79
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblNumero: TLabel
    Left = 208
    Top = 21
    Width = 21
    Height = 50
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPlay: TButton
    Left = 112
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Play'
    TabOrder = 0
    OnClick = btnPlayClick
  end
end
