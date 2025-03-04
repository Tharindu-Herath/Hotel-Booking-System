unit PalmWoods_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, pngimage, Spin;

type
  TfrmPalmWoods = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    grpbLevel1: TGroupBox;
    ShapeR2L1: TShape;
    ShapeR3L1: TShape;
    imgR3L1: TImage;
    ShapeR4L1: TShape;
    ShapeR1L1: TShape;
    imgR1L1: TImage;
    imgR2L1: TImage;
    lblR1L1: TLabel;
    imgR4L1: TImage;
    lblR2L1: TLabel;
    lblR4L1: TLabel;
    lblR3L1: TLabel;
    pnlR3L1: TPanel;
    lblPriceR3L1: TLabel;
    lblAvailR3L1: TLabel;
    lblFloorR3L1: TLabel;
    btnBookR3L1: TButton;
    pnlR2L1: TPanel;
    lblPriceR2L1: TLabel;
    lblAvailR2L1: TLabel;
    lblFloorR2L1: TLabel;
    btnBookR2L1: TButton;
    pnlR1L1: TPanel;
    lblPriceR1L1: TLabel;
    lblAvailR1L1: TLabel;
    lblFloorR1L1: TLabel;
    btnBookR1L1: TButton;
    pnlR4L1: TPanel;
    lblPriceR4L1: TLabel;
    lblAvailR4L1: TLabel;
    lblFloorR4L1: TLabel;
    btnBookR4L1: TButton;
    lblLevel1: TLabel;
    lblLevel2: TLabel;
    ShapeLine: TShape;
    ShapeBackStd: TShape;
    imgBack: TImage;
    ShapeL1: TShape;
    ShapeL2: TShape;
    imgAcc: TImage;
    grpbAcc: TGroupBox;
    lblAcc: TLabel;
    grpbSignIn: TGroupBox;
    lblSignIn: TLabel;
    lblSignUp: TLabel;
    ShapeDivider: TShape;
    redDescR1L1: TRichEdit;
    imgBackground: TImage;
    redDescR3L1: TRichEdit;
    redDescR2L1: TRichEdit;
    redDescR4L1: TRichEdit;
    imgLogo: TImage;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape2: TShape;
    Shape5: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape6: TShape;
    grpbLevel2: TGroupBox;
    Shape9: TShape;
    Shape13: TShape;
    ShapeR1L2: TShape;
    Shape14: TShape;
    Shape16: TShape;
    Shape15: TShape;
    Shape10: TShape;
    Shape12: TShape;
    Shape11: TShape;
    ShapeR2L2: TShape;
    ShapeR3L2: TShape;
    imgR3L2: TImage;
    ShapeR4L2: TShape;
    imgR1L2: TImage;
    imgR2L2: TImage;
    lblR1L2: TLabel;
    imgR4L2: TImage;
    lblR2L2: TLabel;
    lblR4L2: TLabel;
    lblR3L2: TLabel;
    pnlR3L2: TPanel;
    lblPriceR3L2: TLabel;
    lblAvailR3L2: TLabel;
    lblFloorR3L2: TLabel;
    btnBookR3L2: TButton;
    redDescR3L2: TRichEdit;
    pnlR2L2: TPanel;
    lblPriceR2L2: TLabel;
    lblAvailR2L2: TLabel;
    lblFloorR2L2: TLabel;
    btnBookR2L2: TButton;
    redDescR2L2: TRichEdit;
    pnlR1L2: TPanel;
    lblPriceR1L2: TLabel;
    lblAvailR1L2: TLabel;
    lblFloorR1L2: TLabel;
    btnBookR1L2: TButton;
    redDescR1L2: TRichEdit;
    pnlR4L2: TPanel;
    lblPriceR4L2: TLabel;
    lblAvailR4L2: TLabel;
    lblFloorR4L2: TLabel;
    btnBookR4L2: TButton;
    redDescR4L2: TRichEdit;
    DateTimePickerStart: TDateTimePicker;
    lblStart: TLabel;
    lblNumDays: TLabel;
    spnNumDays: TSpinEdit;
    imgHelpPalmWoods: TImage;
    ShapeHelpPalmWoods: TShape;
    btnLogout: TButton;
    Shape_5: TShape;
    Shape_7: TShape;
    Shape_6: TShape;
    Shape_8: TShape;
    Shape_1: TShape;
    Shape_3: TShape;
    Shape_2: TShape;
    Shape_4: TShape;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure imgR1L1MouseEnter(Sender: TObject);
    procedure TabSheet1MouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgR2L1MouseEnter(Sender: TObject);
    procedure imgR3L1MouseEnter(Sender: TObject);
    procedure imgR4L1MouseEnter(Sender: TObject);
    procedure lblLevel1Click(Sender: TObject);
    procedure lblLevel2Click(Sender: TObject);
    procedure grpbLevel1MouseEnter(Sender: TObject);
    procedure lblSignInMouseEnter(Sender: TObject);
    procedure lblSignInMouseLeave(Sender: TObject);
    procedure lblSignUpMouseEnter(Sender: TObject);
    procedure lblSignUpMouseLeave(Sender: TObject);
    procedure imgBackClick(Sender: TObject);
    procedure lblSignInClick(Sender: TObject);
    procedure lblSignUpClick(Sender: TObject);
    procedure FormMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBackMouseEnter(Sender: TObject);
    procedure imgBackMouseLeave(Sender: TObject);
    procedure ShapeBackStdMouseEnter(Sender: TObject);
    procedure imgBackgroundMouseEnter(Sender: TObject);
    procedure imgLogoMouseEnter(Sender: TObject);
    procedure btnBookR1L1Click(Sender: TObject);
    procedure btnBookR3L1Click(Sender: TObject);
    procedure btnBookR2L1Click(Sender: TObject);
    procedure btnBookR4L1Click(Sender: TObject);
    procedure imgR1L2MouseEnter(Sender: TObject);
    procedure imgR2L2MouseEnter(Sender: TObject);
    procedure imgR4L2MouseEnter(Sender: TObject);
    procedure imgR3L2MouseEnter(Sender: TObject);
    procedure grpbLevel2MouseEnter(Sender: TObject);
    procedure btnBookR1L2Click(Sender: TObject);
    procedure btnBookR2L2Click(Sender: TObject);
    procedure btnBookR3L2Click(Sender: TObject);
    procedure btnBookR4L2Click(Sender: TObject);
    procedure imgAccClick(Sender: TObject);
    procedure DateTimePickerStartChange(Sender: TObject);
    procedure spnNumDaysChange(Sender: TObject);
    procedure lblContactUsPalmWoodsClick(Sender: TObject);
    procedure imgHelpPalmWoodsMouseEnter(Sender: TObject);
    procedure imgHelpPalmWoodsMouseLeave(Sender: TObject);
    procedure redDescR1L1SelectionChange(Sender: TObject);
    procedure redDescR2L1SelectionChange(Sender: TObject);
    procedure redDescR3L1SelectionChange(Sender: TObject);
    procedure redDescR4L1SelectionChange(Sender: TObject);
    procedure redDescR1L2SelectionChange(Sender: TObject);
    procedure redDescR2L2SelectionChange(Sender: TObject);
    procedure redDescR3L2SelectionChange(Sender: TObject);
    procedure redDescR4L2SelectionChange(Sender: TObject);
    procedure imgHelpPalmWoodsClick(Sender: TObject);
    procedure lblLevel1MouseEnter(Sender: TObject);
    procedure lblLevel2MouseEnter(Sender: TObject);
    procedure lblLevel2MouseLeave(Sender: TObject);
    procedure lblLevel1MouseLeave(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CloseAll;
    procedure OpenBooking;
    procedure CheckAvailable;

{Procedures to set corresponding room to Available}
    procedure R1A;
    procedure R2A;
    procedure R3A;
    procedure R4A;
    procedure R5A;
    procedure R6A;
    procedure R7A;
    procedure R8A;

{Procedures to set corresponding room to Not Available}
    procedure R1NA;
    procedure R2NA;
    procedure R3NA;
    procedure R4NA;
    procedure R5NA;
    procedure R6NA;
    procedure R7NA;
    procedure R8NA;
  end;

var
  frmPalmWoods: TfrmPalmWoods;

  bMainHelp : Boolean;
  bR1L1, bR2L1, bR3L1, bR4L1, bR1L2, bR2L2, bR3L2, bR4L2, bLogin,
  bRoomAvail : Boolean;

  iNumdays : ShortInt;

  sRoomID, sRoomFloor, sRoomDesc : string;

  rPrice : Real;

implementation

uses
  dm, Login_U, StandardUser_U, CreateAccount_U, Booking_U, PickDate_U,
  ContactDetails_U, Help_U;

{$R *.dfm}

procedure TfrmPalmWoods.btnBookR1L1Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR1L1.Caption = 'Available' then
  begin
    sRoomID := '1';
    sRoomFloor := '1';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR1L2Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR1L2.Caption = 'Available' then
  begin
    sRoomID := '5';
    sRoomFloor := '2';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR2L1Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR2L1.Caption = 'Available' then
  begin
    sRoomID := '2';
    sRoomFloor := '1';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR2L2Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR2L2.Caption = 'Available' then
  begin
    sRoomID := '6';
    sRoomFloor := '2';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR3L1Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR3L1.Caption = 'Available' then
  begin
    sRoomID := '3';
    sRoomFloor := '1';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR3L2Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR3L2.Caption = 'Available' then
  begin
    sRoomID := '7';
    sRoomFloor := '2';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR4L1Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR4L1.Caption = 'Available' then
  begin
    sRoomID := '4';
    sRoomFloor := '1';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnBookR4L2Click(Sender: TObject);
begin
  CloseAll;

  if lblAvailR4L2.Caption = 'Available' then
  begin
    sRoomID := '8';
    sRoomFloor := '2';
    OpenBooking;
  end

  else
    MessageDlg('Sorry, room not available. Please select a different room', mtInformation, [mbOK], 0);

end;

procedure TfrmPalmWoods.btnLogoutClick(Sender: TObject);
var
  iSure : ShortInt;

begin
  iSure := MessageDlg('Are you sure you want to logout?', mtConfirmation, mbYesNo, 0);

  if iSure = mrYes then
  begin
    Self.Hide;
    frmLogin.Show;
  end;
end;

{Checks if rooms are available by using the start date and number of days the user
 entered and looping through the bookings table to see if there is a booking during
 that period}
procedure TfrmPalmWoods.CheckAvailable;
var
  iCountBookings : Integer;
  I : ShortInt;

begin
  with pat do
  begin
    for I := 1 to 8 do
    begin
      tblBookings.First;
      iCountBookings := 0;

      while not tblBookings.Eof do
      begin
        if (tblBookings['RoomID'] = I) AND (tblBookings['EndDate'] > Now) then
        begin
          Inc(iCountBookings);

          if (tStartDate > tblBookings['EndDate']) OR
             ((tStartDate < tblBookings['StartDate']) AND
              (tStartDate + iNumDays < tblBookings['StartDate'])) then
          begin
            case I of
            1: R1A;
            2: R2A;
            3: R3A;
            4: R4A;
            5: R5A;
            6: R6A;
            7: R7A;
            8: R8A;
            end;
          end

          else
          begin
            case I of
            1: R1NA;
            2: R2NA;
            3: R3NA;
            4: R4NA;
            5: R5NA;
            6: R6NA;
            7: R7NA;
            8: R8NA;
            end;
          end;

        end; //if RoomID = I & if that booking finished

        tblBookings.Next;
      end; //while not bookings.eof

      if iCountBookings = 0 then
      begin
        case I of
        1: R1A;
        2: R2A;
        3: R3A;
        4: R4A;
        5: R5A;
        6: R6A;
        7: R7A;
        8: R8A;
        end;
      end;

    end; //for each room

    tblRooms.First;

    while not tblRooms.Eof do
    begin
      if tblRooms['Available'] = False then
      begin
        case tblRooms['RoomID'] of
        1: R1NA;
        2: R2NA;
        3: R3NA;
        4: R4NA;
        5: R5NA;
        6: R6NA;
        7: R7NA;
        8: R8NA;
        end;
      end;

      tblRooms.Next;
    end;
  end; //with pat
end;

procedure TfrmPalmWoods.CloseAll;
begin
  bR1L1 := False;
  bR2L1 := False;
  bR3L1 := False;
  bR4L1 := False;
  bR1L2 := False;
  bR2L2 := False;
  bR3L2 := False;
  bR4L2 := False;

  Timer2.Enabled := True;
end;

procedure TfrmPalmWoods.DateTimePickerStartChange(Sender: TObject);
begin
  tStartDate := DateTimePickerStart.Date;
  frmPickDate.StartDate;
end;

procedure TfrmPalmWoods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPalmWoods.FormMouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.FormShow(Sender: TObject);
var
  tTemp: TextFile;
  sTemp: string;

begin
  Self.Enabled := True;

  redDescR1L1.Clear;
  redDescR2L1.Clear;
  redDescR3L1.Clear;
  redDescR4L1.Clear;
  redDescR1L2.Clear;
  redDescR2L2.Clear;
  redDescR3L2.Clear;
  redDescR4L2.Clear;

  if bLogin = True then
  begin
    grpbAcc.Visible := True;
    grpbSignIn.Visible := False;

    AssignFile(tTemp, 'TEMP.txt');
    Reset(tTemp);
    Readln(tTemp, sTemp);

    CloseFile(tTemp);

    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if tblClients['Email'] = sTemp then
        begin
          lblAcc.Caption := tblClients['FirstNames'] + ' ' + tblClients['Surname'];
        end;

        tblClients.Next;
      end;
    end;

  end  //if Logged in

  else
  begin
    grpbSignIn.Visible := True;
    grpbAcc.Visible :=  False;
  end;
//Sign In/Logged in

  pnlR1L1.Width := 0;
  pnlR2L1.Width := 0;
  pnlR3L1.Width := 0;
  pnlR4L1.Width := 0;
  pnlR1L2.Width := 0;
  pnlR2L2.Width := 0;
  pnlR3L2.Width := 0;
  pnlR4L2.Width := 0;

  DateTimePickerStart.Date := Now;
  spnNumDays.Value := 1;

  with pat do
  begin
    //Set Rooms
    tblRooms.First;

    while not tblRooms.Eof do
    begin
      //Level 1
      if (tblRooms['RoomID'] = 1) then
      begin
        lblPriceR1L1.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR1L1.Text := tblRooms['RoomDescrip'];
      end;
          //1

      if (tblRooms['RoomID'] = 2) then
      begin
        lblPriceR2L1.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR2L1.Text := tblRooms['RoomDescrip'];
      end;
          //2

      if (tblRooms['RoomID'] = 3) then
      begin
        lblPriceR3L1.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR3L1.Text := tblRooms['RoomDescrip'];
      end;
          //3

      if (tblRooms['RoomID'] = 4) then
      begin
        lblPriceR4L1.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR4L1.Text := tblRooms['RoomDescrip'];
      end;
          //4

      //Level 2
      if (tblRooms['RoomID'] = 5) then
      begin
        lblPriceR1L2.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR1L2.Text := tblRooms['RoomDescrip'];
      end;
          //5

      if (tblRooms['RoomID'] = 6) then
      begin
        lblPriceR2L2.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR2L2.Text := tblRooms['RoomDescrip'];
      end;
          //6

      if (tblRooms['RoomID'] = 7) then
      begin
        lblPriceR3L2.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR3L2.Text := tblRooms['RoomDescrip'];
      end;
          //7

      if (tblRooms['RoomID'] = 8) then
      begin
        lblPriceR4L2.Caption := 'Price Per Night: ' +
                                FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);
        redDescR4L2.Text := tblRooms['RoomDescrip'];
      end;
          //8

      tblRooms.Next;
    end;

  end;  //with pat

  lblFloorR1L1.Caption := 'Level 1';
  lblFloorR2L1.Caption := 'Level 1';
  lblFloorR3L1.Caption := 'Level 1';
  lblFloorR4L1.Caption := 'Level 1';
  lblFloorR1L2.Caption := 'Level 2';
  lblFloorR2L2.Caption := 'Level 2';
  lblFloorR3L2.Caption := 'Level 2';
  lblFloorR4L2.Caption := 'Level 2';

  DateTimePickerStart.Date := frmPickDate.DTPStartPick.Date;
  spnNumDays.Value := frmPickDate.spnNumDaysPick.Value;

  CheckAvailable;

  grpbLevel1.SetFocus;
