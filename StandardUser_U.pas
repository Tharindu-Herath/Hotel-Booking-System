unit StandardUser_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, pngimage, ExtCtrls, jpeg;

type
  TfrmStdUser = class(TForm)
    imgBack: TImage;
    ShapeBackStd: TShape;
    grpbManageDetails: TGroupBox;
    imgEditAccStd: TImage;
    lblCellErrorStd: TLabel;
    lblCellStd: TLabel;
    lblDeleteStd: TLabel;
    lblEditStd: TLabel;
    lblEmailErrorStd: TLabel;
    lblEmailStd: TLabel;
    lblIDErrorStd: TLabel;
    lblIDStd: TLabel;
    lblNameErrorStd: TLabel;
    lblNameStd: TLabel;
    lblPasswordErrorStd: TLabel;
    lblPasswordStd: TLabel;
    lblReviewStd: TLabel;
    lblSaveStd: TLabel;
    lblSurnameErrorStd: TLabel;
    lblSurnameStd: TLabel;
    ShapeCellStd: TShape;
    ShapeDeleteStd: TShape;
    ShapeEmailStd: TShape;
    ShapeIDStd: TShape;
    ShapeNameStd: TShape;
    ShapePasswordStd: TShape;
    ShapeReviewStd: TShape;
    ShapeSaveStd: TShape;
    ShapeSurnameStd: TShape;
    ShapeVisibleStd: TShape;
    imgVisibleStd: TImage;
    chkVegStd: TCheckBox;
    chkWheelChairStd: TCheckBox;
    edtCellStd: TEdit;
    edtEmailStd: TEdit;
    edtIDStd: TEdit;
    edtNameStd: TEdit;
    edtPasswordStd: TEdit;
    edtSurnameStd: TEdit;
    redReviewStd: TRichEdit;
    grpbLatestBooking: TGroupBox;
    ShapeMakeNewBooking: TShape;
    imgLatestBookingStd: TImage;
    lblAmtDueStd: TLabel;
    lblAmtPaidStd: TLabel;
    lblBookingIDStd: TLabel;
    lblBookingStd: TLabel;
    lblMakeNewBooking: TLabel;
    lblNumOfDays: TLabel;
    lblRoomNumStd: TLabel;
    lblStartDateStd: TLabel;
    ShapeAmtDue: TShape;
    ShapeAmtPaid: TShape;
    ShapeBookingIDStd: TShape;
    ShapeNumOfDays: TShape;
    ShapeRoomNumStd: TShape;
    ShapeStartDateStd: TShape;
    edtAmtDueStd: TEdit;
    edtAmtPaidStd: TEdit;
    edtBookingIDStd: TEdit;
    edtNumOfDays: TEdit;
    edtRoomNumStd: TEdit;
    edtStartDate: TEdit;
    imgLogo: TImage;
    imgBackStd: TImage;
    Label1: TLabel;
    lblLatestBooking: TLabel;
    grpMakeNewBooking: TGroupBox;
    lblReviewErrorStd: TLabel;
    btnSaveReview: TButton;
    ShapeHistory: TShape;
    imgHistory: TImage;
    imgHelpStd: TImage;
    ShapeHelpStd: TShape;
    lblContactUsLogin: TLabel;
    procedure FormShow(Sender: TObject);
    procedure imgBackClick(Sender: TObject);
    procedure lblSaveStdMouseEnter(Sender: TObject);
    procedure lblMakeNewBookingMouseEnter(Sender: TObject);
    procedure lblMakeNewBookingMouseLeave(Sender: TObject);
    procedure lblSaveStdMouseLeave(Sender: TObject);
    procedure edtNameStdChange(Sender: TObject);
    procedure edtSurnameStdChange(Sender: TObject);
    procedure edtIDStdChange(Sender: TObject);
    procedure edtEmailStdChange(Sender: TObject);
    procedure edtCellStdChange(Sender: TObject);
    procedure edtPasswordStdChange(Sender: TObject);
    procedure imgVisibleStdMouseEnter(Sender: TObject);
    procedure imgVisibleStdMouseLeave(Sender: TObject);
    procedure lblDeleteStdMouseEnter(Sender: TObject);
    procedure lblDeleteStdMouseLeave(Sender: TObject);
    procedure redReviewStdChange(Sender: TObject);
    procedure lblSaveStdClick(Sender: TObject);
    procedure imgVisibleStdClick(Sender: TObject);
    procedure lblDeleteStdClick(Sender: TObject);
    procedure imgBackMouseLeave(Sender: TObject);
    procedure imgBackMouseEnter(Sender: TObject);
    procedure lblMakeNewBookingClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveReviewClick(Sender: TObject);
    procedure imgHistoryMouseEnter(Sender: TObject);
    procedure imgHistoryMouseLeave(Sender: TObject);
    procedure imgHistoryClick(Sender: TObject);
    procedure lblContactUsLoginMouseEnter(Sender: TObject);
    procedure lblContactUsLoginMouseLeave(Sender: TObject);
    procedure imgHelpStdMouseEnter(Sender: TObject);
    procedure imgHelpStdMouseLeave(Sender: TObject);
    procedure lblContactUsLoginClick(Sender: TObject);
    procedure imgHelpStdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CheckStd: Boolean;
    function CheckExistStd: Boolean;
    procedure Review(sReview: string);

    {**There are procedures from the create account form used to validate the users
       input. The explanations for each are on that form. Please refer to that
       if required}
  end;

