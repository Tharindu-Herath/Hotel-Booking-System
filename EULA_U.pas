unit EULA_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmEULA = class(TForm)
    redEULA: TRichEdit;
    lblEULA: TLabel;
    lblLastEdited: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEULA: TfrmEULA;
  sLine : string;
  bLine : Boolean;

implementation

{$R *.dfm}

procedure TfrmEULA.FormShow(Sender: TObject);
var
  tFile : TextFile;
  sLastEdited : ShortString;

begin
  bLine := False;

  AssignFile(tFile, 'EULA.txt');
  Reset(tFile);

  while not Eof(tFile) do
  begin
    if bLine = False then
    begin
      Readln(tFile, sLastEdited);
      bLine := True;
    end

    else
    begin
      Readln(tFile, sLine);
      redEULA.Lines.Add(sLine);
    end;
  end;

  CloseFile(tFile);

  lblLastEdited.Caption := sLastEdited;
  sLine := redEULA.Text;

  MessageDlg(sLine, mtConfirmation, [mbOK], 0);
end;

end.