end;

procedure TfrmPalmWoods.grpbLevel1MouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.grpbLevel2MouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.imgAccClick(Sender: TObject);
begin
  Self.Hide;
  frmStdUser.Show;
end;

procedure TfrmPalmWoods.imgBackClick(Sender: TObject);
begin
  if bLogin = True then
  begin
    Self.Hide;
    frmStdUser.Show;
  end

  else
  begin
    Self.Hide;
    frmLogin.Show;
  end;
end;

procedure TfrmPalmWoods.imgBackgroundMouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.imgBackMouseEnter(Sender: TObject);
begin
  ShapeBackStd.Visible := True;
  CloseAll;
end;

procedure TfrmPalmWoods.imgBackMouseLeave(Sender: TObject);
begin
  ShapeBackStd.Visible := False;
end;

procedure TfrmPalmWoods.imgHelpPalmWoodsClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'Palm Woods';
  frmHelp.Show;
end;

procedure TfrmPalmWoods.imgHelpPalmWoodsMouseEnter(Sender: TObject);
begin
  ShapeHelpPalmWoods.Brush.Color := $00408000;
end;

procedure TfrmPalmWoods.imgHelpPalmWoodsMouseLeave(Sender: TObject);
begin
  ShapeHelpPalmWoods.Brush.Color := clSilver;
