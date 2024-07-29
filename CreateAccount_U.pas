unit CreateAccount_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, clsValidation, jpeg, ShellAPI;

type
  TfrmRegister = class(TForm)
    ShapePasswordRegister: TShape;
    lblSignIn: TLabel;
    ShapeSurnameRegister: TShape;
    lblNameRegister: TLabel;
    lblSurnameRegister: TLabel;
    lblPasswordRegister: TLabel;
    lblIDRegister: TLabel;
    ShapeEmailRegister: TShape;
    lblEmailRegister: TLabel;
    edtPasswordRegister: TEdit;
    edtNameRegister: TEdit;
    edtSurnameRegister: TEdit;
    edtIDRegister: TEdit;
    edtEmailRegister: TEdit;
    lblCreate: TLabel;
    ShapeCellRegister: TShape;
    lblCellRegister: TLabel;
    edtCellRegister: TEdit;
    ShapeNameRegister: TShape;
    ShapeIDRegister: TShape;
    chkVeg: TCheckBox;
    chkWheelChair: TCheckBox;
    lblPasswordError: TLabel;
    lblEmailError: TLabel;
    lblIDError: TLabel;
    lblSignInRegister: TLabel;
    lblNameError: TLabel;
    lblSurnameError: TLabel;
    lblCellError: TLabel;
    TimerMove: TTimer;
    ShapeCreateAccount: TShape;
    lblCreateAccount: TLabel;
    ShapeVisible: TShape;
    imgVisibleR: TImage;
    ShapeExit: TShape;
    btnExist: TButton;
    imgCreateBack: TImage;
    ShapeWheel: TShape;
    ShapeVeg: TShape;
    imgHelpCreate: TImage;
    ShapeHelpCreate: TShape;
    procedure edtNameRegisterClick(Sender: TObject);
    procedure edtSurnameRegisterClick(Sender: TObject);
    procedure edtEmailRegisterClick(Sender: TObject);
    procedure edtIDRegisterClick(Sender: TObject);
    procedure edtCellRegisterClick(Sender: TObject);
    procedure edtPasswordRegisterClick(Sender: TObject);
    procedure edtPasswordRegisterChange(Sender: TObject);
    procedure edtEmailRegisterChange(Sender: TObject);
    procedure edtIDRegisterChange(Sender: TObject);
    procedure lblSignInRegisterMouseLeave(Sender: TObject);
    procedure lblSignInRegisterMouseEnter(Sender: TObject);
    procedure lblSignInRegisterClick(Sender: TObject);
    procedure imgNextClick(Sender: TObject);
    procedure imgBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNameRegisterChange(Sender: TObject);
    procedure edtSurnameRegisterChange(Sender: TObject);
    procedure edtCellRegisterChange(Sender: TObject);
    procedure lblCreateAccountMouseLeave(Sender: TObject);
    procedure lblCreateAccountMouseEnter(Sender: TObject);
    procedure lblCreateAccountClick(Sender: TObject);
    procedure imgVisibleRMouseEnter(Sender: TObject);
    procedure imgVisibleRMouseLeave(Sender: TObject);
    procedure imgVisibleRClick(Sender: TObject);
    procedure btnExistClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgWhatsappClick(Sender: TObject);
    procedure imgInstagramClick(Sender: TObject);
    procedure imgYoutubeClick(Sender: TObject);
    procedure lblWebsiteCreateMouseLeave(Sender: TObject);
    procedure lblWebsiteCreateClick(Sender: TObject);
    procedure imgHelpCreateClick(Sender: TObject);
    procedure imgHelpCreateMouseLeave(Sender: TObject);
    procedure imgHelpCreateMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Empty;
    procedure SetBlack;
    function Check: Boolean;
    function CheckExist: Boolean;
    procedure ResetRegister;

    {Procedures to validate the following information of the client. I used procedures
     as I need to validate on multiple forms}
    procedure Name(sName: string);
    procedure Surname(sSurname: string);
    procedure ID(sID: string);
    procedure Email(sEmail: string);
    procedure Cell(sCell: string);
    procedure Password(sPassword: string);
  end;

