unit UPrincipal;

interface

uses
  // Winapi
  Winapi.Windows,
  Winapi.Messages,

  // System
  System.Classes,
  System.UITypes,
  System.SysUtils,
  System.Variants,
  System.Net.URLClient,

  // Vcl
  Vcl.Grids,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBGrids,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  // Data
  Data.DB,
  Data.Win.ADODB,

  // Soap
  Soap.Rio,
  Soap.InvokeRegistry,
  Soap.SOAPHTTPClient;

type
  TFrmPrincipal = class( TForm )
    PnLista: TPanel;
    AdoConnection1: TADOConnection;
    Qry1: TADOQuery;
    DataSource1: TDataSource;
    ListaPessoa: TDBGrid;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    Label1: TLabel;
    Label2: TLabel;
    LblQuantidade: TLabel;
    LblSomaDasIdades: TLabel;
    LblIdadeMedia: TLabel;
    LblQuant: TLabel;
    LblSoma: TLabel;
    LblMedia: TLabel;
    Label6: TLabel;
    LblParecer: TLabel;
    procedure BtnIncluirClick( Sender: TObject );
    procedure BtnAlterarClick( Sender: TObject );
    procedure BtnExcluirClick( Sender: TObject );
    procedure FormShow( Sender: TObject );
  private
    { Private declarations }

    procedure CalcularEstatisticas;

    procedure TotalPessoas;
    procedure TotalIdadesPessoas;
    procedure TotalMediaIdadesPessoas;

    procedure ConsultaWebService;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  // Unicad
  UCadastro,
  WebserviceUnicad;

{$R *.dfm}


procedure TFrmPrincipal.BtnIncluirClick( Sender: TObject );
var
  Form: TFrmCadastro;
begin
  Form := TFrmCadastro.Create( nil );
  try
    if Form.ShowModal = MrOk then
    begin
      Qry1.Append;
      Qry1.FieldByName( 'name' ).AsString := Form.EdtNome.Text;
      Qry1.FieldByName( 'age' ).AsInteger := Form.SptIdade.Value;
      Qry1.Post;

      CalcularEstatisticas;
    end;
  finally
    Form.Free;
  end;
end;

procedure TFrmPrincipal.CalcularEstatisticas;
begin
  TotalPessoas;
  TotalIdadesPessoas;
  TotalMediaIdadesPessoas;

  ConsultaWebService;
end;

procedure TFrmPrincipal.ConsultaWebService;
var
  Media:   string;
  Service: IDelphi;
begin
  if LblMedia.Caption <> '0' then
  begin
    Media := IntToStr( Trunc( StrToFloat( LblMedia.Caption ) ) );

    Service            := GetIDelphi;
    LblParecer.Caption := Service.Verifica_Idades( Media );
  end;
end;

procedure TFrmPrincipal.FormShow( Sender: TObject );
begin
  if not AdoConnection1.Connected then
    AdoConnection1.Connected := True;

  if not Qry1.Active then
    Qry1.Open;

  CalcularEstatisticas;
end;

procedure TFrmPrincipal.TotalPessoas;
begin
  LblQuant.Caption := Qry1.RecordCount.ToString;
end;

procedure TFrmPrincipal.TotalIdadesPessoas;
var
  Somas: Integer;
  RecNo: Integer;
begin
  Somas := 0;

  Qry1.DisableControls;
  try
    RecNo := Qry1.RecNo;
    try
      Qry1.First;

      while not Qry1.Eof do
      begin
        Somas := Somas + Qry1.FieldByName( 'age' ).AsInteger;
        Qry1.Next;
      end;

      LblSoma.Caption := IntToStr( Somas );

    finally
      Qry1.RecNo := RecNo;
    end;

  finally
    Qry1.EnableControls;
  end;
end;

procedure TFrmPrincipal.TotalMediaIdadesPessoas;
var
  Total: Integer;
  Somas: Integer;
  Media: Double;
  RecNo: Integer;
begin
  Somas := 0;

  Qry1.DisableControls;
  try
    RecNo := Qry1.RecNo;
    try
      Qry1.First;

      while not Qry1.Eof do
      begin
        Somas := Somas + Qry1.FieldByName( 'age' ).AsInteger;
        Qry1.Next;
      end;
      Total := Qry1.RecordCount;

      if ( Total > 0 ) and ( Somas > 0 ) then
      begin
        Media            := Somas / Total;
        LblMedia.Caption := FloatToStr( Media );
      end;

    finally
      Qry1.RecNo := RecNo;
    end;

  finally
    Qry1.EnableControls;
  end;
end;

procedure TFrmPrincipal.BtnAlterarClick( Sender: TObject );
var
  Form: TFrmCadastro;
begin
  if Qry1.IsEmpty or ( Qry1.RecNo < 1 ) then
    raise Exception.Create( 'Seleciona a pessoa corretamente para editar.' );

  Form := TFrmCadastro.Create( nil );
  try
    Form.EdtNome.Text   := Qry1.FieldByName( 'name' ).AsString;
    Form.SptIdade.Value := Qry1.FieldByName( 'age' ).AsInteger;

    if Form.ShowModal = MrOk then
    begin
      Qry1.Edit;
      Qry1.FieldByName( 'name' ).AsString := Form.EdtNome.Text;
      Qry1.FieldByName( 'age' ).AsInteger := Form.SptIdade.Value;
      Qry1.Post;

      CalcularEstatisticas;
    end;
  finally
    Form.Free;
  end;
end;

procedure TFrmPrincipal.BtnExcluirClick( Sender: TObject );
begin
  if Qry1.IsEmpty or ( Qry1.RecNo < 1 ) then
    raise Exception.Create( 'Seleciona a pessoa corretamente para excluir.' );

  if MessageDlg( 'você tem certeza que deseja excluir a pessoa selecionada?', MtConfirmation, [ MbYes, MbNo ], 0 ) = MrYes then
  begin
    Qry1.Delete;
    CalcularEstatisticas;
  end;
end;

end.