end;

procedure TfrmPalmWoods.imgLogoMouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.imgR1L1MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR1L1 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR1L2MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR1L2 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR2L1MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR2L1 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR2L2MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR2L2 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR3L1MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR3L1 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR3L2MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR3L2 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR4L1MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR4L1 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.imgR4L2MouseEnter(Sender: TObject);
begin
  CloseAll;
  bR4L2 := True;
  Timer1.Enabled := True;
end;

procedure TfrmPalmWoods.lblContactUsPalmWoodsClick(Sender: TObject);
begin
  Self.Hide;
  iForm := 3;
  frmContactDetails.Show;
end;

procedure TfrmPalmWoods.lblLevel1Click(Sender: TObject);
begin
  ShapeL1.Visible := True;
  grpbLevel1.Visible := True;

  ShapeL2.Visible := False;

  lblLevel1.Font.Style := [fsBold];
  lblLevel2.Font.Style := [];

  grpbLevel2.Visible := False;
  grpbLevel1.Visible := True;

  lblLevel1.Cursor := crDefault;
end;

procedure TfrmPalmWoods.lblLevel1MouseEnter(Sender: TObject);
begin
  if lblLevel1.Font.Style = [] then
    lblLevel1.Cursor := crHandPoint;
end;

procedure TfrmPalmWoods.lblLevel1MouseLeave(Sender: TObject);
begin
  lblLevel1.Cursor := crDefault;