var
  frmRegister: TfrmRegister;

  objValidate: TValidate;

  sName, sSurname, sID, sEmail, sCell, sPassword,
  sNameE, sSurnameE, sIDE, sEmailE, sCellE, sPasswordE,
  sNameC, sSurnameC, sIDC, sEmailC, sCellC, sPasswordC, sPasswordEC,
  sForm, sMessage: ShortString;

  iNameL, iSurnameL, iIDL, iCellL, iPasswordL: Integer;

  bClickedCreate, bCreate : Boolean;

implementation

uses
  dm, Login_U, StandardUser_U, SleepnSnore_U, Help_U;

{$R *.dfm}

procedure TfrmRegister.btnExistClick(Sender: TObject);
var
  iLeaveR: ShortInt;

begin
  iLeaveR := MessageDlg('Are you sure you want to exit?', mtConfirmation, mbYesNo, 0);

  if iLeaveR = mrYes then
  begin
    Application.Terminate;
  end;
end;

{Procedure to Validate Cell Number; Checks if the length is exactly 10}
procedure TfrmRegister.Cell(sCell: string);
begin
  if Length(sCell) < 10 then
  begin
    sCellE := 'Too Short';

    if sForm = 'Create' then
      iCellL := 783

    else if sForm = 'Admin' then
      iCellL := 765

    else if sForm = 'Standard' then
      iCellL := 313;

    sCellC := 'clRed';
  end

  else if Length(sCell) > 10 then
  begin
    sCellE := 'Too Long';

    if sForm = 'Create' then
      iCellL := 787

    else if sForm = 'Admin' then
      iCellL := 769

    else if sForm = 'Standard' then
      iCellL := 317;

    sCellC := 'clRed';
  end

  else
  begin
    sCellE := '';
    sCellC := '$00864D00';
  end;

  if sCell = '' then
  begin
    sCellE := '';
    sCellC := 'clWindowText';
  end;
end;

function TfrmRegister.Check: Boolean;
begin
  if ((lblNameError.Caption = '') AND (lblSurnameError.Caption = '') AND
      (lblIDError.Caption = '') AND (lblEmailError.Caption = '') AND
      (lblCellError.Caption = '') AND
      ((lblPasswordError.Caption <> 'Too Short') OR
        (lblPasswordError.Caption <> 'Too Long'))) AND
    ((edtNameRegister.Text <> 'First Name') AND
      (edtSurnameRegister.Text <> 'Surname') AND
      (edtIDRegister.Text <> 'ID Number') AND
      (edtEmailRegister.Text <> 'Email') AND
      (edtCellRegister.Text <> 'Cell Number') AND
      (edtPasswordRegister.Text <> 'Password')) then
  begin
    Result := TRUE;
  end

  else
    Result := FALSE;

end;

{Check for duplicates in database. User is allowed to create an account even if
 there is another email or cell number}
function TfrmRegister.CheckExist: Boolean;
var
  bCheckExist : Boolean;

begin
  bCheckExist := FALSE;

  with pat do
  begin
    tblClients.First;

    while (not tblClients.Eof) AND (bCheckExist = FALSE) do
    begin
      if edtIDRegister.Text = tblClients['ID'] then
      begin
        Result := FALSE;
        bCheckExist := TRUE;
        sMessage := 'ID Number already exists';
        edtIDRegister.SetFocus;
      end
                  
      else
        Result := TRUE;

      tblClients.Next;
    end; //while

  end;

end;

procedure TfrmRegister.edtCellRegisterChange(Sender: TObject);
begin
  sCell := edtCellRegister.Text;
  sForm := 'Create';

  Cell(sCell);

  lblCellError.Caption := sCellE;
  lblCellError.Left := iCellL;
  edtCellRegister.Font.Color := StringToColor(sCellC);
end;

procedure TfrmRegister.edtCellRegisterClick(Sender: TObject);
begin
  Empty;

  if edtCellRegister.Text = 'Cell Number' then
  begin
    edtCellRegister.Clear;
    lblCellRegister.Visible := TRUE;
  end;
end;

procedure TfrmRegister.edtEmailRegisterChange(Sender: TObject);
begin
  sEmail := edtEmailRegister.Text;
  sForm := 'Create';

  Email(sEmail);

  lblEmailError.Caption := sEmailE;
  edtEmailRegister.Font.Color := StringToColor(sEmailC);
