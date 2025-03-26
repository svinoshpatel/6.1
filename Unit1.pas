unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

type
  TFruit = class // Базовий клас TFruit (фрукт)
  public
    name: String;
  published
    constructor Create(name: String);
  end;

  TApple = class(TFruit); // Нащадок TApple (яблуко)
  TPear = class(TFruit);  // Нащадок TPear (груша)

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

constructor TFruit.Create(name: String);
begin
  Self.name := name;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  fruit: TFruit; // Об’єкт базового класу TFruit
  apple: TApple; // Об’єкт класу TApple
  pear: TPear;   // Об’єкт класу TPear
begin
  // Створюємо два об’єкти-нащадки
  apple := TApple.Create('Антонівка'); // Яблуко
  pear := TPear.Create('Бера');        // Груша

  // Перевіряємо, чи об’єкти належать до TFruit
  if apple is TFruit then
    ShowMessage(apple.name + ' - фрукт');
  if pear is TFruit then
    ShowMessage(pear.name + ' - фрукт');

  // Присвоюємо об’єкт apple змінній fruit
  fruit := apple;

  // Перевіряємо, чи fruit є яблуком
  if fruit is TApple then
    ShowMessage(apple.name + ' - яблуко');

  // Перевіряємо, чи fruit є грушею
  if fruit is TPear then
    ShowMessage(apple.name + ' - груша')
  else
    ShowMessage(apple.name + ' - це не груша!');

  // Звільняємо пам’ять
  apple.Free;
  pear.Free;
end;

end.
