unit calc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, StrUtils;

type
  Tcalculadora1 = class(TForm)
    FlowButtons: TFlowPanel;
    sevenButton: TLabel;
    eightButton: TLabel;
    nineButton: TLabel;
    plusButton: TLabel;
    fourButton: TLabel;
    fiveButton: TLabel;
    sixButton: TLabel;
    multiplicationButton: TLabel;
    oneButton: TLabel;
    twoButton: TLabel;
    threeButton: TLabel;
    minusButton: TLabel;
    clearButton: TLabel;
    zeroButton: TLabel;
    commaButton: TLabel;
    equalButton: TLabel;
    background: TPanel;
    screenText: TLabel;
    divisionButton: TLabel;
    procedure multiplicationButtonMouseEnter(Sender: TObject);
    procedure multiplicationButtonMouseLeave(Sender: TObject);
    procedure sevenButtonMouseLeave(Sender: TObject);
    procedure equalButtonMouseEnter(Sender: TObject);
    procedure equalButtonMouseLeave(Sender: TObject);
    procedure zeroButtonClick(Sender: TObject);
    procedure clearButtonClick(Sender: TObject);
    procedure plusButtonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  calculadora1: Tcalculadora1;
  valueFirst: Double ;
  valueSecond: Double;
  operadores: String;

implementation

{$R *.dfm}

procedure Tcalculadora1.zeroButtonClick(Sender: TObject);
begin
    case AnsiIndexStr((Sender as TLabel).GetNamePath,['zeroButton','oneButton','twoButton','threeButton','fourButton','fiveButton','sixButton','sevenButton','eightButton','nineButton','commaButton']) of
         // Numeros
         0:screenText.Caption := screenText.Caption + IntToStr(0);
         1:screenText.Caption := screenText.Caption + IntToStr(1);
         2:screenText.Caption := screenText.Caption + IntToStr(2);
         3:screenText.Caption := screenText.Caption + IntToStr(3);
         4:screenText.Caption := screenText.Caption + IntToStr(4);
         5:screenText.Caption := screenText.Caption + IntToStr(5);
         6:screenText.Caption := screenText.Caption + IntToStr(6);
         7:screenText.Caption := screenText.Caption + IntToStr(7);
         8:screenText.Caption := screenText.Caption + IntToStr(8);
         9:screenText.Caption := screenText.Caption + IntToStr(9);
         10:screenText.Caption := screenText.Caption + ',';
    end;
end;


// Operadores e resultado
procedure Tcalculadora1.plusButtonClick(Sender: TObject);
begin
   if ((Sender as Tlabel).GetNamePath).Equals('plusButton')  then operadores := '+';
   if ((Sender as Tlabel).GetNamePath).Equals('multiplicationButton')  then operadores := '*';
   if ((Sender as Tlabel).GetNamePath).Equals('minusButton')  then operadores := '-';
   if ((Sender as Tlabel).GetNamePath).Equals('divisionButton')  then operadores := '/';

   if (valueSecond = 0) and (valueFirst = 0) and (screenText.Caption = '') then
    begin
      ShowMessage('Escreve um número primeiro')
    end
   else if valueFirst = 0  then
    begin
      valueFirst := StrToFloat(screenText.Caption);
      screenText.Caption := '';
    end
   else
    begin
         valueSecond := StrToFloat(screenText.Caption);
         screenText.Caption := '';
    end;

   //resultado
   if ((Sender as Tlabel).GetNamePath).Equals('equalButton') then
    begin
      if operadores.Equals('+')  then screenText.Caption := FloatToStr(valueFirst+valueSecond);
      if operadores.Equals('-')  then screenText.Caption := FloatToStr(valueFirst-valueSecond);
      if operadores.Equals('*')  then screenText.Caption := FloatToStr(valueFirst*valueSecond);
      if operadores.Equals('/')  then screenText.Caption := FloatToStr(valueFirst/valueSecond);
    end;
end;

// Troca a cor do botão, quando o mouse passa pro cima
procedure Tcalculadora1.equalButtonMouseEnter(Sender: TObject);
begin
   equalButton.Color := clGrayText;
end;

procedure Tcalculadora1.multiplicationButtonMouseEnter(Sender: TObject);
begin
   (Sender as TLabel).Color := clScrollBar;
end;

// Volta a cor do botão original, quando o mouse sair - Operadores
procedure Tcalculadora1.multiplicationButtonMouseLeave(Sender: TObject);
begin
   (Sender as TLabel).Color := cl3DLight;
end;


// Volta a cor do botão original, quando o mouse sair - Numeros
procedure Tcalculadora1.sevenButtonMouseLeave(Sender: TObject);
begin
   (Sender as TLabel).Color := clWhite;
end;

// Volta a cor do botão original, quando o mouse sair - Igual
procedure Tcalculadora1.equalButtonMouseLeave(Sender: TObject);
begin
   equalButton.Color := clScrollBar;
end;


// Limpar a caixa de texto
procedure Tcalculadora1.clearButtonClick(Sender: TObject);
begin
   screenText.Caption := '';
   valueFirst  := 0;
   valueSecond := 0;
end;

end.


