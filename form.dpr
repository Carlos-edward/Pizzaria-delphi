program form;

uses
  Vcl.Forms,
  formulario in 'formulario.pas' {Cadastro},
  consulta in 'consulta.pas' {Form1},
  calc in 'calc.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCadastro, Cadastro);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