end;

procedure TfrmPalmWoods.lblLevel2Click(Sender: TObject);
begin
  ShapeL1.Visible := False;
  grpbLevel1.Visible := False;

  ShapeL2.Visible := True;

  lblLevel2.Font.Style := [fsBold];
  lblLevel1.Font.Style := [];

  grpbLevel1.Visible := False;
  grpbLevel2.Visible := True;

  lblLevel2.Cursor := crDefault;
end;

procedure TfrmPalmWoods.lblLevel2MouseEnter(Sender: TObject);
begin
  if lblLevel2.Font.Style = [] then
    lblLevel2.Cursor := crHandPoint;
end;

procedure TfrmPalmWoods.lblLevel2MouseLeave(Sender: TObject);
begin
  lblLevel2.Cursor := crDefault;
end;

procedure TfrmPalmWoods.lblSignInClick(Sender: TObject);
begin
  Self.Hide;
  frmLogin.Show;
end;

procedure TfrmPalmWoods.lblSignInMouseEnter(Sender: TObject);
begin
  lblSignIn.Font.Color := clRed;
end;

procedure TfrmPalmWoods.lblSignInMouseLeave(Sender: TObject);
begin
  lblSignIn.Font.Color := clWhite;
end;

procedure TfrmPalmWoods.lblSignUpClick(Sender: TObject);
begin
  Self.Hide;
  frmRegister.Show;