var
  frmStdUser: TfrmStdUser;

  sMessageStd : ShortString;
  sIDStd, sEmailStd : string;
  iEasterEggCount : ShortInt;

  sReviewE, sReviewC : ShortString;

  iPosV: Integer = 1;

implementation

uses
  dm, PalmWoods_U, Login_U, CreateAccount_U, PickDate_U, ViewHistory_U, Admin_U,
  ContactDetails_U, Help_U;

{$R *.dfm}

procedure TfrmStdUser.btnSaveReviewClick(Sender: TObject);
var
  sWords, sWord: string;
  I: Integer;
  bVulgar : Boolean;
  tFile : TextFile;
  sVulgar : string;

begin
  bVulgar := False;

  if btnSaveReview.Caption = 'Save' then
  begin
    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if tblClients['ID'] = sIDStd then
        begin
          tblClients.Edit;
          tblClients['Review'] := redReviewStd.Text;
          tblClients.Post;
          tblClients.Refresh;
        end;

        tblClients.Next;
      end;
    end;

    MessageDlg('Review Updated Successfully', mtInformation, [mbOK], 0);
    redReviewStd.Height := 284;
    btnSaveReview.Visible := False;
  end

{Verifies Review by checking if there's no vulgar words. There is no validation
 for the review in the admin page as it is expected that the admin would not do
 that. If there are any reviews with Vulgar words, that will give the owner
 a heads up that something is wrong}
  else if btnSaveReview.Caption = 'Verify' then
  begin
    sWords := redReviewStd.Text + ' ';

    for I := 1 to Length(sWords) do
    begin
      sWord := '';

      if sWords[I] = ' ' then
      begin
        sWord := Copy(sWords, iPosV, I - iPosV);

        AssignFile(tFile, 'Vulgar Words.txt');
        Reset(tFile);

        while not Eof(tFile) do
        begin
          Readln(tFile, sVulgar);

          if LowerCase(sWord) = LowerCase(sVulgar) then
          begin
            lblReviewErrorStd.Caption := 'No vulguar words!';
            redReviewStd.Font.Color := clRed;
            bVulgar := True;
          end;
        end;

        CloseFile(tFile);

        iPosV := I + 1;
      end; //if

    end; //for

    if (bVulgar = True) AND (btnSaveReview.Caption = 'Verify') then
    begin
      MessageDlg('Your Review contains vulgar words, please change your review.', mtWarning, [mbOK], 0);
    end;

    if bVulgar = False then
    begin
      btnSaveReview.Caption := 'Save';
      MessageDlg('Your Review has been verified, you can save your review.', mtInformation, [mbOK], 0);
    end;

  end;

end;

function TfrmStdUser.CheckExistStd: Boolean;
var
  bCheckExistStd: Boolean;

begin
  bCheckExistStd := FALSE;

  with pat do
  begin
    tblClients.First;

    while (not tblClients.Eof) AND (bCheckExistStd = FALSE) do
    begin
      if (edtIDStd.Text = tblClients['ID']) AND (tblClients['ID'] <> sIDStd) then
      begin
        Result := FALSE;
        bCheckExistStd := TRUE;
        sMessageStd := 'ID Number already exists';
        edtIDStd.SetFocus;
      end

      else
        Result := TRUE;

      tblClients.Next;
    end; //while

  end;

end;

{Checks if there are no errors in the information the user entered. Helps when
 updating the info into the database}
