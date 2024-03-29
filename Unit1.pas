unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Math, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

//������� ������ ����������� ����, ������� ������ ���� ����
//������� ������ ��������� ���� �� � � �� Y 
ImgStars: array[0..400] of TImage;
BitMapStars: array[0..1] of TBitMap;
StarsX: array [0..400] of integer;
StarsY: array [0..400] of integer;

Xmin,Ymin,Xmax,Ymax,Zmax:integer;
i: integer;

//����
implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
//��������� ��������� ��������� �����
Randomize;
//������������� ������� ���������� �� � � Y
Xmin:=0;
Xmax:=636;
Ymin:=0;
Ymax:=476;
//�������� ������ ������� � ����������� ��� ���� �����
Form1.Image1.Canvas.Brush.Color:=clBlack;
Form1.Image1.Canvas.FillRect(Rect(Xmin,Ymin,Xmax,Ymax));
//����� ������ �����
Form1.Image1.Width:=Xmax;
Form1.Image1.Height:=Ymax;
//������ 2 ���� ����
For i:=0 to 1 Do
   begin
   BitMapStars[i]:=TBitMap.Create;
   BitMapStars[i].LoadFromFile('Star'+IntToStr(i)+'.bmp');
   end;
//������ ���� �� ����������� ����
For i:=0 to 400 Do
   begin
   StarsX[i]:=Random(Xmax);
   StarsY[i]:=Random(Ymax);
   ImgStars[i]:=TImage.Create(Form1);
   ImgStars[i].Left:=StarsX[i];
   ImgStars[i].Top:=StarsY[i];
   If i<200 then ImgStars[i].Picture.Assign(BitMapStars[0])
      else
      ImgStars[i].Picture.Assign(BitMapStars[1]);
   ImgStars[i].Visible:=True;
   ImgStars[i].AutoSize:=True;
   ImgStars[i].Parent:=Form1;
   end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
i,j,x,y: integer;
begin
//������������ ����� ��������� �������
i:=Random(400);
x:=Random(Xmax);
ImgStars[i].Left:=x;
j:=Random(400);
y:=Random(Ymax);
ImgStars[i].Top:=y;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//��������� ������� ����� ����
For i:=0 to 1 Do
   begin
   BitMapStars[i].Free;
   end;
//��������� ������ ����
For i:=0 to 400 Do
   begin
   ImgStars[i].Free;
   end;
end;

end.