end;

procedure TfrmPalmWoods.lblSignUpMouseEnter(Sender: TObject);
begin
  lblSignUp.Font.Color := clRed;
end;

procedure TfrmPalmWoods.lblSignUpMouseLeave(Sender: TObject);
begin
  lblSignUp.Font.Color := clWhite;
end;

{Uses information the user entered/selected, the bookings form is opened and full
 details of the booking is shown on that form}
procedure TfrmPalmWoods.OpenBooking;
var
  iBook : ShortInt;

begin
  if bLogin = True then
  begin
    Self.Enabled := False;
    frmBooking.Show;

    pat.tblRooms.First;

    while not pat.tblRooms.Eof do
    begin
      if pat.tblRooms['RoomID'] = StrToInt(sRoomID) then
      begin
        frmBooking.lblARoomNo.Caption := sRoomID;
        frmBooking.lblARoomFloor.Caption := sRoomFloor;
        rPrice := pat.tblRooms['PricePerNight'];
        frmBooking.lblAPPN.Caption := FloatToStrF(rPrice, ffCurrency, 8, 2);
        frmBooking.redDesc.Text := pat.tblRooms['RoomDescrip'];
      end;

      pat.tblRooms.Next;
    end;

    frmBooking.lblAStartDate.Caption := DateToStr(tStartDate);
    frmBooking.lblANumDays.Caption := IntToStr(iNumDays);
    frmBooking.lblAEndDate.Caption := DateToStr(tEndDate);
    frmBooking.lblATotalDue.Caption := FloatToStrF(rPrice*spnNumDays.Value, ffCurrency, 8, 2);
  end

  else
  begin
    iBook := MessageDlg('Please login to make a booking', mtInformation, mbOKCancel, 0);

    if iBook = mrOk then
    begin
      Self.Hide;
      frmLogin.Show;
    end
  end;