end;

procedure TfrmRegister.edtEmailRegisterClick(Sender: TObject);
begin
  Empty;

  if edtEmailRegister.Text = 'Email' then
  begin
    edtEmailRegister.Clear;
    lblEmailRegister.Visible := TRUE;
  end;
end;

procedure TfrmRegister.edtIDRegisterChange(Sender: TObject);
begin
  sID := edtIDRegister.Text;
  sForm := 'Create';

  ID(sID);

  lblIDError.Caption := sIDE;
  lblIDError.Left := iIDL;
  edtIDRegister.Font.Color := StringToColor(sIDC);
end;

procedure TfrmRegister.edtIDRegisterClick(Sender: TObject);
begin
  Empty;

  if edtIDRegister.Text = 'ID Number' then
  begin
    edtIDRegister.Clear;
    lblIDRegister.Visible := TRUE;
  end;
end;

procedure TfrmRegister.edtNameRegisterChange(Sender: TObject);
begin
  sName := edtNameRegister.Text;
  sForm := 'Create';

  Name(sName);

  lblNameError.Caption := sNameE;
  lblNameError.Left := iNameL;
  edtNameRegister.Font.Color := StringToColor(sNameC);
end;

procedure TfrmRegister.edtNameRegisterClick(Sender: TObject);
begin
  Empty;

  if edtNameRegister.Text = 'First Name' then
  begin
    edtNameRegister.Clear;
    lblNameRegister.Visible := TRUE;
  end;
end;

procedure TfrmRegister.edtPasswordRegisterChange(Sender: TObject);
begin
  sPassword := edtPasswordRegister.Text;

  if (sPassword <> '') AND (sPassword <> 'Password') then
    bClickedCreate := TRUE;

  sForm := 'Create';

  Password(sPassword);

  lblPasswordError.Caption := sPasswordE;
  lblPasswordError.Left := iPasswordL;
  lblPasswordError.Font.Color := StringToColor(sPasswordEC);
  edtPasswordRegister.Font.Color := StringToColor(sPasswordC);
end;

procedure TfrmRegister.edtPasswordRegisterClick(Sender: TObject);
begin
  Empty;

  if (edtPasswordRegister.Text = 'Password') AND (bClickedCreate = False) then
  begin
    edtPasswordRegister.Text := '';
    lblPasswordRegister.Visible := TRUE;
    edtPasswordRegister.PasswordChar := '*';
  end;
end;

procedure TfrmRegister.edtSurnameRegisterChange(Sender: TObject);
begin
  sSurname := edtSurnameRegister.Text;
  sForm := 'Create';

  Surname(sSurname);

  lblSurnameError.Caption := sSurnameE;
  lblSurnameError.Left := iSurnameL;
  edtSurnameRegister.Font.Color := StringToColor(sSurnameC);
end;

procedure TfrmRegister.edtSurnameRegisterClick(Sender: TObject);
begin
  Empty;

  if edtSurnameRegister.Text = 'Surname' then
  begin
    edtSurnameRegister.Clear;
    lblSurnameRegister.Visible := TRUE;
  end;
end;

{Procedure to Validate Email. Checks if the length does not exceed the max 40
 and if the email has an @ and a '.' after the @}
procedure TfrmRegister.Email(sEmail: string);
var
  iPos, I: ShortInt;
  bBoolean: Boolean;

begin
  iPos := 0;

  bBoolean := FALSE;
  iPos := Pos('@', sEmail);

  if (iPos > 0) then
  begin
    for I := iPos to Length(sEmail) do
    begin
      if sEmail[I] = '.' then
      begin
        sEmailE := '';
        bBoolean := TRUE;
      end

      else
      begin
        sEmailE := 'Invalid Format';
        sEmailC := 'clRed';
      end;

    end; // for
  end

  else
  begin
    sEmailE := 'Invalid Format';
    sEmailC := 'clRed';
  end;

  if bBoolean = TRUE then
  begin
    sEmailE := '';
    sEmailC := '$00864D00';
  end;

  if sEmail = '' then
  begin
    sEmailE := '';
    sEmailC := 'clWindowText';
  end;

  if Length(sEmail) > 40 then
  begin
    sEmailE := 'Max Length: 40';
    sEmailC := 'clRed';
  end;

