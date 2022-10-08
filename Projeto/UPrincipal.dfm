object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Teste Delphi by wesleybobato@gmail.com'
  ClientHeight = 385
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnLista: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 385
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 126
      Height = 14
      Caption = 'Listagem de Pessoas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 232
      Width = 69
      Height = 14
      Caption = 'Estat'#237'sticas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQuantidade: TLabel
      Left = 24
      Top = 256
      Width = 60
      Height = 13
      Caption = 'Quantidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSomaDasIdades: TLabel
      Left = 24
      Top = 278
      Width = 86
      Height = 13
      Caption = 'Soma das Idades:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIdadeMedia: TLabel
      Left = 24
      Top = 301
      Width = 63
      Height = 13
      Caption = 'Idade M'#233'dia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblQuant: TLabel
      Left = 115
      Top = 256
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblSoma: TLabel
      Left = 115
      Top = 278
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblMedia: TLabel
      Left = 115
      Top = 301
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 331
      Width = 45
      Height = 14
      Caption = 'Parecer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblParecer: TLabel
      Left = 24
      Top = 353
      Width = 218
      Height = 13
      Caption = 'Label para receber informa'#231#227'o do webservice'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ListaPessoa: TDBGrid
      Left = 24
      Top = 36
      Width = 454
      Height = 137
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'ID'
          Title.Color = clDefault
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'name'
          ReadOnly = True
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 270
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'age'
          ReadOnly = True
          Title.Caption = 'Idade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 75
          Visible = True
        end>
    end
    object btnIncluir: TButton
      Left = 24
      Top = 189
      Width = 118
      Height = 25
      Caption = 'Incluir Pessoa'
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 194
      Top = 189
      Width = 118
      Height = 25
      Caption = 'Alterar Pessoa'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 360
      Top = 189
      Width = 118
      Height = 25
      Caption = 'Excluir Pessoa'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
  end
  object AdoConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Delphi@123;Persist Security Info=Tr' +
      'ue;User ID=prova_delphi;Initial Catalog=Teste;Data Source=bancob' +
      'i.grupounicad.com.br,1433;Use Procedure for Prepare=1;Auto Trans' +
      'late=True;Packet Size=4096;Workstation ID=LAPTOP-482JUR3K;Use En' +
      'cryption for Data=False;Tag with column collation when possible=' +
      'False'
    ConnectionTimeout = 30
    IsolationLevel = ilChaos
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 408
    Top = 264
  end
  object Qry1: TADOQuery
    Connection = AdoConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from teste.dbo.people')
    Left = 320
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = Qry1
    Left = 240
    Top = 264
  end
end
