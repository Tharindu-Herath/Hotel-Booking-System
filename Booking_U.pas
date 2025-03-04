unit Booking_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, Spin, pngimage,
  clsValidation;

type
  TfrmBooking = class(TForm)
    lblBookingText: TLabel;
    grpbBookingDetails: TGroupBox;
    lblBookingID: TLabel;
    lblABookingID: TLabel;
    lblARoomFloor: TLabel;
    lblRoomFloor: TLabel;
    lblRoomNumber: TLabel;
    lblARoomNo: TLabel;
    lblPricePerNight: TLabel;
    lblAPPN: TLabel;
    lblRoomDesc: TLabel;
    redDesc: TRichEdit;
    lblStart: TLabel;
    lblTotalDue: TLabel;
    lblATotalDue: TLabel;
    imgBookingBack: TImage;
    lblEnd: TLabel;
    lblNumDays: TLabel;
    lblAEndDate: TLabel;
    btnBook: TButton;
    ShapeBook: TShape;
    Shape1: TShape;
    lblMakePayment: TLabel;
    Shape2: TShape;
    imgLogo: TImage;
    imgBackBooking: TImage;
    ShapeBackBooking: TShape;
    lblANumDays: TLabel;
    lblAStartDate: TLabel;
    lblDetails: TLabel;
    lblCardHolder: TLabel;
    lblCardNo: TLabel;
    lblCVV: TLabel;
    lblExpiryDate: TLabel;
    edtCardholder: TEdit;
    edtCardNumber: TEdit;
    edtCVV: TEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    lblDash: TLabel;
    edtExpiryDateMonth: TEdit;
    edtExpiryDateYear: TEdit;
    imgHelpBooking: TImage;
    ShapeHelpBooking: TShape;
    imgMasterCard: TImage;
    procedure ResetBooking;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBookClick(Sender: TObject);
    procedure imgBackBookingMouseEnter(Sender: TObject);
    procedure imgBackBookingMouseLeave(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure edtCardNumberChange(Sender: TObject);
    procedure edtExpiryDateMonthClick(Sender: TObject);
    procedure edtExpiryDateYearClick(Sender: TObject);
    procedure edtCVVClick(Sender: TObject);
    procedure edtCardNumberClick(Sender: TObject);
    procedure edtCardholderClick(Sender: TObject);
    procedure edtExpiryDateMonthChange(Sender: TObject);
    procedure edtExpiryDateYearChange(Sender: TObject);
    procedure edtCVVChange(Sender: TObject);
    procedure edtCardholderChange(Sender: TObject);
    procedure imgBackBookingClick(Sender: TObject);
    procedure redDescSelectionChange(Sender: TObject);
    procedure imgHelpBookingMouseEnter(Sender: TObject);
    procedure imgHelpBookingMouseLeave(Sender: TObject);
    procedure imgHelpBookingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }   
    procedure Exp;
    procedure CheckError;
  end;

var
  frmBooking: TfrmBooking;

  objValidate: TValidate;

  bCardholder, bCardNumber, bExpM, bExpY, bCVV : Boolean;
  objVal : TValidate;

implementation

uses
  dm, SleepnSnore_U, Login_U, Help_U, StandardUser_U;

{$R *.dfm}

procedure TfrmBooking.btnBookClick(Sender: TObject);
var
  iClientCode : Integer;
  iBook : ShortInt;

begin
  iBook := MessageDlg('Confirm booking for Room ' + lblARoomNo.Caption + ' from ' +
           lblAStartDate.Caption + ' to ' + lblAEndDate.Caption +
           ' at ' + lblATotalDue.Caption + #13 +
           '(Booking ID: ' + lblABookingID.Caption + ')', mtConfirmation, mbYesNo, 0);

  iClientCode := 0;

  if iBook = mrYes then
  begin
    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if sEmailLogin = tblClients['Email'] then
        begin
          iClientCode := tblClients['ClientCode'];
        end;

        tblClients.Next;
      end;

      tblBookings.Insert;

      tblBookings['ClientCode'] := iClientCode;
      tblBookings['RoomID'] := StrToInt(sRoomID);
      tblBookings['NumOfNights'] := StrToInt(lblANumDays.Caption);
      tblBookings['TotalDue'] := lblATotalDue.Caption;
      tblBookings['StartDate'] := StrToDate(lblAStartDate.Caption);
      tblBookings['EndDate'] := lblAEndDate.Caption;
      tblBookings['Paid'] := True;


      tblBookings.Post;
      tblBookings.Refresh;
    end;  //with pat

    MessageDlg('Payment Successful. You can see your booking details on your account page.', mtInformation, [mbOK], 0);

    Self.Hide;
    frmSleepnSnore.Enabled := True;
    frmSleepnSnore.Hide;
    frmStdUser.Show;
    //__________________________________________________________________________
  end

  else
  begin
    MessageDlg('Booking Cancelled', mtInformation, [mbOK], 0)
  end;