end;

procedure TfrmRegister.Empty;
begin
  if edtNameRegister.Text = '' then
  begin
    edtNameRegister.Text := 'First Name';
    lblNameRegister.Visible := FALSE;
    edtNameRegister.Font.Color := clWindowText;
    lblNameError.Caption := '';
  end;

  if edtSurnameRegister.Text = '' then
  begin
    edtSurnameRegister.Text := 'Surname';
    lblSurnameRegister.Visible := FALSE;
    edtSurnameRegister.Font.Color := clWindowText;
    lblSurnameError.Caption := '';
  end;

  if edtEmailRegister.Text = '' then
  begin
    edtEmailRegister.Text := 'Email';
    lblEmailRegister.Visible := FALSE;
    lblEmailError.Caption := '';
    edtEmailRegister.Font.Color := clWindowText;
    lblEmailError.Caption := '';
  end;

  if edtIDRegister.Text = '' then
  begin
    edtIDRegister.Text := 'ID Number';
    lblIDRegister.Visible := FALSE;
    lblIDError.Caption := '';
    edtIDRegister.Font.Color := clWindowText;
    lblIDError.Caption := '';
  end;

  if edtCellRegister.Text = '' then
  begin
    edtCellRegister.Text := 'Cell Number';
    lblCellRegister.Visible := FALSE;
    edtCellRegister.Font.Color := clWindowText;
    lblCellError.Caption := '';
  end;

  if edtPasswordRegister.Text = '' then
  begin
    edtPasswordRegister.Text := 'Password';
    lblPasswordRegister.Visible := FALSE;
    edtPasswordRegister.Font.Color := clWindowText;
    lblPasswordError.Caption := '';
    edtPasswordRegister.PasswordChar := #0;
  end;

end;

procedure TfrmRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin

end;

{Procedure to Validate ID. Checks if length is 13}
procedure TfrmRegister.ID(sID: string);
begin
  if Length(sID) < 13 then
  begin
    sIDE := 'Too Short';

    if sForm = 'Create' then
      iIDL := 792

    else if sForm = 'Admin' then
      iIDL := 296

    else if sForm = 'Standard' then
      iIDL := 313;

    sIDC := 'clRed';
  end

  else if Length(sID) > 13 then
  begin
    sIDE := 'Too long';

    if sForm = 'Create' then
      iIDL := 796

    else if sForm = 'Admin' then
      iIDL := 296

    else if sForm = 'Standard' then
      iIDL := 317;

    sIDC := 'clRed';
  end

  else
  begin
    sIDE := '';
    sIDC := '$00864D00';
  end;

  if sID = '' then
  begin
    sIDE := '';
    sIDC := 'clWindowText';
  end;
end;

procedure TfrmRegister.imgBackClick(Sender: TObject);
begin
  TimerMove.Enabled := TRUE;
end;

procedure TfrmRegister.imgHelpCreateClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'Create';
  frmHelp.Show;
end;

procedure TfrmRegister.imgHelpCreateMouseEnter(Sender: TObject);
begin
  ShapeHelpCreate.Brush.Color := $00864D00;
end;

procedure TfrmRegister.imgHelpCreateMouseLeave(Sender: TObject);
begin
  ShapeHelpCreate.Brush.Color := clSilver;
end;

procedure TfrmRegister.imgInstagramClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://www.instagram.com/palm.woods_?r=nametag'), nil, nil, SW_NORMAL);
end;

procedure TfrmRegister.imgNextClick(Sender: TObject);
begin
  TimerMove.Enabled := TRUE;
end;

procedure TfrmRegister.imgVisibleRClick(Sender: TObject);
begin
  if bClickedCreate = False then
  begin
    //DO NOTHING
  end

  else if edtPasswordRegister.PasswordChar = '*' then
  begin
    imgVisibleR.Picture.LoadFromFile('Images\Visible Off.png');
    edtPasswordRegister.PasswordChar := #0;
  end

  else
  begin
    imgVisibleR.Picture.LoadFromFile('Images\Visible On.png');
    edtPasswordRegister.PasswordChar := '*';
  end;
end;

procedure TfrmRegister.imgVisibleRMouseEnter(Sender: TObject);
begin
  ShapeVisible.Visible := TRUE;
