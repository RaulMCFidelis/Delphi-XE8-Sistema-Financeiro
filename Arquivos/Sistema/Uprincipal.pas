unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  Tfrmprincipal = class(TForm)
    Label1: TLabel;
    imgusuarios: TImage;
    imgreceber: TImage;
    imgpagar: TImage;
    imgcaixa: TImage;
    imgconreceber: TImage;
    imgconpagar: TImage;
    Label3: TLabel;
    Label4: TLabel;
    imgrelpagar: TImage;
    imgnavegador: TImage;
    imgconfig: TImage;
    imgrelreceber: TImage;
    imgrelcaixa: TImage;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.dfm}

procedure Tfrmprincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Desja Realmente Sair?', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYES then

Application.Terminate

else
Abort;

end;

procedure Tfrmprincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
