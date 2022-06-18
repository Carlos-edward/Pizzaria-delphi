unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TCadastro = class(TForm)
    background: TPanel;
    nomeTLabel: TLabel;
    nomeTEdit: TEdit;
    telefoneTEdit: TEdit;
    telefoneTLabel: TLabel;
    enderecoTLabel: TLabel;
    enderecoTEdit: TEdit;
    confirmarButton: TButton;
    calabresaTCheckBox: TCheckBox;
    mussarelaTCheckBox: TCheckBox;
    portuguesaTCheckBox: TCheckBox;
    frangoCatupiryTCheckbox: TCheckBox;
    saboresTLabel: TLabel;
    tamanhoTLabel: TLabel;
    brotoTCheckBox: TCheckBox;
    normalTamanhoTCheckBox: TCheckBox;
    recheadaTCheckBox: TCheckBox;
    normalBordaTCheckBox: TCheckBox;
    bordaTLabel: TLabel;
    Image1: TImage;
    Label1: TLabel;
    procedure confirmarButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
     var nomeDoCliente,endereco:String;
     var telefoneDoCliente:String;
     var calabresa, mussarela, portuguesa,frangoCatupiry,normalTamanho,broto,normalBorda,recheada:boolean;
  end;

var
  Cadastro: TCadastro;
  i:integer;

implementation

{$R *.dfm}

uses consulta;

procedure TCadastro.confirmarButtonClick(Sender: TObject);
begin
   nomeDoCliente := nomeTEdit.Text;
   telefoneDoCliente := telefoneTEdit.Text;
   endereco := enderecoTEdit.Text;

   if calabresaTCheckBox.Checked then calabresa := True else calabresa := False;
   if mussarelaTCheckBox.Checked then mussarela := True else mussarela := False;
   if portuguesaTCheckBox.Checked then portuguesa := True else portuguesa := False;
   if frangoCatupiryTCheckbox.Checked then frangoCatupiry := True else frangoCatupiry := False;
   if normalBordaTCheckBox.Checked then normalBorda := True else normalBorda := False;
   if recheadaTCheckBox.Checked then recheada := True else recheada := False;
   if normalTamanhoTCheckBox.Checked then normalTamanho := True else normalTamanho := False;

   //limpar todos TEdit
   For i := 0 To ComponentCount -1 Do
    If Components[i] Is TEdit Then
     Begin
       TEdit(Components[i]).Text := '';
     End;

   form1:=TForm1.Create(self);
   Form1.show;

end;

end.
