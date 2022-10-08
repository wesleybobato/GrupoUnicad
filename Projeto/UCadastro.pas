unit UCadastro;

interface

uses
  // Winapi
  Winapi.Windows,
  Winapi.Messages,

  // System
  System.Classes,
  System.SysUtils,
  System.Variants,

  // Vcl
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TFrmCadastro = class( TForm )
    EdtNome: TEdit;
    PnlAcoes: TPanel;
    SptIdade: TSpinEdit;
    LblNome: TLabel;
    LblIdade: TLabel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure BtnSalvarClick( Sender: TObject );
    procedure BtnCancelarClick( Sender: TObject );
  private
    { Private declarations }

    function Validar: Boolean;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TFrmCadastro.BtnSalvarClick( Sender: TObject );
begin
  if Validar then
  begin
    ModalResult := MrOK;
  end;
end;

procedure TFrmCadastro.BtnCancelarClick( Sender: TObject );
begin
  ModalResult := MrCancel;
end;

function TFrmCadastro.Validar: Boolean;
begin
  if Trim( EdtNome.Text ) = '' then
    raise Exception.Create( 'Preencha o campo nome corretamente.' );

  if ( Trim( SptIdade.Text ) = '' ) or ( SptIdade.Value < 0 ) then
    raise Exception.Create( 'Preencha o campo idade corretamente.' );

  Result := True;
end;

end.