end;

procedure TfrmRegister.imgVisibleRMouseLeave(Sender: TObject);
begin
  ShapeVisible.Visible := FALSE;
end;

procedure TfrmRegister.imgWhatsappClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://wa.me/27728769357'), nil, nil, SW_NORMAL);
end;

procedure TfrmRegister.imgYoutubeClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://www.youtube.com/channel/UCGHNFEoEL_dL7KmA_fsPibg?view_as=subscriber'), nil, nil, SW_NORMAL);
end;

procedure TfrmRegister.lblCreateAccountClick(Sender: TObject);
var
  tFile : TextFile;

begin
  if (Check = TRUE) AND (CheckExist = TRUE) then
  begin
    with pat do
    begin
      tblClients.Insert;

      tblClients['FirstNames'] := edtNameRegister.Text;
      tblClients['Surname'] := edtSurnameRegister.Text;
      tblClients['ID'] := edtIDRegister.Text;
      tblClients['Email'] := edtEmailRegister.Text;
      tblClients['CellNo'] := edtCellRegister.Text;
      tblClients['Password'] := edtPasswordRegister.Text;

      if chkVeg.Checked then
        tblClients['Vegetarian'] := TRUE

      else
        tblClients['Vegetarian'] := FALSE;

      if chkWheelChair.Checked then
        tblClients['WheelchairAccess'] := TRUE

      else
        tblClients['WheelchairAccess'] := FALSE;

      tblClients['Review'] := '';
      tblClients['Activated'] := True;

      sEmailLogin := edtEmailRegister.Text;

      tblClients.Post;
      tblClients.Refresh;

      MessageDlg('Account created successfully', mtConfirmation, [mbOK], 0);

      AssignFile(tFile, 'TEMP.txt');
      Rewrite(tFile);
      Writeln(tFile, edtEmailRegister.Text);
      CloseFile(tFile);

      Self.Hide;
      frmStdUser.Show;

      bLogin := True;
      bCreate := True;
    end;
  end

  else if CheckExist = FALSE then
  begin
    MessageDlg(sMessage, mtError, [mbOK], 0);
  end

  else
  begin
    MessageDlg('Please make sure all details entered correctly', mtError,
      [mbOK], 0);
  end;
end;

procedure TfrmRegister.lblCreateAccountMouseEnter(Sender: TObject);
begin
  ShapeCreateAccount.Brush.Color := clHighlight;
  Cursor := crHandPoint;
end;

procedure TfrmRegister.lblCreateAccountMouseLeave(Sender: TObject);
begin
  ShapeCreateAccount.Brush.Color := $00864D00;
  Cursor := crDefault;
end;

procedure TfrmRegister.lblSignInRegisterClick(Sender: TObject);
begin
  Self.Hide;
  frmLogin.Show;
end;

procedure TfrmRegister.lblSignInRegisterMouseEnter(Sender: TObject);
begin
  lblSignInRegister.Font.Color := clRed;
  Cursor := crHandPoint;
end;

procedure TfrmRegister.lblSignInRegisterMouseLeave(Sender: TObject);
begin
  lblSignInRegister.Font.Color := $00FF0080;
  Cursor := crDefault;
end;

procedure TfrmRegister.lblWebsiteCreateClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://bit.ly/SleepnSnore'), nil, nil, SW_NORMAL);
end;

procedure TfrmRegister.lblWebsiteCreateMouseLeave(Sender: TObject);
begin

end;

{Procedure to Validate Name. Uses the Validation class to check if theres letters
 only and checks if the length exeeds 40 characters}
procedure TfrmRegister.Name(sName: string);
begin
  if objValidate.validWordNoLength(sName) = FALSE then
  begin
    sNameE := 'Letters Only';

    if sForm = 'Create' then
      iNameL := 777

    else if sForm = 'Admin' then
      iNameL := 277

    else if sForm = 'Standard' then
      iNameL := 298;

    sNameC := 'clRed';
  end

  else
  begin
    sNameE := '';
    sNameC := '$00864D00';
  end;

  if Length(sName) > 40 then
  begin
    sNameE := 'Too Long';

    if sForm = 'Create' then
      iNameL := 796

    else if sForm = 'Admin' then
      iNameL := 296

    else if sForm = 'Standard' then
      iNameL := 317;

    sNameC := 'clRed';
  end;

  if sName = '' then
  begin
    sNameC := 'clWindowText';
  end;