end;

{Procedure to check if there are any errors in the data the user entered.
 Boolean values are used and are updated on the OnChange event of that component}
procedure TfrmBooking.CheckError;
begin
  if (bCardholder = True) AND (bCardNumber = True) AND (bCVV = True) AND
     (bExpM = True) AND (bExpY = True) then
  begin
    btnBook.Visible := True;
    ShapeBook.Visible := True;
  end

  else
  begin
    btnBook.Visible := False;
    ShapeBook.Visible := False;
  end;
end;

procedure TfrmBooking.edtCardholderChange(Sender: TObject);
begin
  if objValidate.validWordNoLength(edtCardholder.Text) = TRUE then
  begin
    edtCardholder.Font.Color := clWhite;
    edtCardholder.Hint := '';
    bCardholder := True;
  end

  else
  begin
    edtCardholder.Font.Color := clRed;
    edtCardholder.Hint := 'Letters only';
    bCardholder := False;
  end;

  CheckError;
end;

procedure TfrmBooking.edtCardholderClick(Sender: TObject);
begin
  Exp;
end;

{Validates the Card (MasterCard) the user entered}
procedure TfrmBooking.edtCardNumberChange(Sender: TObject);
begin
  if Length(edtCardNumber.Text) > 0 then
  begin
    if (Length(edtCardNumber.Text) = 16) AND (edtCardNumber.Text[1] = '5') AND 
       ((edtCardNumber.Text[2] = '0') OR (edtCardNumber.Text[2] = '1') OR
        (edtCardNumber.Text[2] = '2') OR (edtCardNumber.Text[2] = '3') OR
        (edtCardNumber.Text[2] = '4') OR (edtCardNumber.Text[2] = '5')) then
    begin
      edtCardNumber.Font.Color := clWhite;
      edtCardNumber.Hint := '';       
      bCardNumber := True;
    end

    else
    begin
      edtCardNumber.Font.Color := clRed;   
      edtCardNumber.Hint := 'Invalid Format';
      bCardNumber := False;
    end;
  end;

  CheckError;
end;

procedure TfrmBooking.edtCardNumberClick(Sender: TObject);
begin
  Exp;
end;

procedure TfrmBooking.edtCVVChange(Sender: TObject);
begin
  if objVal.digitsOnly(edtCVV.Text, 3) = True then
  begin
    edtCVV.Font.Color := clWhite;
    edtCVV.Hint := '';       
    bCVV := True;
  end

  else
  begin
    edtCVV.Font.Color := clRed;   
    edtCVV.Hint := 'Invalid Format';
    bCVV := False;    
  end;

  CheckError;
end;

procedure TfrmBooking.edtCVVClick(Sender: TObject);
begin
  Exp;
end;

procedure TfrmBooking.edtExpiryDateMonthChange(Sender: TObject);
begin
  if (edtExpiryDateMonth.Text <> '') AND (edtExpiryDateMonth.Text <> 'MM') then
  begin
    if StrToInt(edtExpiryDateMonth.Text) > 12 then
    begin
      edtExpiryDateMonth.Font.Color := clRed;
      bExpM := False;
    end

    else
    begin
      edtExpiryDateMonth.Font.Color := clWhite;
      bExpM := True;
    end;
  end;

  CheckError;
end;

procedure TfrmBooking.edtExpiryDateMonthClick(Sender: TObject);
begin
  Exp;

  if edtExpiryDateMonth.Text = 'MM' then
  begin
    edtExpiryDateMonth.NumbersOnly := False;
    edtExpiryDateMonth.Text := '';
    edtExpiryDateMonth.Font.Color := clWhite;
    edtExpiryDateMonth.NumbersOnly := True;
  end;
end;

procedure TfrmBooking.edtExpiryDateYearChange(Sender: TObject);
var
  tCurrentYear : TDate;
  sYear : ShortString;