function TfrmStdUser.CheckStd: Boolean;
begin
  if ((lblNameErrorStd.Caption = '') AND (lblSurnameErrorStd.Caption = '') AND
      (lblIDErrorStd.Caption = '') AND (lblEmailErrorStd.Caption = '') AND
      (lblCellErrorStd.Caption = '') AND
      ((lblPasswordErrorStd.Caption <> 'Too Short') OR
      (lblPasswordErrorStd.Caption <> 'Too Long'))) AND
     ((edtNameStd.Text <> 'First Name') AND
      (edtSurnameStd.Text <> 'Surname') AND (edtIDStd.Text <> 'ID Number') AND
      (edtEmailStd.Text <> 'Email') AND (edtCellStd.Text <> 'Cell Number') AND
      (edtPasswordStd.Text <> 'Password')) then
  begin
    Result := TRUE;
  end

  else
    Result := FALSE;

end;

procedure TfrmStdUser.edtCellStdChange(Sender: TObject);
begin
  sCell := edtCellStd.Text;

  frmRegister.Cell(sCell);

  lblCellErrorStd.Caption := sCellE;
  lblCellErrorStd.Left := iCellL;
  edtCellStd.Font.Color := StringToColor(sCellC);

end;

procedure TfrmStdUser.edtEmailStdChange(Sender: TObject);
begin
  sEmail := edtEmailStd.Text;

  frmRegister.Email(sEmail);

  lblEmailErrorStd.Caption := sEmailE;
  edtEmailStd.Font.Color := StringToColor(sEmailC);
end;

procedure TfrmStdUser.edtIDStdChange(Sender: TObject);
begin
  sID := edtIDStd.Text;

  frmRegister.ID(sID);

  lblIDErrorStd.Caption := sIDE;
  edtIDStd.Font.Color := StringToColor(sIDC);
end;

procedure TfrmStdUser.edtNameStdChange(Sender: TObject);
begin
  sName := edtNameStd.Text;
  sForm := 'Standard';

  frmRegister.Name(sName);

  lblNameErrorStd.Caption := sNameE;
  lblNameErrorStd.Left := iNameL;
  edtNameStd.Font.Color := StringToColor(sNameC);
end;

procedure TfrmStdUser.edtPasswordStdChange(Sender: TObject);
begin
  sPassword := edtPasswordStd.Text;

  frmRegister.Password(sPassword);

  lblPasswordErrorStd.Caption := sPasswordE;
  lblPasswordErrorStd.Left := iPasswordL;
  lblPasswordErrorStd.Font.Color := StringToColor(sPasswordEC);
  edtPasswordStd.Font.Color := StringToColor(sPasswordC);
end;

procedure TfrmStdUser.edtSurnameStdChange(Sender: TObject);
begin
  sSurname := edtSurnameStd.Text;
  sForm := 'Standard';

  frmRegister.Surname(sSurname);

  lblSurnameErrorStd.Caption := sSurnameE;
  edtSurnameStd.Font.Color := StringToColor(sSurnameC);

end;

procedure TfrmStdUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmStdUser.FormShow(Sender: TObject);
var
  tFile: TextFile;
  sEmail: ShortString;

begin
  AssignFile(tFile, 'TEMP.txt');
  Reset(tFile);
  Readln(tFile, sEmail);
  CloseFile(tFile);

  lblSaveStd.Width := 290;
  lblMakeNewBooking.Width := 290;
  lblDeleteStd.Width := 290;

  redReviewStd.Lines.Clear;

  if bCreate = False then
  begin
    pat.tblClients.First;

    while not pat.tblClients.Eof do
    begin
      if sEmail = pat.tblClients['Email'] then
      begin
        edtNameStd.Text := pat.tblClients['FirstNames'];
        edtSurnameStd.Text := pat.tblClients['Surname'];
        edtIDStd.Text := pat.tblClients['ID'];
        edtEmailStd.Text := pat.tblClients['Email'];
        edtCellStd.Text := pat.tblClients['CellNo'];
        edtPasswordStd.Text := pat.tblClients['Password'];
        begin
          redReviewStd.Lines.Clear;
          lblReviewErrorStd.Caption := '';
        end;

        if pat.tblClients['Vegetarian'] = True then
        begin
          chkVegStd.Checked := True;
        end;

        if pat.tblClients['WheelchairAccess'] = True then
        begin
          chkWheelChairStd.Checked := True;
        end;

        pat.tblBookings.First;

        while not pat.tblBookings.Eof do
        begin

          if pat.tblBookings['ClientCode'] = pat.tblClients['ClientCode'] then
          begin

            edtBookingIDStd.Text := pat.tblBookings['BookingID'];
            edtRoomNumStd.Text := pat.tblBookings['RoomID'];

            if pat.tblBookings['Paid'] = True then
              edtAmtPaidStd.Text := 'Paid'

            else
              edtAmtPaidStd.Text := 'Not Paid';

            edtAmtDueStd.Text := FloatToStrF(pat.tblBookings['TotalDue'], ffCurrency, 8, 2);
            edtNumOfDays.Text := pat.tblBookings['NumOfNights'];
            edtStartDate.Text := DateToStr(pat.tblBookings['StartDate']) + ' - ' +
                                 DateToStr(pat.tblBookings['EndDate']);

          end;//if client code

          pat.tblBookings.Next;
        end; //while tblBookings
      end;

      pat.tblClients.Next;
    end;
  end;

  sIDStd := edtIDStd.Text;
  sEmailStd := edtEmailStd.Text;

  iEasterEggCount := 0;

  redReviewStd.Height := 284;
  btnSaveReview.Visible := False;

  iPosV := 1;

  bExist := False;
  frmHistory.getClientCode;
  frmHistory.checkBooking;

  if bExist = True then
  begin
    imgHistory.Visible := True;
    ShapeHistory.Visible := True;
  end

  else
  begin
    imgHistory.Visible := False;
    ShapeHistory.Visible := False;
    edtBookingIDStd.Text := '-';
    edtRoomNumStd.Text := '-';
    edtAmtPaidStd.Text := '-';
    edtAmtDueStd.Text := '-';
    edtNumOfDays.Text := '-';
    edtStartDate.Text := '-';
  end;
