unit WebserviceUnicad;

interface

uses
  // System
  System.Types,

  // Soap
  Soap.XSBuiltIns,
  Soap.InvokeRegistry,
  Soap.SOAPHTTPClient;

type
  IDelphi = interface( IInvokable )
    [ '{5955D235-855C-70AA-4306-CA92399ED6A5}' ]
    function Verifica_Idades( const Idade_Media: string ): string; stdcall;
  end;

function GetIDelphi( UseWSDL: Boolean = System.False; Addr: string = ''; HTTPRIO: THTTPRIO = nil ): IDelphi;

implementation

uses
  // System
  System.SysUtils;

function GetIDelphi( UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO ): IDelphi;
const
  DefWSDL = 'http://www.grupounicad.com.br/cgi-bin/portalumais/Delphi_sql_Server/Delphi_API_Teste.dll/wsdl/IDelphi';
  DefURL  = 'http://www.grupounicad.com.br/cgi-bin/portalumais/Delphi_sql_Server/Delphi_API_Teste.dll/soap/IDelphi';
  DefSvc  = 'IDelphiservice';
  DefPrt  = 'IDelphiPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if ( Addr = '' ) then
  begin
    if UseWSDL then
      Addr := DefWSDL
    else
      Addr := DefURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create( nil )
  else
    RIO := HTTPRIO;
  try
    Result := ( RIO as IDelphi );
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service      := DefSvc;
      RIO.Port         := DefPrt;
    end
    else
      RIO.URL := Addr;
  finally
    if ( Result = nil ) and ( HTTPRIO = nil ) then
      RIO.Free;
  end;
end;

initialization
  { IDelphi }
  InvRegistry.RegisterInterface( TypeInfo( IDelphi ), 'urn:Delphi_WSIntf-IDelphi', '' );
  InvRegistry.RegisterDefaultSOAPAction( TypeInfo( IDelphi ), 'urn:Delphi_WSIntf-IDelphi#Verifica_Idades' );

end.
