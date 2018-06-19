program balanca;

uses
  Vcl.Forms,
  erp_balanca in 'erp_balanca.pas' {frmPrincipal},
  frmCadCliente in 'cadastros\dfm\frmCadCliente.pas' {Form1},
  datmCadCliente in 'cadastros\dataModule\datmCadCliente.pas' {dtmCadCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdtmCadCliente, dtmCadCliente);
  Application.Run;
end.
