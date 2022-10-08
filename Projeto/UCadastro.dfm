object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 121
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 8
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblIdade: TLabel
    Left = 431
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Idade'
  end
  object edtNome: TEdit
    Left = 8
    Top = 32
    Width = 417
    Height = 21
    MaxLength = 100
    TabOrder = 0
  end
  object pnlAcoes: TPanel
    Left = 0
    Top = 71
    Width = 559
    Height = 50
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -248
    ExplicitTop = 262
    ExplicitWidth = 750
    object btnSalvar: TButton
      Left = 136
      Top = 12
      Width = 118
      Height = 25
      Caption = 'Salvar Pessoa'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 272
      Top = 12
      Width = 118
      Height = 25
      Caption = 'Cancelar Pessoa'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object sptIdade: TSpinEdit
    Left = 431
    Top = 32
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
end
