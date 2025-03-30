program produto;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {Form1},
  uRepositoryProduto in 'repositorio\uRepositoryProduto.pas',
  uProduto in 'Model\uProduto.pas',
  uServiceProduto in 'Service\uServiceProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
