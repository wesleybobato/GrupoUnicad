program Teste_delphi;

uses
  Vcl.Forms,
  WebserviceUnicad in 'WebserviceUnicad.pas',
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal} ,
  UCadastro in 'UCadastro.pas' {FrmCadastro};

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm( TFrmPrincipal, FrmPrincipal );
  Application.Run;

end.