end;

procedure TfrmStdUser.imgBackClick(Sender: TObject);
var
  iSure : ShortInt;

begin
  if bAdmin = True then
  begin
    Self.Hide;
    frmAdmin.Show;
  end

  else
  begin
    iSure := MessageDlg('Are you sure you want to logout?', mtConfirmation, mbYesNo, 0);

    if iSure = mrYes then
    begin
      Self.Hide;
      frmLogin.Show;
    end;
  end;
end;

procedure TfrmStdUser.imgBackMouseEnter(Sender: TObject);
begin
  ShapeBackStd.Visible := True;
end;

procedure TfrmStdUser.imgBackMouseLeave(Sender: TObject);
begin
  ShapeBackStd.Visible := False;
end;

procedure TfrmStdUser.imgHelpStdClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'Standard';
  frmHelp.Show;
end;

procedure TfrmStdUser.imgHelpStdMouseEnter(Sender: TObject);
begin
  ShapeHelpStd.Brush.Color := $00864D00;
end;

procedure TfrmStdUser.imgHelpStdMouseLeave(Sender: TObject);
begin
  ShapeHelpStd.Brush.Color := clSilver;
end;

procedure TfrmStdUser.imgHistoryClick(Sender: TObject);
begin
  Self.Hide;
  frmHistory.Show;
end;

procedure TfrmStdUser.imgHistoryMouseEnter(Sender: TObject);
begin
  ShapeHistory.Brush.Color := clHighlight;
end;

procedure TfrmStdUser.imgHistoryMouseLeave(Sender: TObject);
begin
  ShapeHistory.Brush.Color := $00864D00;
end;

procedure TfrmStdUser.imgVisibleStdClick(Sender: TObject);
begin
  if edtPasswordStd.Text = 'Password' then
  begin
    //Do nothing
  end

  else if edtPasswordStd.PasswordChar = '*' then
  begin
    imgVisibleStd.Picture.LoadFromFile('Images\Visible Off.png');
    edtPasswordStd.PasswordChar := #0;
  end

  else
  begin
    imgVisibleStd.Picture.LoadFromFile('Images\Visible On.png');
    edtPasswordStd.PasswordChar := '*';
  end;
end;

procedure TfrmStdUser.imgVisibleStdMouseEnter(Sender: TObject);
begin
  ShapeVisibleStd.Visible := True;
end;

procedure TfrmStdUser.imgVisibleStdMouseLeave(Sender: TObject);
begin
  ShapeVisibleStd.Visible := False;
end;

procedure TfrmStdUser.lblContactUsLoginClick(Sender: TObject);
begin
  Self.Hide;
  iForm := 0;
  frmContactDetails.Show;
end;

procedure TfrmStdUser.lblContactUsLoginMouseEnter(Sender: TObject);
begin
  lblContactUsLogin.Font.Color := clSilver;
  lblContactUsLogin.Font.Style := [fsUnderline];
end;

