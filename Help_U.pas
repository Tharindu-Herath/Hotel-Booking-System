unit Help_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, pngimage;

type
  TfrmHelp = class(TForm)
    redHelp: TRichEdit;
    lblHelpMain: TLabel;
    ShapeBackC: TShape;
    imgBackC: TImage;
    imgContact: TImage;
    procedure FormShow(Sender: TObject);
    procedure imgBackCClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBackCMouseLeave(Sender: TObject);
    procedure imgBackCMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TextFileHelp;
  end;

var
  frmHelp: TfrmHelp;
  sHelpForm : ShortString;
  tHelp : TextFile;

implementation

uses
  Login_U, CreateAccount_U, StandardUser_U, SleepnSnore_U, Admin_U, Booking_U,
  ViewHistory_U;

{$R *.dfm}

procedure TfrmHelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmHelp.FormShow(Sender: TObject);
begin
  redHelp.Clear;

  if sHelpForm = 'Login' then
    AssignFile(tHelp, 'Help Login.txt')

  else if sHelpForm = 'Create' then
    AssignFile(tHelp, 'Help Sign Up.txt')

  else if sHelpForm = 'Standard' then
    AssignFile(tHelp, 'Help Standard User.txt')

  else if sHelpForm = 'Palm Woods' then
    AssignFile(tHelp, 'Help Palm Woods.txt')

  else if sHelpForm = 'Admin' then
    AssignFile(tHelp, 'Help Admin.txt')

  else if sHelpForm = 'Booking' then
    AssignFile(tHelp, 'Help Booking.txt')

  else if sHelpForm = 'History' then
    AssignFile(tHelp, 'Help View History.txt');

  TextFileHelp;
end;

procedure TfrmHelp.imgBackCClick(Sender: TObject);
begin
  if sHelpForm = 'Login' then
  begin
    frmLogin.Enabled := True;
    Self.Hide;
  end

  else if sHelpForm = 'Create' then
  begin
    frmRegister.Enabled := True;
    Self.Hide;
  end

  else if sHelpForm = 'Standard' then
  begin
    frmStdUser.Enabled := True;
    Self.Hide;
  end

  else if sHelpForm = 'Palm Woods' then
  begin
    frmSleepnSnore.Enabled := True;
    Self.Hide;
  end

  else if sHelpForm = 'Admin' then
  begin
    frmAdmin.Enabled := True;
    Self.Hide;
  end

  else if sHelpForm = 'Booking' then
  begin
    frmBooking.Enabled := True;
    Self.Hide;
  end

  else if sHelpForm = 'History' then
  begin
    frmHistory.Enabled := True;
    Self.Hide;
  end;
end;

procedure TfrmHelp.imgBackCMouseEnter(Sender: TObject);
begin
  ShapeBackC.Visible := True;
end;

procedure TfrmHelp.imgBackCMouseLeave(Sender: TObject);
begin
  ShapeBackC.Visible := False;
end;

procedure TfrmHelp.TextFileHelp;
var
  sLine : string;

begin
  Reset(tHelp);

  while not Eof(tHelp) do
  begin
    Readln(tHelp, sLine);
    redHelp.Lines.Add(sLine);
  end;

  CloseFile(tHelp);
end;

end.