begin
  tCurrentYear := Now;
  sYear := DateToStr(tCurrentYear);
  sYear := sYear[3] + sYear[4];

  if (edtExpiryDateYear.Text <> '') AND (edtExpiryDateYear.Text <> 'YY') then
    begin
    if (StrToInt(edtExpiryDateYear.Text) < StrToInt(sYear)) OR
       (StrToInt(edtExpiryDateYear.Text) > StrToInt(sYear) + 5) then
    begin
      edtExpiryDateYear.Font.Color := clRed;
      bExpY := False;
    end

    else
    begin
      edtExpiryDateYear.Font.Color := clWhite;
      bExpY := True;
    end;
  end;

  CheckError;
end;

procedure TfrmBooking.edtExpiryDateYearClick(Sender: TObject);
begin
 Exp;

  if edtExpiryDateYear.Text = 'YY' then
  begin
    edtExpiryDateYear.NumbersOnly := False;
    edtExpiryDateYear.Text := '';
    edtExpiryDateYear.Font.Color := clWhite;
    edtExpiryDateYear.NumbersOnly := True;
  end;
end;

procedure TfrmBooking.Exp;
begin
  if edtExpiryDateMonth.Text = '' then
  begin
    edtExpiryDateMonth.NumbersOnly := False;
    edtExpiryDateMonth.Text := 'MM';
    edtExpiryDateMonth.Font.Color := $00D4D4D4;
    edtExpiryDateMonth.NumbersOnly := True;
  end;

  if edtExpiryDateYear.Text = '' then
  begin
    edtExpiryDateYear.NumbersOnly := False;
    edtExpiryDateYear.Text := 'YY';
    edtExpiryDateYear.Font.Color := $00D4D4D4;
    edtExpiryDateYear.NumbersOnly := True;
  end;
end;

procedure TfrmBooking.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmSleepnSnore.Enabled := True;
  frmSleepnSnore.Show;
end;

procedure TfrmBooking.FormShow(Sender: TObject);
begin                      
  Timer1.Enabled := True;
  
  pat.tblBookings.Last;
  lblABookingID.Caption := IntToStr(pat.tblBookings['BookingID'] + 1);

  lblAStartDate.Caption := '';
  lblANumDays.Caption := '';
  lblAEndDate.Caption := '';
  lblATotalDue.Caption := '';

  edtCardholder.Text := '';
  edtCardNumber.Text := '';
  edtCVV.Text := '';
  edtExpiryDateMonth.NumbersOnly := False;
  edtExpiryDateMonth.Text := 'MM';
  edtExpiryDateYear.NumbersOnly := False;
  edtExpiryDateYear.Text := 'YY';

  btnBook.Visible := False;
  ShapeBook.Visible := False;

  bCardNumber := False;
  bExpM := False;
  bExpY := False;

  edtCardholder.SetFocus;
end;

procedure TfrmBooking.imgBackBookingClick(Sender: TObject);
begin
  Self.Hide;
  frmSleepnSnore.Enabled := True;
  frmSleepnSnore.Show;
end;

procedure TfrmBooking.imgBackBookingMouseEnter(Sender: TObject);
begin
  ShapeBackBooking.Visible := True;
end;

procedure TfrmBooking.imgBackBookingMouseLeave(Sender: TObject);
begin
  ShapeBackBooking.Visible := False;
end;

procedure TfrmBooking.imgHelpBookingClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'Booking';
  frmHelp.Show;
end;

procedure TfrmBooking.imgHelpBookingMouseEnter(Sender: TObject);
begin
  ShapeHelpBooking.Brush.Color := $00A45B75;
end;

procedure TfrmBooking.imgHelpBookingMouseLeave(Sender: TObject);
begin
  ShapeHelpBooking.Brush.Color := clSilver;
end;

procedure TfrmBooking.redDescSelectionChange(Sender: TObject);
begin
  redDesc.SelLength := 0;
end;

procedure TfrmBooking.ResetBooking;
begin
  lblAStartDate.Caption := '';
  lblANumDays.Caption := '';
  lblAEndDate.Caption := '';
  lblATotalDue.Caption := '';  
end;

procedure TfrmBooking.Timer1Timer(Sender: TObject);
begin
  lblMakePayment.Font.Color := clRed;

  Timer1.Enabled := False;
  Timer2.Enabled := True;
end;

procedure TfrmBooking.Timer2Timer(Sender: TObject);
begin
  lblMakePayment.Font.Color := clWhite;

  Timer2.Enabled := False;
end;

end.