procedure TfrmStdUser.lblContactUsLoginMouseLeave(Sender: TObject);
begin
  lblContactUsLogin.Font.Color := clWhite;
  lblContactUsLogin.Font.Style := [];
end;

procedure TfrmStdUser.lblDeleteStdClick(Sender: TObject);
var
  iBtnSelected: Integer;

begin
  iBtnSelected:= MessageDlg('Are you sure you want to deactivate your account?',
                            mtConfirmation, mbOKCancel, 0);

  if iBtnSelected = mrOk then
  begin
    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if tblClients['ID'] = sIDStd then
        begin
          tblClients.Edit;
          tblClients['Activated'] := False;
        end;

        tblClients.Next;
      end; //while clients

    end;  //with pat

    MessageDlg('Account Deactivated. If you wish to re-activate please contact us.', mtInformation, [mbOK], 0);
    Self.Hide;
    frmLogin.Show;
  end  //if

  else
  begin
    MessageDlg('Cancelled', mtInformation, [mbOK], 0);
  end;

end;

procedure TfrmStdUser.lblDeleteStdMouseEnter(Sender: TObject);
begin
  ShapeDeleteStd.Brush.Color := $000606FF;
end;

procedure TfrmStdUser.lblDeleteStdMouseLeave(Sender: TObject);
begin
  ShapeDeleteStd.Brush.Color := $000000BB;
end;

procedure TfrmStdUser.lblMakeNewBookingClick(Sender: TObject);
begin
  bLogin := True;

  Self.Hide;
  frmPickDate.Show;
end;

procedure TfrmStdUser.lblMakeNewBookingMouseEnter(Sender: TObject);
begin
  ShapeMakeNewBooking.Brush.Color := clHighlight;
end;

procedure TfrmStdUser.lblMakeNewBookingMouseLeave(Sender: TObject);
begin
  ShapeMakeNewBooking.Brush.Color := $00864D00;
end;

procedure TfrmStdUser.lblSaveStdClick(Sender: TObject);
begin
 if (CheckStd = TRUE) AND (CheckExistStd = TRUE) then
  begin
    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if tblClients['ID'] = sIDStd then
        begin
          tblClients.Edit;

          tblClients['FirstNames'] := edtNameStd.Text;
          tblClients['Surname'] := edtSurnameStd.Text;
          tblClients['ID'] := edtIDStd.Text;
          tblClients['Email'] := edtEmailStd.Text;
          tblClients['CellNo'] := edtCellStd.Text;
          tblClients['Password'] := edtPasswordStd.Text;

          if chkVegStd.Checked then
            tblClients['Vegetarian'] := TRUE

          else
            tblClients['Vegetarian'] := FALSE;

          if chkWheelChairStd.Checked then
            tblClients['WheelchairAccess'] := TRUE

          else
            tblClients['WheelchairAccess'] := FALSE;

          tblClients.Post;
          tblClients.Refresh;

          MessageDlg('Account updated successfully', mtConfirmation, [mbOK], 0);

          sIDStd := edtIDStd.Text;
          sEmailStd := edtEmailStd.Text;
        end;

        tblClients.Next;
      end;

    end;
  end

  else if CheckExistStd = FALSE then
  begin
    MessageDlg(sMessageStd, mtError, [mbOK], 0);
  end

  else
  begin
    MessageDlg('Please make sure all details entered correctly', mtError,
      [mbOK], 0);
  end;
end;

procedure TfrmStdUser.lblSaveStdMouseEnter(Sender: TObject);
begin
  ShapeSaveStd.Brush.Color := clHighlight;
end;

procedure TfrmStdUser.lblSaveStdMouseLeave(Sender: TObject);
begin
  ShapeSaveStd.Brush.Color := $00864D00;
end;

procedure TfrmStdUser.redReviewStdChange(Sender: TObject);
begin
  Review(redReviewStd.Text);

  lblReviewErrorStd.Caption := sReviewE;
  redReviewStd.Font.Color := StringToColor(sReviewC);

  if redReviewStd.Font.Color = clRed then
  begin
    redReviewStd.Height := 284;
    btnSaveReview.Visible := False;
  end

  else
  begin
    redReviewStd.Height := 250;
    btnSaveReview.Visible := True;
    btnSaveReview.Caption := 'Verify';
  end;
end;

procedure TfrmStdUser.Review(sReview: string);
begin
  if Length(sReview) > 255 then
  begin
    sReviewE := 'Max Characters: 255';
    sReviewC := 'clRed';
  end

  else
  begin
    sReviewE := '';
    sReviewC := '$00864D00';
  end;
end;

end.