end;

procedure TfrmPalmWoods.R1A;
begin
  lblAvailR1L1.Caption := 'Available';
  lblAvailR1L1.Font.Color := clLime;
  lblAvailR1L1.Left := 87;
  Shape_1.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R1NA;
begin
  lblAvailR1L1.Caption := 'Not Available';
  lblAvailR1L1.Font.Color := $000606FF;
  lblAvailR1L1.Left := 70;
  Shape_1.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R2A;
begin
  lblAvailR2L1.Caption := 'Available';
  lblAvailR2L1.Font.Color := clLime;
  lblAvailR2L1.Left := 87;
  Shape_2.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R2NA;
begin
  lblAvailR2L1.Caption := 'Not Available';
  lblAvailR2L1.Font.Color := $000606FF;
  lblAvailR2L1.Left := 70;
  Shape_2.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R3A;
begin
  lblAvailR3L1.Caption := 'Available';
  lblAvailR3L1.Font.Color := clLime;
  lblAvailR3L1.Left := 87;
  Shape_3.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R3NA;
begin
  lblAvailR3L1.Caption := 'Not Available';
  lblAvailR3L1.Font.Color := $000606FF;
  lblAvailR3L1.Left := 70;
  Shape_3.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R4A;
begin
  lblAvailR4L1.Caption := 'Available';
  lblAvailR4L1.Font.Color := clLime;
  lblAvailR4L1.Left := 87;
  Shape_4.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R4NA;
begin
  lblAvailR4L1.Caption := 'Not Available';
  lblAvailR4L1.Font.Color := $000606FF;
  lblAvailR4L1.Left := 70;
  Shape_4.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R5A;
begin
  lblAvailR1L2.Caption := 'Available';
  lblAvailR1L2.Font.Color := clLime;
  lblAvailR1L2.Left := 87;
  Shape_5.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R5NA;
begin
  lblAvailR1L2.Caption := 'Not Available';
  lblAvailR1L2.Font.Color := $000606FF;
  lblAvailR1L2.Left := 70;
  Shape_5.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R6A;
begin
  lblAvailR2L2.Caption := 'Available';
  lblAvailR2L2.Font.Color := clLime;
  lblAvailR2L2.Left := 87;
  Shape_6.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R6NA;
begin
  lblAvailR2L2.Caption := 'Not Available';
  lblAvailR2L2.Font.Color := $000606FF;
  lblAvailR2L2.Left := 70;
  Shape_6.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R7A;
begin
  lblAvailR3L2.Caption := 'Available';
  lblAvailR3L2.Font.Color := clLime;
  lblAvailR3L2.Left := 87;
  Shape_7.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R7NA;
