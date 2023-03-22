unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Datasnap.DBClient;

type
  TfrmCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ActionToolBar1: TActionToolBar;
    PageControl1: TPageControl;
    tbscadastro: TTabSheet;
    tbsPesquisa: TTabSheet;
    DBGrid1: TDBGrid;
    ImageListcadastro: TImageList;
    Label1: TLabel;
    ActionManagercadastro: TActionManager;
    actinserir: TAction;
    acteditar: TAction;
    actexcluir: TAction;
    actsalvar: TAction;
    actcancelar: TAction;
    actpesquisar: TAction;
    actimprimir: TAction;
    actfechar: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actinserirExecute(Sender: TObject);
    procedure acteditarExecute(Sender: TObject);
    procedure actexcluirExecute(Sender: TObject);
    procedure actsalvarExecute(Sender: TObject);
    procedure actcancelarExecute(Sender: TObject);
    procedure actpesquisarExecute(Sender: TObject);
    procedure actimprimirExecute(Sender: TObject);
    procedure actfecharExecute(Sender: TObject);
    procedure actcancelarUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsPesquisaShow(Sender: TObject);
    procedure actinserirUpdate(Sender: TObject);
    procedure actsalvarUpdate(Sender: TObject);
    procedure actexcluirUpdate(Sender: TObject);
    procedure acteditarUpdate(Sender: TObject);
    procedure actimprimirUpdate(Sender: TObject);
  private
    { Private declarations }
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmCadastroBasico: TfrmCadastroBasico;

implementation

{$R *.dfm}

uses ModConexao;

procedure TfrmCadastroBasico.actcancelarExecute(Sender: TObject);
begin
LimparTudo;
TClientDataSet(dsTabela.DataSet).Cancel;

end;

procedure TfrmCadastroBasico.actcancelarUpdate(Sender: TObject);
begin
  actcancelar.Enabled := actsalvar.Enabled = true;
end;

procedure TfrmCadastroBasico.acteditarExecute(Sender: TObject);
begin
if PageControl1.ActivePage = tbsPesquisa then
  PageControl1.ActivePage := tbsCadastro;
  TClientDataSet(dsTabela.DataSet).Edit;

end;

procedure TfrmCadastroBasico.acteditarUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

acteditar.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actexcluirExecute(Sender: TObject);
begin
if Application.MessageBox('Deseja Realmente Excluir o Registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    try
      TclientDataSet(dsTabela.DataSet).Delete;
      TclientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro Excluido com Sucesso!', 'Informação', 0+64);
      TClientDataSet(dsTabela.DataSet).Open;

      except on E : Exception do

      raise Exception.Create('Error ao Excluir o Registro: '+E.Message);



    end;
  end;

end;

procedure TfrmCadastroBasico.actexcluirUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then
  actexcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actfecharExecute(Sender: TObject);
begin
//
end;

procedure TfrmCadastroBasico.actimprimirExecute(Sender: TObject);
begin
ShowMessage('Em Desenvolvimento');
end;

procedure TfrmCadastroBasico.actimprimirUpdate(Sender: TObject);
begin
if (dsTabela.State in [dsBrowse]) and (not TClientDataSet(dsTabela.DataSet).IsEmpty) then

actimprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TfrmCadastroBasico.actinserirExecute(Sender: TObject);
begin
if PageControl1.ActivePage = tbsPesquisa then
PageControl1.ActivePage := tbsCadastro;
if not TClientDataSet(dsTabela.DataSet).active then

  TClientDataSet(dsTabela.DataSet).Open;
  TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TfrmCadastroBasico.actinserirUpdate(Sender: TObject);
begin
  actinserir.Enabled := dsTabela.State in [dsBrowse,dsInactive];
end;

procedure TfrmCadastroBasico.actpesquisarExecute(Sender: TObject);
begin
    TClientDataSet(dsTabela.DataSet).Close;
      TClientDataSet(dsTabela.DataSet).Open;
end;

procedure TfrmCadastroBasico.actsalvarExecute(Sender: TObject);
begin
try

    TClientDataSet(dsTabela.DataSet).Post;
    TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

    case dsTabela.State of
    dsEdit : Application.MessageBox('Registro Atualizado com Sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
    dsInsert : Application.MessageBox('Registro Inserido com Sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
    end;


      //Limpar os campos
      LimparTudo;
        TClientDataSet(dsTabela.DataSet).Open;


except on E : Exception do
raise Exception.Create('Erro ao Salvar Registro: '+E.Message);

end;

end;


procedure TfrmCadastroBasico.actsalvarUpdate(Sender: TObject);
begin
actsalvar.Enabled := dsTabela.State in [dsinsert,dsedit];
end;

procedure TfrmCadastroBasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TClientDataSet(dsTabela.DataSet).Cancel;
      TClientDataSet(dsTabela.DataSet).Close;
end;

procedure TfrmCadastroBasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #27 then
    close;
if key = #13 then
    Perform (WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadastroBasico.LimparTudo;
var
  i: Integer;

begin
for i  := 0 to ComponentCount -1 do
  begin
    if Components[i] is TCustomEdit then
    TCustomEdit(components[i]).Clear;
  end;
  if PageControl1.ActivePage = tbsCadastro then
      PageControl1.ActivePage := tbsPesquisa;

end;

procedure TfrmCadastroBasico.tbsPesquisaShow(Sender: TObject);
begin
  PageControl1.ActivePage := tbsPesquisa;
end;

end.