end;

{Procedure to Validate the Password. Checks the length and also gives feedback on
 strength of password but only based on length}
procedure TfrmRegister.Password(sPassword: string);
begin
  if Length(sPassword) < 6 then
  begin
    sPasswordE := 'Too Short';

    if sForm = 'Create' then
      iPasswordL := 792

    else if sForm = 'Admin' then
      iPasswordL := 765

    else if sForm = 'Standard' then
      iPasswordL := 313;

    sPasswordC := 'clRed';
    sPasswordEC := 'clRed';
  end

  else if (Length(sPassword) >= 6) AND (Length(sPassword) < 10) then
  begin
    sPasswordE := 'Strength: Medium';

    if sForm = 'Create' then
      iPasswordL := 745

    else if sForm = 'Admin' then
      iPasswordL := 716

    else if sForm = 'Standard' then
      iPasswordL := 264;

    sPasswordC := '$00864D00';
    sPasswordEC := '$004080FF';
  end

  else if (Length(sPassword) >= 10) AND (Length(sPassword) <= 16)
    then
  begin
    sPasswordE := 'Strength: Strong';

    if sForm = 'Create' then
      iPasswordL := 758

    else if sForm = 'Admin' then
      iPasswordL := 726

    else if sForm = 'Standard' then
      iPasswordL := 274;

    sPasswordC := '$00864D00';
    sPasswordEC := 'clGreen';
  end

  else if Length(sPassword) > 16 then
  begin
    sPasswordE := 'Too Long';

    if sForm = 'Create' then
      iPasswordL := 796

    else if sForm = 'Admin' then
      iPasswordL := 769

    else if sForm = 'Standard' then
      iPasswordL := 317;

    sPasswordC := 'clRed';
    sPasswordEC := 'clRed';
  end

  else
  begin
    sPasswordE := '';
    sPasswordC := '$00864D00';
  end;

  if sPassword = '' then
  begin
    sPasswordE := '';
    sPasswordC := 'clWindowText';
  end;
end;

{Resets form}
procedure TfrmRegister.ResetRegister;
begin
  edtNameRegister.Text := 'First Name';
  edtSurnameRegister.Text := 'Surname';
  edtIDRegister.Text := 'ID Number';
  edtEmailRegister.Text := 'Email';
  edtCellRegister.Text := 'Cell Number';
  edtPasswordRegister.Text := 'Password';
  imgVisibleR.Picture.LoadFromFile('Images\Visible On.png');
end;

{As I change the font colour based on the user input, this procedure to set the
 components backt to their default colour}
procedure TfrmRegister.SetBlack;
begin
  edtNameRegister.Font.Color := clWindowText;
  edtSurnameRegister.Font.Color := clWindowText;
  edtIDRegister.Font.Color := clWindowText;
  edtEmailRegister.Font.Color := clWindowText;
  edtCellRegister.Font.Color := clWindowText;
end;

{Procedure to Validate Surname. Checks length and uses Validation class to see
 if its just letters}
procedure TfrmRegister.Surname(sSurname: string);
begin
  if objValidate.validWordNoLength(sSurname) = FALSE then
  begin
    sSurnameE := 'Letters Only';

    if sForm = 'Create' then
      iSurnameL := 777

    else if sForm = 'Admin' then
      iSurnameL := 277

    else if sForm = 'Standard' then
      iSurnameL := 298;

    sSurnameC := 'clRed';
  end

  else
  begin
    sSurnameE := '';
    sSurnameC := '$00864D00';
  end;

  if Length(sSurname) > 30 then
  begin
    sSurnameE := 'Too Long';

    if sForm = 'Create' then
      iSurnameL := 796

    else if sForm = 'Admin' then
      iSurnameL := 296

    else if sForm = 'Standard' then
      iSurnameL := 317;

    sSurnameC := 'clRed';
  end;

  if sSurname = '' then
  begin
    sSurnameC := 'clWindowText';
  end;
end;

{For Animation with blue and red panels}
end.