begin
  lblAvailR3L2.Caption := 'Not Available';
  lblAvailR3L2.Font.Color := $000606FF;
  lblAvailR3L2.Left := 70;
  Shape_7.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.R8A;
begin
  lblAvailR4L2.Caption := 'Available';
  lblAvailR4L2.Font.Color := clLime;
  lblAvailR4L2.Left := 87;
  Shape_8.Brush.Color := clLime;
end;

procedure TfrmPalmWoods.R8NA;
begin
  lblAvailR4L2.Caption := 'Not Available';
  lblAvailR4L2.Font.Color := $000606FF;
  lblAvailR4L2.Left := 70;
  Shape_8.Brush.Color := $000606FF;
end;

procedure TfrmPalmWoods.redDescR1L1SelectionChange(Sender: TObject);
begin
  redDescR1L1.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR1L2SelectionChange(Sender: TObject);
begin
  redDescR1L2.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR2L1SelectionChange(Sender: TObject);
begin
  redDescR2L1.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR2L2SelectionChange(Sender: TObject);
begin
  redDescR2L2.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR3L1SelectionChange(Sender: TObject);
begin
  redDescR3L1.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR3L2SelectionChange(Sender: TObject);
begin
  redDescR3L2.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR4L1SelectionChange(Sender: TObject);
begin
  redDescR4L1.SelLength := 0;
end;

procedure TfrmPalmWoods.redDescR4L2SelectionChange(Sender: TObject);
begin
  redDescR4L2.SelLength := 0;
end;

procedure TfrmPalmWoods.ShapeBackStdMouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.spnNumDaysChange(Sender: TObject);
begin
  iNumDays := spnNumDays.Value;
  frmPickDate.NumDays;
end;

procedure TfrmPalmWoods.TabSheet1MouseEnter(Sender: TObject);
begin
  CloseAll;
end;

procedure TfrmPalmWoods.Timer1Timer(Sender: TObject);
var
  I: Integer;

begin
  if (bR1L1 = True) AND (pnlR1L1.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR1L1.Width := pnlR1L1.Width + 1;
  end;

  if (bR2L1 = True) AND (pnlR2L1.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR2L1.Width := pnlR2L1.Width + 1;
  end;

  if (bR3L1 = True) AND (pnlR3L1.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR3L1.Width := pnlR3L1.Width + 1;
  end;

  if (bR4L1 = True) AND (pnlR4L1.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR4L1.Width := pnlR4L1.Width + 1;
  end;

  if (bR1L2 = True) AND (pnlR1L2.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR1L2.Width := pnlR1L2.Width + 1;
  end;

  if (bR2L2 = True) AND (pnlR2L2.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR2L2.Width := pnlR2L2.Width + 1;
  end;

  if (bR3L2 = True) AND (pnlR3L2.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR3L2.Width := pnlR3L2.Width + 1;
  end;

  if (bR4L2 = True) AND (pnlR4L2.Width = 0) then
  begin
    for I := 1 to 250 do
      pnlR4L2.Width := pnlR4L2.Width + 1;
  end;
end;

procedure TfrmPalmWoods.Timer2Timer(Sender: TObject);
begin
  if (bR1L1 = False) AND (pnlR1L1.Width = 250) then
  begin
      pnlR1L1.Width := 0;
  end;

  if (bR2L1 = False) AND (pnlR2L1.Width = 250) then
  begin
      pnlR2L1.Width := 0;
  end;

  if (bR3L1 = False) AND (pnlR3L1.Width = 250) then
  begin
      pnlR3L1.Width := 0;
  end;

  if (bR4L1 = False) AND (pnlR4L1.Width = 250) then
  begin
      pnlR4L1.Width := 0;
  end;

  if (bR1L2 = False) AND (pnlR1L2.Width = 250) then
  begin
      pnlR1L2.Width := 0;
  end;

  if (bR2L2 = False) AND (pnlR2L2.Width = 250) then
  begin
      pnlR2L2.Width := 0;
  end;

  if (bR3L2 = False) AND (pnlR3L2.Width = 250) then
  begin
      pnlR3L2.Width := 0;
  end;

  if (bR4L2 = False) AND (pnlR4L2.Width = 250) then
  begin
      pnlR4L2.Width := 0;
  end;
end;

end.
