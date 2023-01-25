unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    lblNumero: TLabel;
    btnPlay: TButton;
    procedure btnPlayClick(Sender: TObject);
  private
    { Private declarations }
    procedure exemplo;
    procedure tratamentoErrosThread(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnPlayClick(Sender: TObject);
begin
  exemplo;
end;

procedure TfrmPrincipal.exemplo;
var
  t: TThread;
begin
  {Conforme a complexidade do projeto vai aumentando, se n�o colocar toda atualiza��o visual na Thread principal
  ocorre problemas com a atualiza��o da aplica��o}
  t := TThread.CreateAnonymousThread(procedure
  var
    x: Integer;
    begin
      for x := 1 to 1000 do
      begin
        sleep(100);
        //StrToFloat('99 Coders'); //For�a o erro (n�o usar try, showmessage e abrir forms dentro de threads)

        //Thread principal, colocar apenas atualiza��es visuais, possui duas formas de se fazer:
        //1 = Usando Synchronize, fala para Thread executar o seu comando, ou seja, enquanto n�o acabar o primeiro comando n�o ira iniciar o proximo comando
        TThread.Synchronize(nil, procedure
        begin
          lblNumero.Caption := x.ToString;
        end);

        //2 = Usando Queue (fila), fala para Thread colocar o comando em uma fila e executar assim que conseguir, com isso n�o precisa esperar o comando acabar para iniciar o proximo
//        TThread.Queue(nil, procedure
//        begin
//          lblNumero.Caption := x.ToString;
//        end);
      end;
    end);

    t.FreeOnTerminate := True;
    t.OnTerminate := tratamentoErrosThread;
    t.Start;
end;

procedure TfrmPrincipal.tratamentoErrosThread(Sender: TObject);
begin
  //VERIFICAR VAZAMENTO DE MEMORIA
  {Em Projects, bot�o direito no projeto, View Source
   Adicionar:
   ReportMemoryLeaksOnShutdown := True;

   Ao fechar o sistema ira aparecer todos os vazamentos de memoria}
  if Assigned(TThread(Sender).FatalException) then //Resolve o problema de saber o proque a thread n�o esta sendo executada
    ShowMessage(Exception(TThread(Sender).FatalException).Message);
end;

end.
