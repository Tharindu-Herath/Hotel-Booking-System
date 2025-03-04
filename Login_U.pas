unit Login_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, jpeg, ComCtrls, clsValidation, ShellAPI;

type
  TfrmLogin = class(TForm)
    ShapeViewRooms: TShape;
    ShapePasswordLogin: TShape;
    lblNoAcc: TLabel;
    lblEmailLogin: TLabel;
    lblPasswordLogin: TLabel;
    imgViewRooms: TImage;
    lblView: TLabel;
    lblLoginText: TLabel;
    edtEmailLogin: TEdit;
    edtPasswordLogin: TEdit;
    imgHelpLogin: TImage;
    ShapeHelpLogin: TShape;
    ShapeIDLogin: TShape;
    ShapeLogin: TShape;
    lblLogin: TLabel;
    lblSignUp: TLabel;
    imgVisible: TImage;
    ShapeVisible: TShape;
    Timer1: TTimer;
    lblEmailErrorLogin: TLabel;
    lblPasswordErrorLogin: TLabel;
    ShapeExit: TShape;
    btnExist: TButton;
    imgLoginBack: TImage;
    lblByAccepting: TLabel;
    lblTC: TLabel;
    procedure btnSignInClick(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure lblSignUpMouseEnter(Sender: TObject);
    procedure lblSignUpMouseLeave(Sender: TObject);
    procedure lblSignUpClick(Sender: TObject);
    procedure lblLoginClick(Sender: TObject);
    procedure edtEmailLoginClick(Sender: TObject);
    procedure edtPasswordLoginClick(Sender: TObject);
    procedure lblLoginMouseEnter(Sender: TObject);
    procedure lblLoginMouseLeave(Sender: TObject);
    procedure imgVisibleClick(Sender: TObject);
    procedure imgVisibleMouseEnter(Sender: TObject);
    procedure imgVisibleMouseLeave(Sender: TObject);
    procedure imgNextClick(Sender: TObject);
    procedure imgBackClick(Sender: TObject);
    procedure imgViewRoomsMouseEnter(Sender: TObject);
    procedure imgViewRoomsMouseLeave(Sender: TObject);
    procedure imgViewRoomsClick(Sender: TObject);
    procedure btnExistClick(Sender: TObject);
    procedure imgHelpLoginMouseEnter(Sender: TObject);
    procedure imgHelpLoginMouseLeave(Sender: TObject);
    procedure edtPasswordLoginChange(Sender: TObject);
    procedure lblTCMouseLeave(Sender: TObject);
    procedure lblTCMouseEnter(Sender: TObject);
    procedure lblTCClick(Sender: TObject);
    procedure imgHelpLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EmptyLogin;
    procedure ResetLogin;
  end;

var
  frmLogin: TfrmLogin;

  objValidate : TValidate;

  lblReviewName3, lblReviewName4, lblReviewName5: TLabel;
  redReview3, redReview4, redReview5: TRichEdit;

  sEmailLogin, sPasswordLogin : string;
  bClicked : Boolean;

{2D Array - Used for Reviews}
  arrReview: Array[1..5, 1..2] of string;

  bForward : Boolean;

  bAdmin : Boolean;

implementation

uses
  dm, Admin_U, PickDate_U, SleepnSnore_U, CreateAccount_U, Booking_U, Help_U,
  ContactDetails_U, StandardUser_U;

{$R *.dfm}

procedure TfrmLogin.btnCreateClick(Sender: TObject);
begin
  Self.Hide;
  frmRegister.Show;
end;

procedure TfrmLogin.btnExistClick(Sender: TObject);
var
  iLeave: ShortInt;

begin
 iLeave:= MessageDlg('Are you sure you want to exit?', mtConfirmation, mbYesNo, 0);

  if iLeave = mrYes then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmLogin.btnSignInClick(Sender: TObject);
begin
  if True then
  begin
    Self.Hide;
    frmSleepnSnore.Show;
  end;
end;

procedure TfrmLogin.edtEmailLoginClick(Sender: TObject);
begin
  EmptyLogin;
{Clears the edit box so the user can enter their details without deleting text}

  if edtEmailLogin.Text = 'Email' then
  begin
    edtEmailLogin.Text := '';
    lblEmailLogin.Visible := TRUE;
  end;
end;

procedure TfrmLogin.edtPasswordLoginChange(Sender: TObject);
begin
  if (edtPasswordLogin.Text <> '') AND (edtPasswordLogin.Text <> 'Password') then
    bClicked := TRUE;
{Sets boolean value to TRUE to help set the correct PasswordChar}
end;

procedure TfrmLogin.edtPasswordLoginClick(Sender: TObject);
var
  tFile : TextFile;
  sLine : string;
  iAutofill : ShortInt;

begin
  EmptyLogin;
{Clears the edit box so the user can enter their details without deleting text}

  if (edtPasswordLogin.Text = 'Password') AND (bCLicked = False) then
  begin
    edtPasswordLogin.Text := '';
    lblPasswordLogin.Visible := TRUE;
    edtPasswordLogin.PasswordChar:= '*';

    AssignFile(tFile, 'Saved.txt');
    Reset(tFile);

    while not Eof(tFile) do
    begin
      Readln(tFile, sLine);

      if Copy(sLine, 1, Pos('#', sLine) - 1) = edtEmailLogin.Text then
      begin
        iAutofill := MessageDlg('Do you want to autofill your saved password?', mtConfirmation, mbYesNo, 0);

        if iAutofill = mrYes then
        begin
          Delete(sLine, 1, Pos('#', sLine));
          edtPasswordLogin.Text := sLine;
        end;
      end;
    end;

    CloseFile(tFile);
  end;
end;

{Clears the edit box so the user can enter their details without deleting text}
procedure TfrmLogin.EmptyLogin;
begin
  if edtEmailLogin.Text = '' then
  begin
    edtEmailLogin.Text := 'Email';
    lblEmailLogin.Visible := FALSE;
    lblEmailErrorLogin.Caption := '';
  end;

  if edtPasswordLogin.Text = '' then
  begin
    edtPasswordLogin.Text := 'Password';
    lblPasswordLogin.Visible := FALSE;
    edtPasswordLogin.PasswordChar:= #0;
  end;
end;

procedure TfrmLogin.imgBackClick(Sender: TObject);
begin
  Timer1.Enabled := TRUE;
end;

procedure TfrmLogin.imgHelpLoginClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'Login';
  frmHelp.Show;
end;

procedure TfrmLogin.imgHelpLoginMouseEnter(Sender: TObject);
begin
  ShapeHelpLogin.Brush.Color := $00864D00;
end;

procedure TfrmLogin.imgHelpLoginMouseLeave(Sender: TObject);
begin
  ShapeHelpLogin.Brush.Color := clSilver;
end;

procedure TfrmLogin.imgViewRoomsClick(Sender: TObject);
begin
  bLogin := False;

  Self.Hide;
  frmPickDate.Show;
end;

procedure TfrmLogin.imgViewRoomsMouseEnter(Sender: TObject);
begin
  ShapeViewRooms.Brush.Color := $00864D00;
end;

procedure TfrmLogin.imgViewRoomsMouseLeave(Sender: TObject);
begin
  ShapeViewRooms.Brush.Color := clSilver;
end;

procedure TfrmLogin.imgNextClick(Sender: TObject);
begin
  Timer1.Enabled := TRUE;
end;

procedure TfrmLogin.imgVisibleClick(Sender: TObject);
begin
  if bClicked = FALSE then
  begin
    //DO NOTHING
  end

  else if edtPasswordLogin.PasswordChar = '*' then
  begin
    imgVisible.Picture.LoadFromFile('Images\Visible Off.png');
    edtPasswordLogin.PasswordChar:= #0;
  end

  else
  begin
    imgVisible.Picture.LoadFromFile('Images\Visible On.png');
    edtPasswordLogin.PasswordChar:= '*';
  end;

end;

procedure TfrmLogin.imgVisibleMouseEnter(Sender: TObject);
begin
  ShapeVisible.Visible := TRUE;
end;

procedure TfrmLogin.imgVisibleMouseLeave(Sender: TObject);
begin
  ShapeVisible.Visible := FALSE;
end;

procedure TfrmLogin.lblLoginClick(Sender: TObject);
var
  bEmail, bPassword, bActivated, bExist : Boolean;
  tFile : TextFile;
  iViewContact, iSavePassword : ShortInt;
  sLine : string;

begin
  lblEmailErrorLogin.Caption := '';
  lblPasswordErrorLogin.Caption := '';

  bAdmin := False;
  bEmail := False;
  bPassword := False;
  bActivated := False;
  bExist := False;

  sEmailLogin := edtEmailLogin.Text;
  sPasswordLogin := edtPasswordLogin.Text;

  with pat do
  begin
    tblClients.First;

    while not tblClients.Eof do
    begin

      if (sEmailLogin = tblClients['Email']) then
      begin
        bEmail := TRUE;

        if (sPasswordLogin = tblClients['Password']) then
        begin
          bPassword := TRUE;

          if tblClients['Admin'] = True then
          begin
            AssignFile(tFile, 'TEMP.txt');
            Rewrite(tFile);
            Writeln(tFile, edtEmailLogin.Text);
            CloseFile(tFile);

            Self.Hide;
            frmAdmin.Show;
            ResetLogin;
            bLogin := True;
            bAdmin := True;
          end; //if Admin

        end; //if Password

        if tblClients['Activated'] = True then
            bActivated := True;
      end; //if Email

      tblClients.Next;
    end; //while
  end; //with
  //If Email & Password Exist

  if bAdmin = False then
  begin
    if (bEmail = TRUE) AND (bPassword = TRUE) AND (bActivated = TRUE) then
    begin
      AssignFile(tFile, 'TEMP.txt');
      Rewrite(tFile);
      Writeln(tFile, edtEmailLogin.Text);
      CloseFile(tFile);

      AssignFile(tFile, 'Saved.txt');
      Reset(tFile);

      while not Eof(tFile) do
      begin
        Readln(tFile, sLine);

        if Copy(sLine, 1, Pos('#', sLine) - 1) = edtEmailLogin.Text then
          bExist := True;
      end;

      CloseFile(tFile);

      if bExist = False then
      begin
        iSavePassword := MessageDlg('Do you want to save your password for easy login in future?' + #13 +
                   'We are not liable for any loss/leak of your password.', mtConfirmation, mbYesNo, 0);

        if iSavePassword = mrYes then
        begin
          AssignFile(tFile, 'Saved.txt');
          Append(tFile);
          Writeln(tFile, edtEmailLogin.Text + '#' + edtPasswordLogin.Text);
          CloseFile(tFile);

          MessageDlg('Password saved', mtInformation, [mbOK], 0);
        end

        else
          MessageDlg('Password not saved', mtInformation, [mbOK], 0);

      end;
      //if email doesn't exist in saved passwords

      ResetLogin;
      Self.Hide;
      frmStdUser.Show;
      bLogin := True;
    end

    else if (bEmail = TRUE) AND (bActivated = FALSE) then
    begin
      MessageDlg('Account deactivated. Please contact us to re-activate', mtError, [mbOK], 0);

      iViewContact := MessageDlg('Do you want to view our contact details?', mtInformation, mbYesNo, 0);

      if iViewContact = mrYes then
      begin
        iForm := 4;
        Self.Hide;
        frmContactDetails.Show;
      end;
    end

    else if (bEmail = FALSE) then
    begin
      MessageDlg('Email does not exist', mtError, [mbOK], 0);
      lblEmailErrorLogin.Caption := 'Incorrect Email';
    end

    else if (bPassword = FALSE) then
    begin
      MessageDlg('Invalid Password', mtError, [mbOK], 0);
      lblPasswordErrorLogin.Caption := 'Incorrect Password';
    end;

  end;
end;

procedure TfrmLogin.lblLoginMouseEnter(Sender: TObject);
begin
  ShapeLogin.Brush.Color := clHighlight;
end;

procedure TfrmLogin.lblLoginMouseLeave(Sender: TObject);
begin
  ShapeLogin.Brush.Color := $00864D00;
end;

procedure TfrmLogin.lblSignUpClick(Sender: TObject);
begin

  Self.Hide;
  frmRegister.Show;
end;

procedure TfrmLogin.lblSignUpMouseEnter(Sender: TObject);
begin
  lblSignUp.Font.Color := clRed;
end;

procedure TfrmLogin.lblSignUpMouseLeave(Sender: TObject);
begin
  lblSignUp.Font.Color := $00FF0080;
end;

{Shows T's and C's}
procedure TfrmLogin.lblTCClick(Sender: TObject);
var
  tFile : TextFile;
  sEULA, sLine  : string;
  bFirstLine : Boolean;

begin
  sEULA := '';
  sLine := '';
  bFirstLine := False;

  AssignFile(tFile, 'EULA.txt');
  Reset(tFile);

  while not Eof(tFile) do
  begin
    Readln(tFile, sLine);

    if sLine = '' then
      sEULA := sEULA + #13

    else if bFirstLine = False then
    begin
      bFirstLine := True;
      sEULA := sLine;
    end

    else
      sEULA := sEULA + #13 + sLine;
  end;

  CloseFile(tFile);

  MessageDlg(sEULA, mtConfirmation, [mbOK], 0);
end;

procedure TfrmLogin.lblTCMouseEnter(Sender: TObject);
begin
  lblTC.Font.Color := clHighlight;
  lblTC.Font.Style := [fsUnderline];
end;

procedure TfrmLogin.lblTCMouseLeave(Sender: TObject);
begin
  lblTC.Font.Color := $00864D00;
  lblTC.Font.Style := [];
end;

procedure TfrmLogin.ResetLogin;
begin

end;

end.
