unit Admin_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, jpeg, pngimage,
  Spin, Login_U, TeEngine, TeeProcs, Chart, Series, Data.DB;

type
  TfrmAdmin = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridClients: TDBGrid;
    ShapeNameAdmin: TShape;
    ShapeSurnameAdmin: TShape;
    ShapeIDAdmin: TShape;
    ShapeEmailAdmin: TShape;
    ShapeCellAdmin: TShape;
    ShapePasswordAdmin: TShape;
    edtNameAdmin: TEdit;
    edtSurnameAdmin: TEdit;
    edtIDNumberAdmin: TEdit;
    edtEmailAdmin: TEdit;
    edtCellNumber: TEdit;
    edtPasswordAdmin: TEdit;
    btnNameAdmin: TButton;
    btnEmailAdmin: TButton;
    btnSurnameAdmin: TButton;
    btnCellNoAdmin: TButton;
    btnIDAdmin: TButton;
    btnPasswordAdmin: TButton;
    lblNameAdmin: TLabel;
    lblEmailAdmin: TLabel;
    lblSurnameAdmin: TLabel;
    lblCellAdmin: TLabel;
    lblIDAdmin: TLabel;
    lblPasswordAdmin: TLabel;
    DBGridRooms: TDBGrid;
    TabSheet3: TTabSheet;
    imgClientsB: TImage;
    ShapeBackStd: TShape;
    imgBack: TImage;
    lblNameErrorAdm: TLabel;
    lblSurnameErrorAdm: TLabel;
    lblIDErrorAdm: TLabel;
    lblEmailErrorAdm: TLabel;
    lblCellErrorAdm: TLabel;
    lblPasswordErrorAdm: TLabel;
    ShapeReviewAdmin: TShape;
    redReviewAdmin: TRichEdit;
    btnReviewAdmin: TButton;
    lblReviewAdmin: TLabel;
    imgBackAdm: TImage;
    imgAdRevB: TImage;
    imgBookingsB: TImage;
    DBGridBookings: TDBGrid;
    TabSheet4: TTabSheet;
    ShapeDivider: TShape;
    imgRoomsB: TImage;
    lblManageAdmins: TLabel;
    lblManageReviews: TLabel;
    lblCurrentAdmins: TLabel;
    redAdmins: TRichEdit;
    edtAddAdmin: TEdit;
    ShapeAddAdmin: TShape;
    lblAddAdminError: TLabel;
    lblAddAdmin: TLabel;
    btnAddAdmin: TButton;
    rgpAddRemove: TRadioGroup;
    lblCurrentReviews: TLabel;
    redEditReviewsAdmin: TRichEdit;
    rgpReviews: TRadioGroup;
    edtEditReviewAdmin: TEdit;
    lblEditReviewAdmin: TLabel;
    btnEditReviewAdmin: TButton;
    lblEditReviewErrorAdmin: TLabel;
    ShapeEditReviewAdmin: TShape;
    edtPricePerNight: TEdit;
    btnPricePerNight: TButton;
    lblPricePerNight: TLabel;
    ShapePricePerNight: TShape;
    btnFloor: TButton;
    lblFloor: TLabel;
    ShapeFloor: TShape;
    lblAvailable: TLabel;
    ShapeAvailable: TShape;
    btnRoomDesc: TButton;
    lblRoomDesc: TLabel;
    ShapeRoomDesc: TShape;
    edtTotalDue: TEdit;
    btnTotalDue: TButton;
    lblTotalDue: TLabel;
    ShapeTotalDue: TShape;
    btnRoomID: TButton;
    lblRoomID: TLabel;
    ShapeRoomID: TShape;
    btnNumOfNights: TButton;
    lblNumOfNights: TLabel;
    ShapeNumOfNights: TShape;
    btnStartDate: TButton;
    lblStartDate: TLabel;
    ShapeStartDate: TShape;
    btnClientCode: TButton;
    lblClientCode: TLabel;
    ShapeClientCode: TShape;
    lblEndDate: TLabel;
    ShapeEndDate: TShape;
    redRoomDesc: TRichEdit;
    chkAvailable: TCheckBox;
    spnFloor: TSpinEdit;
    btnAvailAdm: TButton;
    lblRoomDescE: TLabel;
    imgSearch: TImage;
    ShapeSearch: TShape;
    edtSearch: TEdit;
    imgLogo: TImage;
    spnRoomID: TSpinEdit;
    spnNumNightsAdm: TSpinEdit;
    DateTimeStartAdm: TDateTimePicker;
    lblEndDateAdm: TLabel;
    cmbClientCodeAdm: TComboBox;
    lblStartAdmE: TLabel;
    rgpSort: TRadioGroup;
    lblNumNightsAdmE: TLabel;
    lblRoomIDAdmE: TLabel;
    lblReviewErrorAdmin: TLabel;
    rgpBookingsSortBy: TRadioGroup;
    edtSearchBookings: TEdit;
    imgSearchBookings: TImage;
    ShapeSearchBookings: TShape;
    ShapeMakePersonalBooking: TShape;
    lblMakePersonalBooking: TLabel;
    lblPaid: TLabel;
    ShapePaid: TShape;
    chkPaid: TCheckBox;
    btnPaid: TButton;
    imgHelpAdmin: TImage;
    ShapeHelpAdmin: TShape;
    TabSheet5: TTabSheet;
    imgStatsBack: TImage;
    chtRoomStats: TChart;
    Series1: TPieSeries;
    lblPickRooms: TLabel;
    lblPickClients: TLabel;
    lblPickBooking: TLabel;
    lbl5Reviews: TLabel;
    lblRoomRev: TLabel;
    btnShowRev: TButton;
    chkActivated: TCheckBox;
    ShapeActivated: TShape;
    btnActivatedAdm: TButton;
    lblRoom: TLabel;
    lblBooking: TLabel;
    chkWheelAdm: TCheckBox;
    chkVegAdm: TCheckBox;
    ShapeBool: TShape;
    lblSearchBooking: TLabel;
    lblSearchEmail: TLabel;
    imgDeleteBooking: TImage;
    ShapeDeleteBooking: TShape;
    ShapeBirthday: TShape;
    lblBirthday: TLabel;
    lblBirthdaysError: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGridClientsCellClick(Column: TColumn);
    procedure edtNameAdminClick(Sender: TObject);
    procedure edtEmailAdminClick(Sender: TObject);
    procedure edtSurnameAdminClick(Sender: TObject);
    procedure edtCellNumberClick(Sender: TObject);
    procedure edtIDNumberAdminClick(Sender: TObject);
    procedure edtPasswordAdminClick(Sender: TObject);
    procedure edtNameAdminChange(Sender: TObject);
    procedure edtSurnameAdminChange(Sender: TObject);
    procedure edtEmailAdminChange(Sender: TObject);
    procedure edtCellNumberChange(Sender: TObject);
    procedure edtIDNumberAdminChange(Sender: TObject);
    procedure edtPasswordAdminChange(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBackClick(Sender: TObject);
    procedure redReviewAdminChange(Sender: TObject);
    procedure redReviewAdminClick(Sender: TObject);
    procedure edtAddAdminChange(Sender: TObject);
    procedure rgpAddRemoveClick(Sender: TObject);
    procedure btnAddAdminClick(Sender: TObject);
    procedure rgpReviewsClick(Sender: TObject);
    procedure edtEditReviewAdminChange(Sender: TObject);
    procedure edtEditReviewAdminClick(Sender: TObject);
    procedure btnEditReviewAdminClick(Sender: TObject);
    procedure DBGridRoomsCellClick(Column: TColumn);
    procedure DBGridBookingsCellClick(Column: TColumn);
    procedure redRoomDescClick(Sender: TObject);
    procedure edtPricePerNightClick(Sender: TObject);
    procedure spnFloorChange(Sender: TObject);
    procedure spnFloorClick(Sender: TObject);
    procedure edtPricePerNightChange(Sender: TObject);
    procedure imgBackMouseEnter(Sender: TObject);
    procedure imgBackMouseLeave(Sender: TObject);
    procedure redRoomDescChange(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnNameAdminClick(Sender: TObject);
    procedure btnSurnameAdminClick(Sender: TObject);
    procedure btnIDAdminClick(Sender: TObject);
    procedure btnEmailAdminClick(Sender: TObject);
    procedure btnCellNoAdminClick(Sender: TObject);
    procedure btnPasswordAdminClick(Sender: TObject);
    procedure btnReviewAdminClick(Sender: TObject);
    procedure btnRoomDescClick(Sender: TObject);
    procedure btnFloorClick(Sender: TObject);
    procedure btnPricePerNightClick(Sender: TObject);
    procedure btnAvailAdmClick(Sender: TObject);
    procedure spnClientCodeAdmClick(Sender: TObject);
    procedure spnRoomIDClick(Sender: TObject);
    procedure edtNumOfNightsClick(Sender: TObject);
    procedure edtTotalDueClick(Sender: TObject);
    procedure edtStartDateClick(Sender: TObject);
    procedure edtEndDateClick(Sender: TObject);
    procedure spnNumNightsAdmClick(Sender: TObject);
    procedure DateTimeStartAdmClick(Sender: TObject);
    procedure DateTimeStartAdmChange(Sender: TObject);
    procedure spnRoomIDChange(Sender: TObject);
    procedure spnNumNightsAdmChange(Sender: TObject);
    procedure chkAvailableClick(Sender: TObject);
    procedure rgpSortClick(Sender: TObject);
    procedure cmbClientCodeAdmClick(Sender: TObject);
    procedure cmbClientCodeAdmChange(Sender: TObject);
    procedure edtTotalDueChange(Sender: TObject);
    procedure edtSearchBookingsChange(Sender: TObject);
    procedure rgpBookingsSortByClick(Sender: TObject);
    procedure lblMakePersonalBookingClick(Sender: TObject);
    procedure lblMakePersonalBookingMouseEnter(Sender: TObject);
    procedure lblMakePersonalBookingMouseLeave(Sender: TObject);
    procedure btnClientCodeClick(Sender: TObject);
    procedure btnNumOfNightsClick(Sender: TObject);
    procedure btnStartDateClick(Sender: TObject);
    procedure btnRoomIDClick(Sender: TObject);
    procedure btnTotalDueClick(Sender: TObject);
    procedure chkPaidClick(Sender: TObject);
    procedure imgHelpAdminClick(Sender: TObject);
    procedure imgHelpAdminMouseEnter(Sender: TObject);
    procedure imgHelpAdminMouseLeave(Sender: TObject);
    procedure btnPaidClick(Sender: TObject);
    procedure btnShowRevClick(Sender: TObject);
    procedure chkActivatedClick(Sender: TObject);
    procedure btnActivatedAdmClick(Sender: TObject);
    procedure chkWheelAdmClick(Sender: TObject);
    procedure chkVegAdmClick(Sender: TObject);
    procedure imgDeleteBookingMouseEnter(Sender: TObject);
    procedure imgDeleteBookingMouseLeave(Sender: TObject);
    procedure imgDeleteBookingClick(Sender: TObject);
    procedure lblBirthdayMouseEnter(Sender: TObject);
    procedure lblBirthdayMouseLeave(Sender: TObject);
    procedure lblBirthdayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  //Clients
    procedure HideButton;
    procedure HideComponents;
    procedure ShowComponents;
    procedure NameAdminClose;
    procedure SurnameAdminClose;
    procedure IDAdminClose;
    procedure EmailAdminClose;
    procedure CellAdminClose;
    procedure PasswordAdminClose;
    procedure ReviewAdminClose;
    procedure Search;

  //Rooms
    procedure HideButtonRooms;
    procedure HideComponentsRooms;
    procedure ShowComponentsRooms;
    procedure RoomDescAdmClose;
    procedure FloorAdmClose;
    procedure PricePerNightClose;

  //Bookings
    procedure HideButtonBookings;
    procedure HideComponentsBookings;
    procedure ShowComponentsBookings;
    procedure ClientCodeClose;
    procedure RoomIDClose;
    procedure NumNightsClose;
    procedure TotalDueClose;
    procedure StartDateClose;
    procedure PaidClose;
    procedure AvailAdm;

  //Admins/Reviews
    procedure ReadAdmins;
    procedure ReadReviews;

  //SQL Procedures
    procedure runSQLClient(sSQL : string);
    procedure runSQLRooms(sSQL : string);
    procedure runSQLBooking(sSQL : string);

    procedure setStats;
  end;

var
  frmAdmin: TfrmAdmin;

  {Client}
  bNameAdmin, bSurnameAdmin, bIDAdmin, bEmailAdmin, bCellAdmin, bPasswordAdmin,
  bReviewAdmin,

  {Room}
  bRoomDescAdm, bFloorAdm, bPricePerNightAdm,

  {Booking}
  bClientCodeAdm, bRoomIDAdm, bNumNightsAdm, bTotalDueAdm, bStartDateAdm,
  bNumNightsClick, bStartDateClick, bRoomIDClick : Boolean;

  iCount, iCode : Integer;

  sReviews : string;

  bSearch, bSearchBooking, bRooms, bBookings, bVegWheel, bBirthday : Boolean;

implementation

uses
  dm, CreateAccount_U, StandardUser_U, Help_U, Revenue_U;

{$R *.dfm}

procedure TfrmAdmin.AvailAdm;
var
  iCountAdm : Integer;
  tStartAdm : TDateTime;

begin
  if (bStartDateClick = True) OR (bNumNightsClick = True) OR (bRoomIDClick = True) then
  begin
    tStartAdm := DateTimeStartAdm.Date;

    iCountAdm := 0;

    with pat do
    begin
      tblBookings.First;

      while not tblBookings.Eof do
      begin
       if (tblBookings['RoomID'] = spnRoomID.Value) AND
          (tblBookings['BookingID'] <> iCode) then
       begin
          Inc(iCountAdm);

          if (tStartAdm > tblBookings['EndDate']) OR
             ((tStartAdm < tblBookings['StartDate']) AND
              (tStartAdm + spnNumNightsAdm.Value < tblBookings['StartDate'])) then
          begin
            if bStartDateClick = True then
            begin
              lblStartAdmE.Caption := '';
              DateTimeStartAdm.Width := 210;
              btnStartDate.Visible := True;
            end

            else if bNumNightsClick = True then
            begin
              lblNumNightsAdmE.Caption := '';
              spnNumNightsAdm.Width := 210;
              btnNumOfNights.Visible := True;
            end

            else if bRoomIDClick = True then
            begin
              lblRoomIDAdmE.Caption := '';
              spnRoomID.Width := 210;
              btnRoomID.Visible := True;
            end;
          end  //if Available

          else
          begin
            if bStartDateClick = True then
            begin
              lblStartAdmE.Caption := 'Not Available';
              StartDateClose;
            end

            else if bNumNightsClick = True then
            begin
              lblNumNightsAdmE.Caption := 'Not Available';
              NumNightsClose;
            end

            else if bRoomIDClick = True then
            begin
              lblRoomIDAdmE.Caption := 'Not Available';
              RoomIDClose;
            end;
          end;  //if not available

        end; //if RoomID = I & if that booking finished

        tblBookings.Next;
      end; //while not bookings.eof

      if iCountAdm = 0 then
      begin
        lblStartAdmE.Caption := '';
        DateTimeStartAdm.Width := 210;
        btnStartDate.Visible := True;
      end;

      tblBookings.First;

      repeat
        tblBookings.Next;
      until (tblBookings['BookingID'] = iCode);
    end; //with pat
  end; //if Click

  if (bStartDateClick = True) AND (pat.tblBookings['StartDate'] = DateTimeStartAdm.Date) then
  begin
    lblStartAdmE.Caption := '';
    StartDateClose;
  end;

  if (bNumNightsClick = True) AND (pat.tblBookings['NumOfNights'] = spnNumNightsAdm.Value) then
  begin
    lblNumNightsAdmE.Caption := '';
    NumNightsClose;
  end;

  if (bRoomIDClick = True) AND (pat.tblBookings['RoomID'] = spnRoomID.Value) then
  begin
    lblRoomIDAdmE.Caption := '';
    RoomIDClose;
  end;
end;

procedure TfrmAdmin.btnActivatedAdmClick(Sender: TObject);
var
  sClient : string;
  bFoundClient : Boolean;

begin
  sClient := pat.tblClients['ClientCode'];
  bFoundClient := False;

  if chkActivated.Checked = True then
  begin
    runSQLClient('UPDATE tblClients SET Activated = True WHERE ClientCode = ' +
    sClient);

    MessageDlg('Account Activated successfully', mtInformation, [mbOK], 0);
    ShapeActivated.Width := 85;
    btnActivatedAdm.Visible := False;
  end

  else
  begin
    runSQLClient('UPDATE tblClients SET Activated = False WHERE ClientCode = ' +
    sClient);

    MessageDlg('Account Deactivated successfully', mtInformation, [mbOK], 0);
    ShapeActivated.Width := 85;
    btnActivatedAdm.Visible := False;
  end;

  pat.tblClients.First;

  while (not pat.tblClients.Eof) AND (bFoundClient = False) do
  begin
    if (pat.tblClients['ClientCode'] <> sClient) then
      pat.tblClients.Next

    else
      bFoundClient := True;
  end;
end;

procedure TfrmAdmin.btnAddAdminClick(Sender: TObject);
var
  bBoolean: Boolean;

begin
  if btnAddAdmin.Caption = 'Add' then
  begin
    bBoolean := False;

    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if edtAddAdmin.Text = tblClients['Email'] then
        begin
          tblClients.Edit;
          bBoolean := True;
          tblClients['Admin'] := True;
          tblClients.Post;
          tblClients.Refresh;
        end;

        tblClients.Next;
      end;
    end;  //with

    if bBoolean = True then
    begin
      ReadAdmins;
      MessageDlg('Admin Added', mtInformation, [mbOK], 0);
    end

    else
      MessageDlg('Email does not exist. Please enter a valid email', mtError, [mbOK], 0);
  end
  //if Add

  else
  begin
    bBoolean := False;

    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if edtAddAdmin.Text = tblClients['Email'] then
        begin
          tblClients.Edit;
          bBoolean := True;
          tblClients['Admin'] := False;
        end;

        tblClients.Next;
      end;
    end;

    if bBoolean = True then
    begin
      ReadAdmins;
      MessageDlg('Admin Removed', mtInformation, [mbOK], 0);
    end

    else
      MessageDlg('Email does not exist. Please enter a valid email', mtError, [mbOK], 0);
  end;

end;

procedure TfrmAdmin.btnCellNoAdminClick(Sender: TObject);
begin
  if (lblCellErrorAdm.Caption = '') then
  begin
    with pat do
    begin
      tblClients.Edit;
      tblClients['CellNo'] := edtCellNumber.Text;
      tblClients.Post;
      tblClients.Refresh;
      DBGridClients.Refresh;
      MessageDlg('Cell Phone Number updated successfully', mtInformation, [mbOK], 0);
      CellAdminClose;
    end;
  end;
end;

procedure TfrmAdmin.btnClientCodeClick(Sender: TObject);
begin
  with pat do
  begin
    tblBookings.Edit;
    tblBookings['ClientCode'] := cmbClientCodeAdm.Text;
    tblBookings.Post;
    tblBookings.Refresh;
    DBGridBookings.Refresh;
    MessageDlg('Client Code updated successfully', mtInformation, [mbOK], 0);
    ClientCodeClose;
  end;
end;

procedure TfrmAdmin.btnEditReviewAdminClick(Sender: TObject);
var
  bBoolean: Boolean;

begin
  if btnEditReviewAdmin.Caption = 'Add' then
  begin
    if redEditReviewsAdmin.Lines.Count = 5 then
    begin
      MessageDlg('Review limit reached. Please delete a review to add', mtError, [mbOK], 0);
    end

    else
    begin
      bBoolean := False;

      with pat do
      begin
        tblClients.First;

        while not tblClients.Eof do
        begin
          if edtEditReviewAdmin.Text = tblClients['Email'] then
          begin
            tblClients.Edit;
            bBoolean := True;
            tblClients['ShowReview'] := True;
          end;

          tblClients.Next;
        end;
      end;  //with

      if bBoolean = True then
      begin
        ReadReviews;
        MessageDlg('Review Added', mtInformation, [mbOK], 0);
      end

      else
        MessageDlg('Email does not exist. Please enter a valid email', mtError, [mbOK], 0);
    end;  //Less 5

  end  //if Add

  else if btnEditReviewAdmin.Caption = 'Remove' then
  begin
    bBoolean := False;

    with pat do
    begin
      tblClients.First;

      while not tblClients.Eof do
      begin
        if edtEditReviewAdmin.Text = tblClients['Email'] then
        begin
          tblClients.Edit;
          bBoolean := True;
          tblClients['ShowReview'] := False;
       end;

        tblClients.Next;
      end;
    end;  //with

    if bBoolean = True then
    begin
      ReadReviews;
      MessageDlg('Review Removed', mtInformation, [mbOK], 0);
    end

    else
      MessageDlg('Email does not exist. Please enter a valid email', mtError, [mbOK], 0);
  end;

  if redReviewAdmin.Lines.Count < 5 then
    lbl5Reviews.Visible := True

  else
    lbl5Reviews.Visible := False;
end;

procedure TfrmAdmin.btnEmailAdminClick(Sender: TObject);
begin
  if (lblEmailErrorAdm.Caption = '') then
  begin
    with pat do
    begin
      tblClients.Edit;
      tblClients['Email'] := edtEmailAdmin.Text;
      tblClients.Post;
      tblClients.Refresh;
      DBGridClients.Refresh;
      MessageDlg('Email updated successfully', mtInformation, [mbOK], 0);
      EmailAdminClose;
    end;
  end;
end;

procedure TfrmAdmin.btnFloorClick(Sender: TObject);
begin
  with pat do
  begin
    tblRooms.Edit;
    tblRooms['Floor'] := spnFloor.Value;
    tblRooms.Post;
    tblRooms.Refresh;
    DBGridRooms.Refresh;
    MessageDlg('Floor updated successfully', mtInformation, [mbOK], 0);
    FloorAdmClose;
  end;
end;

procedure TfrmAdmin.btnIDAdminClick(Sender: TObject);
begin
  if (lblIDErrorAdm.Caption = '') then
  begin
    with pat do
    begin
      tblClients.Edit;
      tblClients['ID'] := edtIDNumberAdmin.Text;
      tblClients.Post;
      tblClients.Refresh;
      DBGridClients.Refresh;
      MessageDlg('ID Number updated successfully', mtInformation, [mbOK], 0);
      IDAdminClose;
    end;
  end;
end;

procedure TfrmAdmin.btnNameAdminClick(Sender: TObject);
begin
  if (lblNameErrorAdm.Caption = '') then
  begin
    with pat do
    begin
      tblClients.Edit;
      tblClients['FirstNames'] := edtNameAdmin.Text;
      tblClients.Post;
      tblClients.Refresh;
      DBGridClients.Refresh;
      MessageDlg('First Name updated successfully', mtInformation, [mbOK], 0);
      NameAdminClose;
    end;
  end;
end;

procedure TfrmAdmin.btnNumOfNightsClick(Sender: TObject);
begin
  with pat do
  begin
    tblBookings.Edit;
    tblBookings['NumOfNights'] := spnNumNightsAdm.Value;
    tblBookings.Post;
    tblBookings.Refresh;
    DBGridBookings.Refresh;
    MessageDlg('Number of Nights updated successfully', mtInformation, [mbOK], 0);
    NumNightsClose;
    bNumNightsClick := False;
  end;
end;

procedure TfrmAdmin.btnPaidClick(Sender: TObject);
begin
  with pat do
  begin
    tblBookings.Edit;

    if chkPaid.Checked = True then
      tblBookings['Paid'] := True

    else
      tblBookings['Paid'] := False;

    tblBookings.Post;
    tblBookings.Refresh;
    DBGridBookings.Refresh;
    MessageDlg('Updated successfully', mtInformation, [mbOK], 0);
    PaidClose;
  end;
end;

procedure TfrmAdmin.btnPasswordAdminClick(Sender: TObject);
begin
  if (lblPasswordErrorAdm.Caption = '') then
  begin
    with pat do
    begin
      tblClients.Edit;
      tblClients['Password'] := edtPasswordAdmin.Text;
      tblClients.Post;
      tblClients.Refresh;
      DBGridClients.Refresh;
      MessageDlg('Password updated successfully', mtInformation, [mbOK], 0);
      PasswordAdminClose;
    end;
  end;
end;

procedure TfrmAdmin.btnPricePerNightClick(Sender: TObject);
begin
  with pat do
  begin
    tblRooms.Edit;
    tblRooms['PricePerNight'] := edtPricePerNight.Text;
    tblRooms.Post;
    tblRooms.Refresh;
    DBGridRooms.Refresh;
    MessageDlg('Price Per Night updated successfully', mtInformation, [mbOK], 0);
    PricePerNightClose;
  end;
end;

procedure TfrmAdmin.btnReviewAdminClick(Sender: TObject);
begin
  with pat do
  begin
    tblClients.Edit;
    tblClients['Review'] := redReviewAdmin.Text;
      tblClients.Post;
      tblClients.Refresh;
    DBGridClients.Refresh;
    MessageDlg('Review updated successfully', mtInformation, [mbOK], 0);
    ReviewAdminClose;
  end;
end;

procedure TfrmAdmin.btnRoomDescClick(Sender: TObject);
begin
  if lblRoomDescE.Caption = '' then
  begin
    with pat do
    begin
      tblRooms.Edit;
      tblRooms['RoomDescrip'] := redRoomDesc.Text;
      tblRooms.Post;
      tblRooms.Refresh;
      DBGridRooms.Refresh;
      MessageDlg('Room Description updated successfully', mtInformation, [mbOK], 0);
      RoomDescAdmClose;
    end;
  end;
end;

procedure TfrmAdmin.btnRoomIDClick(Sender: TObject);
begin
  with pat do
  begin
    tblBookings.Edit;
    tblBookings['RoomID'] := spnRoomID.Value;
    tblBookings.Post;
    tblBookings.Refresh;
    DBGridBookings.Refresh;
    MessageDlg('Room ID updated successfully', mtInformation, [mbOK], 0);
    RoomIDClose;
    bRoomIDClick := False;
  end;
end;

procedure TfrmAdmin.btnShowRevClick(Sender: TObject);
var
  iRev : ShortInt;

begin
  iRev := MessageDlg('All your unsaved data will be lost, are you sure you want to view Revenue now?', mtWarning, mbYesNo, 0);

  if iRev = mrYes then
  begin
    Self.Hide;
    frmRevenue.Show;
  end;

end;

procedure TfrmAdmin.btnStartDateClick(Sender: TObject);
begin
  with pat do
  begin
    tblBookings.Edit;
    tblBookings['StartDate'] := DateTimeStartAdm.Date;
    tblBookings.Post;
    tblBookings.Refresh;
    DBGridBookings.Refresh;
    MessageDlg('Start Date updated successfully', mtInformation, [mbOK], 0);
    StartDateClose;
    bStartDateClick := False;
  end;
end;

procedure TfrmAdmin.btnSurnameAdminClick(Sender: TObject);
begin
  if (lblSurnameErrorAdm.Caption = '') then
  begin
    with pat do
    begin
      tblClients.Edit;
      tblClients['Surname'] := edtSurnameAdmin.Text;
      tblClients.Post;
      tblClients.Refresh;
      DBGridClients.Refresh;
      MessageDlg('Surname updated successfully', mtInformation, [mbOK], 0);
      SurnameAdminClose;
    end;
  end;
end;

procedure TfrmAdmin.btnTotalDueClick(Sender: TObject);
begin
  with pat do
  begin
    tblBookings.Edit;
    tblBookings['TotalDue'] := edtTotalDue.Text;
    tblBookings.Post;
    tblBookings.Refresh;
    DBGridBookings.Refresh;
    MessageDlg('Total Due updated successfully', mtInformation, [mbOK], 0);
    TotalDueClose;
  end;
end;

procedure TfrmAdmin.btnAvailAdmClick(Sender: TObject);
begin
  with pat do
  begin
    tblRooms.Edit;

    if chkAvailable.Checked = True then
    begin
      tblRooms['Available'] := True;
      btnAvailAdm.Visible := False;
    end

    else
    begin
      tblRooms['Available'] := False;
      btnAvailAdm.Visible := False;
    end;

    tblRooms.Post;
    tblRooms.Refresh;
    DBGridRooms.Refresh;
    MessageDlg('Availabilty updated successfully', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmAdmin.CellAdminClose;
begin
  bCellAdmin := False;
  edtCellNumber.Width := 290;
  btnCellNoAdmin.Visible := False;
end;

procedure TfrmAdmin.chkActivatedClick(Sender: TObject);
begin
  if chkActivated.Checked <> pat.tblClients['Activated'] then
  begin
    ShapeActivated.Width := 165;
    btnActivatedAdm.Visible := True;
  end

  else
  begin
    ShapeActivated.Width := 85;
    btnActivatedAdm.Visible := False;
  end;
end;

procedure TfrmAdmin.chkAvailableClick(Sender: TObject);
var
  bAvail : Boolean;

begin
  if chkAvailable.Checked then
    bAvail := True

  else
    bAvail := False;

  if pat.tblRooms['Available'] <> bAvail then
  begin
    btnAvailAdm.Visible := True;
  end

  else
  begin
    btnAvailAdm.Visible := False;
  end;
end;

procedure TfrmAdmin.chkPaidClick(Sender: TObject);
var
  bAvailPaid : Boolean;

begin
  if chkPaid.Checked then
    bAvailPaid := True

  else
    bAvailPaid := False;

  if pat.tblBookings['Paid'] <> bAvailPaid then
  begin
    btnPaid.Visible := True;
    ShapePaid.Width := 150;
  end

  else
  begin
    btnPaid.Visible := False;
    ShapePaid.Width := 70;
  end;
end;

procedure TfrmAdmin.chkVegAdmClick(Sender: TObject);
begin
  if bVegWheel = False then
  begin
    if chkVegAdm.Checked = True then
    begin
      pat.tblClients.Edit;
      pat.tblClients['Vegetarian'] := True;
      MessageDlg('Updated successfully', mtInformation, [mbOK], 0);
    end

    else
    begin
      pat.tblClients.Edit;
      pat.tblClients['Vegetarian'] := False;
      MessageDlg('Updated successfully', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmAdmin.chkWheelAdmClick(Sender: TObject);
begin
  if bVegWheel = False then
  begin
    if chkWheelAdm.Checked = True then
    begin
      pat.tblClients.Edit;
      pat.tblClients['WheelchairAccess'] := True;
      MessageDlg('Updated successfully', mtInformation, [mbOK], 0);
    end

    else
    begin
      pat.tblClients.Edit;
      pat.tblClients['WheelchairAccess'] := False;
      MessageDlg('Updated successfully', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmAdmin.ClientCodeClose;
begin
  bClientCodeAdm := False;
  cmbClientCodeAdm.Width := 290;
  btnClientCode.Visible := False;
end;

procedure TfrmAdmin.cmbClientCodeAdmChange(Sender: TObject);
begin
  if cmbClientCodeAdm.Text <> pat.tblBookings['ClientCode'] then
  begin
    bClientCodeAdm := True;
    cmbClientCodeAdm.Width := 210;
    btnClientCode.Visible := True;
  end  //if <>

  else
  begin
    ClientCodeClose;
  end;
end;

procedure TfrmAdmin.cmbClientCodeAdmClick(Sender: TObject);
begin
  HideButtonBookings;
end;

procedure TfrmAdmin.DateTimeStartAdmChange(Sender: TObject);
begin
  if DateTimeStartAdm.Date <> pat.tblBookings['StartDate'] then
  begin
    if bStartDateClick = True then
    begin
      if (DateTimeStartAdm.Date < Now) OR (DateTimeStartAdm.Date = Now - 1) then
      begin
        MessageDlg('Please Note that the selected date is before todays date. PLease make sure you are making correct changes', mtConfirmation, [mbOK], 0);
      end;
    end;

    bStartDateAdm := True;
    DateTimeStartAdm.Width := 210;
    btnStartDate.Visible := True;

    AvailAdm;
  end  //if <>

  else
  begin
    StartDateClose;
  end;

end;

procedure TfrmAdmin.DateTimeStartAdmClick(Sender: TObject);
begin
  bStartDateClick := True;
  HideButtonBookings;
end;

procedure TfrmAdmin.DBGridBookingsCellClick(Column: TColumn);
begin
  edtSearchBookings.Text := '';

  if bSearchBooking = True then
  begin
    pat.dscBookings.DataSet := pat.tblBookings;
    bSearchBooking := False;
  end;

  DBGridBookings.DataSource := pat.dscBookings;
  pat.tblBookings.Open;

  if bBookings = True then
  begin
    rgpBookingsSortBy.ItemIndex := 6;
    pat.dscBookings.DataSet := pat.tblBookings;
    bBookings := False;
  end;

  lblPickBooking.Visible := False;
  lblBooking.Visible := False;

  with pat do
  begin
    iCode := tblBookings['BookingID'];

    cmbClientCodeAdm.Text := tblBookings['ClientCode'];
    spnRoomID.Value := tblBookings['RoomID'];
    spnNumNightsAdm.Value := tblBookings['NumOfNights'];
    edtTotalDue.Text := FloatToStrF(tblBookings['TotalDue'], ffCurrency, 8, 2);
    DateTimeStartAdm.Date := tblBookings['StartDate'];
    lblEndDateAdm.Caption := tblBookings['EndDate'];

    if tblBookings['Paid'] = True then
    begin
      chkPaid.Checked := True;
    end

    else
    begin
      chkPaid.Checked := False;
    end;
  end;

  btnPaid.Visible := False;
  ShapePaid.Width := 70;

  ShowComponentsBookings;
  HideButtonBookings;

  lblPickBooking.Visible := False;
  lblSearchBooking.Visible := False;
end;

procedure TfrmAdmin.DBGridClientsCellClick(Column: TColumn);
begin
  edtSearch.Text := '';

  bVegWheel := True;

  if bSearch = True then
  begin
    pat.dscClients.DataSet := pat.tblClients;
    bSearch := False;
  end;

  if bBirthday = True then
  begin
    pat.dscClients.DataSet := pat.tblClients;
    bBirthday := False;
    pat.tblClients.First;
    Search;
  end;

  DBGridClients.DataSource := pat.dscClients;
  pat.tblClients.Open;

  edtNameAdmin.Text := pat.tblClients['FirstNames'];
  edtSurnameAdmin.Text := pat.tblClients['Surname'];
  edtIDNumberAdmin.Text := pat.tblClients['ID'];
  edtEmailAdmin.Text := pat.tblClients['Email'];
  edtCellNumber.Text := pat.tblClients['CellNo'];
  edtPasswordAdmin.Text := pat.tblClients['Password'];
  redReviewAdmin.Text := pat.tblClients['Review'];

  if pat.tblClients['Activated'] then
    chkActivated.Checked := True

  else
    chkActivated.Checked := False;

  if pat.tblClients['WheelchairAccess'] then
    chkWheelAdm.Checked := True

  else
    chkWheelAdm.Checked := False;

  if pat.tblClients['Vegetarian'] then
    chkVegAdm.Checked := True

  else
    chkVegAdm.Checked := False;

  edtNameAdmin.Font.Color := $00864D00;
  edtSurnameAdmin.Font.Color := $00864D00;
  edtIDNumberAdmin.Font.Color := $00864D00;
  edtEmailAdmin.Font.Color := $00864D00;
  edtCellNumber.Font.Color := $00864D00;
  edtPasswordAdmin.Font.Color := $00864D00;

  lblNameErrorAdm.Caption := '';
  lblSurnameErrorAdm.Caption := '';
  lblIDErrorAdm.Caption := '';
  lblEmailErrorAdm.Caption := '';
  lblCellErrorAdm.Caption := '';
  lblPasswordErrorAdm.Caption := '';

  bVegWheel := False;

  ShowComponents;
  HideButton;
  lblPickClients.Visible := False;
  lblSearchEmail.Visible := False;
  lblBirthdaysError.Visible := False;
end;

procedure TfrmAdmin.DBGridRoomsCellClick(Column: TColumn);
begin
  if bRooms = True then
  begin
    rgpSort.ItemIndex := 3;
    pat.dscRooms.DataSet := pat.tblRooms;
    bRooms := False;
  end;

  lblPickRooms.Visible := False;
  lblRoom.Visible := False;

  with pat do
  begin
    redRoomDesc.Text := tblRooms['RoomDescrip'];
    spnFloor.Value := tblRooms['Floor'];
    edtPricePerNight.Text := FloatToStrF(tblRooms['PricePerNight'], ffCurrency, 8, 2);

    if tblRooms['Available'] = True then
      chkAvailable.Checked := True

    else
      chkAvailable.Checked := False;
  end;

  redRoomDesc.Font.Color := $00864D00;
  spnFloor.Font.Color := $00864D00;
  edtPricePerNight.Font.Color := $00864D00;

  ShowComponentsRooms;
  HideButtonRooms;
end;

procedure TfrmAdmin.edtCellNumberChange(Sender: TObject);
begin
  if edtCellNumber.Text <> pat.tblClients['CellNo'] then
  begin
    bCellAdmin := True;
    edtCellNumber.Width := 210;
    btnCellNoAdmin.Visible := True;

    sCell := edtCellNumber.Text;
    sForm := 'Admin';

    frmRegister.Cell(sCell);

    lblCellErrorAdm.Caption := sCellE;
    lblCellErrorAdm.Left := iCellL;
    edtCellNumber.Font.Color := StringToColor(sCellC);

    if edtCellNumber.Font.Color = clRed then
    begin
      CellAdminClose;
    end;
  end  //if <>

  else
  begin
    CellAdminClose;

    lblCellErrorAdm.Caption := '';
    edtCellNumber.Font.Color := $00864D00;
  end;

  if edtCellNumber.Text = '' then
    CellAdminClose;
end;

procedure TfrmAdmin.edtCellNumberClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtAddAdminChange(Sender: TObject);
begin
  frmRegister.Email(edtAddAdmin.Text);

  lblAddAdminError.Caption := sEmailE;
  edtAddAdmin.Font.Color := StringToColor(sEmailC);

  if edtAddAdmin.Font.Color <> clRed then
  begin
    btnAddAdmin.Visible := True;
    edtAddAdmin.Width := 210;
  end

  else
  begin
    btnAddAdmin.Visible := False;
    edtAddAdmin.Width := 290;
  end;

  if edtAddAdmin.Text = '' then
  begin
    btnAddAdmin.Visible := False;
    edtAddAdmin.Width := 290;
  end;
end;

procedure TfrmAdmin.edtEditReviewAdminChange(Sender: TObject);
begin
  frmRegister.Email(edtEditReviewAdmin.Text);

  lblEditReviewErrorAdmin.Caption := sEmailE;
  edtEditReviewAdmin.Font.Color := StringToColor(sEmailC);

  if edtEditReviewAdmin.Font.Color <> clRed then
  begin
    btnEditReviewAdmin.Visible := True;
    edtEditReviewAdmin.Width := 210;
  end

  else
  begin
    btnEditReviewAdmin.Visible := False;
    edtEditReviewAdmin.Width := 290;
  end;

  if edtEditReviewAdmin.Text = '' then
  begin
    btnEditReviewAdmin.Visible := False;
    edtEditReviewAdmin.Width := 290;
  end;
end;

procedure TfrmAdmin.edtEditReviewAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtEmailAdminChange(Sender: TObject);
begin
  if edtEmailAdmin.Text <> pat.tblClients['Email'] then
  begin
    bEmailAdmin := True;
    edtEmailAdmin.Width := 210;
    btnEmailAdmin.Visible := True;

    sEmail := edtEmailAdmin.Text;

    frmRegister.Email(sEmail);

    lblEmailErrorAdm.Caption := sEmailE;
    edtEmailAdmin.Font.Color := StringToColor(sEmailC);

    if edtEmailAdmin.Font.Color = clRed then
    begin
      EmailAdminClose;
    end;
  end  //if <>

  else
  begin
    EmailAdminClose;

    lblEmailErrorAdm.Caption := '';
    edtEmailAdmin.Font.Color := $00864D00;
  end;

  if edtEmailAdmin.Text = '' then
    EmailAdminClose;

end;

procedure TfrmAdmin.edtEmailAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtEndDateClick(Sender: TObject);
begin
  HideButtonBookings;
end;

procedure TfrmAdmin.edtIDNumberAdminChange(Sender: TObject);
begin
  if edtIDNumberAdmin.Text <> pat.tblClients['ID'] then
  begin
    bIDAdmin := True;
    edtIDNumberAdmin.Width := 210;
    btnIDAdmin.Visible := True;

    sID := edtIDNumberAdmin.Text;
    sForm := 'Admin';

    frmRegister.ID(sID);

    lblIDErrorAdm.Caption := sIDE;
    lblIDErrorAdm.Left := iIDL;
    edtIDNumberAdmin.Font.Color := StringToColor(sIDC);

    if edtIDNumberAdmin.Font.Color = clRed then
    begin
      IDAdminClose;
    end;
  end  //if <>

  else
  begin
    IDAdminClose;

    lblIDErrorAdm.Caption := '';
    edtIDNumberAdmin.Font.Color := $00864D00;
  end;

  if edtIDNumberAdmin.Text = '' then
    IDAdminClose;
end;

procedure TfrmAdmin.edtIDNumberAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtNameAdminChange(Sender: TObject);
begin
  if edtNameAdmin.Text <> pat.tblClients['FirstNames'] then
  begin
    bNameAdmin := True;
    edtNameAdmin.Width := 210;
    btnNameAdmin.Visible := True;

    sName := edtNameAdmin.Text;
    sForm := 'Admin';

    frmRegister.Name(sName);

    lblNameErrorAdm.Caption := sNameE;
    lblNameErrorAdm.Left := iNameL;
    edtNameAdmin.Font.Color := StringToColor(sNameC);

    if edtNameAdmin.Font.Color = clRed then
    begin
      NameAdminClose;
    end;

  end  //if <>

  else
  begin
    NameAdminClose;

    lblNameErrorAdm.Caption := '';
    edtNameAdmin.Font.Color := $00864D00;
  end;

  if edtNameAdmin.Text = '' then
  begin
    NameAdminClose;
  end;
end;

procedure TfrmAdmin.edtNameAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtNumOfNightsClick(Sender: TObject);
begin
  HideButtonBookings;
end;

procedure TfrmAdmin.edtPasswordAdminChange(Sender: TObject);
begin
  if edtPasswordAdmin.Text <> pat.tblClients['Password'] then
  begin
    bPasswordAdmin := True;
    edtPasswordAdmin.Width := 210;
    btnPasswordAdmin.Visible := True;

    sPassword := edtPasswordAdmin.Text;
    sForm := 'Admin';

    frmRegister.Password(sPassword);

    lblPasswordErrorAdm.Caption := sPasswordE;
    lblPasswordErrorAdm.Left := iPasswordL;
    lblPasswordErrorAdm.Font.Color := StringToColor(sPasswordEC);
    edtPasswordAdmin.Font.Color := StringToColor(sPasswordC);

    if edtPasswordAdmin.Font.Color = clRed then
    begin
      PasswordAdminClose;
    end;
  end  //if <>

  else
  begin
    PasswordAdminClose;

    lblPasswordErrorAdm.Caption := '';
    edtPasswordAdmin.Font.Color := $00864D00;
  end;

  if edtPasswordAdmin.Text = '' then
    PasswordAdminClose;
end;

procedure TfrmAdmin.edtPasswordAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtPricePerNightChange(Sender: TObject);
begin
  if edtPricePerNight.Text <> pat.tblRooms['PricePerNight'] then
  begin
    bPricePerNightAdm := True;
    edtPricePerNight.Width := 210;
    btnPricePerNight.Visible := True;
  end  //if <>

  else
  begin
    PricePerNightClose;
  end;

  if edtPricePerNight.Text = '' then
  begin
    PricePerNightClose;
  end;
end;

procedure TfrmAdmin.edtPricePerNightClick(Sender: TObject);
begin
  HideButtonRooms;
end;

procedure TfrmAdmin.edtSearchBookingsChange(Sender: TObject);
var
  sSearchBooking : string;

begin
  sSearchBooking := edtSearchBookings.Text;
  HideComponentsBookings;
  lblPickBooking.Visible := True;

  if Length(sSearchBooking) > 0 then
  begin
    pat.dscBookings.DataSet := pat.qryBookings;
    runSQLBooking('SELECT * FROM tblBookings WHERE BookingID LIKE "%' + sSearchBooking + '%"');
    bSearchBooking := True;
    lblSearchBooking.Visible := True;
  end

  else
  begin
    runSQLBooking('Select * FROM tblBookings');
    pat.dscBookings.DataSet := pat.tblBookings;
    lblSearchBooking.Visible := True;
  end;

  bBookings := True;
end;

procedure TfrmAdmin.edtSearchChange(Sender: TObject);
var
  sSearch : string;

begin
  sSearch := edtSearch.Text;
  HideComponents;
  lblPickClients.Visible := True;

  if (Length(sSearch) > 0) then
  begin
    pat.dscClients.DataSet := pat.qryClients;
    runSQLClient('SELECT * FROM tblClients WHERE Email LIKE "%' + sSearch + '%"');
    bSearch := True;
    lblSearchEmail.Visible := True;
  end

  else
  begin
    runsqlClient('Select * FROM tblClients');
    pat.dscClients.DataSet := pat.tblClients;
    lblSearchEmail.Visible := True;
  end;
end;

procedure TfrmAdmin.edtStartDateClick(Sender: TObject);
begin
  HideButtonBookings;
end;

procedure TfrmAdmin.edtSurnameAdminChange(Sender: TObject);
begin
  if edtSurnameAdmin.Text <> pat.tblClients['Surname'] then
  begin
    bSurnameAdmin := True;
    edtSurnameAdmin.Width := 210;
    btnSurnameAdmin.Visible := True;

    sSurname := edtSurnameAdmin.Text;
    sForm := 'Admin';

    frmRegister.Surname(sSurname);

    lblSurnameErrorAdm.Caption := sSurnameE;
    lblSurnameErrorAdm.Left := iSurnameL;
    edtSurnameAdmin.Font.Color := StringToColor(sSurnameC);

    if edtSurnameAdmin.Font.Color = clRed then
    begin
      SurnameAdminCLose;
    end;

  end  //if <>

  else
  begin
    SurnameAdminCLose;

    lblSurnameErrorAdm.Caption := '';
    edtSurnameAdmin.Font.Color := $00864D00;
  end;

  if edtSurnameAdmin.Text = '' then
    SurnameAdminCLose;
end;

procedure TfrmAdmin.edtSurnameAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.edtTotalDueChange(Sender: TObject);
begin
  if spnNumNightsAdm.Value <> pat.tblBookings['NumOfNights'] then
  begin
    bTotalDueAdm := True;
    edtTotalDue.Width := 210;
    btnTotalDue.Visible := True;
  end  //if <>

  else
  begin
    TotalDueClose;
  end;
end;

procedure TfrmAdmin.edtTotalDueClick(Sender: TObject);
begin
  HideButtonBookings;
end;

procedure TfrmAdmin.EmailAdminClose;
begin
  bEmailAdmin := False;
  edtEmailAdmin.Width := 290;
  btnEmailAdmin.Visible := False;
end;

procedure TfrmAdmin.FloorAdmClose;
begin
  bFloorAdm := False;
  spnFloor.Width := 290;
  btnFloor.Visible := False;
end;

procedure TfrmAdmin.FormClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmAdmin.FormShow(Sender: TObject);
begin
  lblMakePersonalBooking.Width := 291;

  PageControl1.TabIndex := 0;
  bStartDateClick := False;
  bNumNightsClick := False;
  bRoomIDClick := False;

//Manage Clients:
  DBGridClients.DataSource := pat.dscClients;
  pat.tblClients.Open;
  pat.tblClients.First;

  edtNameAdmin.Width := 290;
  edtSurnameAdmin.Width := 290;
  edtIDNumberAdmin.Width := 290;
  edtEmailAdmin.Width := 290;
  edtCellNumber.Width := 290;
  edtPasswordAdmin.Width := 290;
  redReviewAdmin.Height := 158;
  edtAddAdmin.Width := 290;
  edtEditReviewAdmin.Width := 290;
  ShapeActivated.Width := 85;

  lblNameErrorAdm.Caption := '';
  lblSurnameErrorAdm.Caption := '';
  lblIDErrorAdm.Caption := '';
  lblEmailErrorAdm.Caption := '';
  lblCellErrorAdm.Caption := '';
  lblPasswordErrorAdm.Caption := '';
  lblAddAdminError.Caption := '';
  lblEditReviewErrorAdmin.Caption := '';
  lblReviewErrorAdmin.Caption := '';

  HideComponents;

  lblPickClients.Visible := True;

  bSearch := False;
  bVegWheel := False;

  bSearch := False;
  lblSearchEmail.Visible := False;

  bBirthday := False;
  lblBirthdaysError.Visible := False;

//Manage Rooms:
  DBGridRooms.DataSource := pat.dscRooms;
  pat.tblRooms.Open;
  pat.tblRooms.First;

  spnFloor.Width := 290;
  edtPricePerNight.Width := 290;
  redRoomDesc.Height := 158;

  lblRoomDescE.Caption := '';

  HideComponentsRooms;

  lblPickRooms.Visible := True;

  bRooms := False;
  lblRoom.Visible := False;
  bSearchBooking := False;
  lblSearchBooking.Visible := False;

//Manage Bookings:
  pat.dscBookings.DataSet := pat.tblBookings;
  DBGridBookings.DataSource := pat.dscBookings;
  pat.tblBookings.Open;

  pat.tblClients.First;

  while not pat.tblClients.Eof do
  begin
    cmbClientCodeAdm.Items.Add(IntToStr(pat.tblClients['ClientCode']));

    pat.tblClients.Next;
  end;

  pat.tblClients.First;
  pat.tblBookings.First;

  cmbClientCodeAdm.Width := 290;
  spnNumNightsAdm.Width := 290;
  spnRoomID.Width := 290;
  edtTotalDue.Width := 290;
  DateTimeStartAdm.Width := 290;
  ShapePaid.Width := 70;

  lblStartAdmE.Caption := '';
  lblNumNightsAdmE.Caption := '';
  lblRoomIDAdmE.Caption := '';

  DateTimeStartAdm.Date := Now;

  HideComponentsBookings;

  lblPickBooking.Visible := True;

  bBookings := False;
  lblBooking.Visible := False;

//Manage Admin/Reviews:
  ReadAdmins;

  lblAddAdmin.Visible := False;
  edtAddAdmin.Visible := False;
  ShapeAddAdmin.Visible := False;

  ReadReviews;

  lblEditReviewAdmin.Visible := False;
  edtEditReviewAdmin.Visible := False;
  ShapeEditReviewAdmin.Visible := False;

//Stats
  setStats;

//
  lbl5Reviews.Visible := False;

  sReviews := redEditReviewsAdmin.Text;
end;

{Hides all the buttons for Clients tabsheet to rremove the chances of errors}
procedure TfrmAdmin.HideButton;
begin
  if bNameAdmin = False then
  begin
    edtNameAdmin.Width := 290;
    btnNameAdmin.Visible := False;
  end;

  if bSurnameAdmin = False then
  begin
    edtSurnameAdmin.Width := 290;
    btnSurnameAdmin.Visible := False;
  end;

  if bIDAdmin = False then
  begin
    edtIDNumberAdmin.Width := 290;
    btnIDAdmin.Visible := False;
  end;

  if bEmailAdmin = False then
  begin
    edtEmailAdmin.Width := 290;
    btnEmailAdmin.Visible := False;
  end;

  if bCellAdmin = False then
  begin
    edtCellNumber.Width := 290;
    btnCellNoAdmin.Visible := False;
  end;

  if bPasswordAdmin = False then
  begin
    edtPasswordAdmin.Width := 290;
    btnPasswordAdmin.Visible := False;
  end;
end;

{Hides all the buttons for Bookings tabsheet to rremove the chances of errors}
procedure TfrmAdmin.HideButtonBookings;
begin
  if bClientCodeAdm = False then
  begin
    cmbClientCodeAdm.Width := 290;
    btnClientCode.Visible := False;
  end;

  if bRoomIDAdm = False then
  begin
    spnRoomID.Width := 290;
    btnRoomID.Visible := False;
  end;

  if bNumNightsAdm = False then
  begin
    spnNumNightsAdm.Width := 290;
    btnNumOfNights.Visible := False;
  end;

  if bTotalDueAdm = False then
  begin
    edtTotalDue.Width := 290;
    btnTotalDue.Visible := False;
  end;

  if bStartDateAdm = False then
  begin
    DateTimeStartAdm.Width := 290;
    btnStartDate.Visible := False;
  end;
end;

{Hides all the buttons for Rooms tabsheet to rremove the chances of errors}
procedure TfrmAdmin.HideButtonRooms;
begin
  if bRoomDescAdm = False then
  begin
    redRoomDesc.Height := 158;
    btnRoomDesc.Visible := False;
  end;

  if bFloorAdm = False then
  begin
    spnFloor.Width := 290;
    btnSurnameAdmin.Visible := False;
  end;

  if bPricePerNightAdm = False then
  begin
    edtPricePerNight.Width := 290;
    btnPricePerNight.Visible := False;
  end;
end;

{Hides the components for Clients tabsheet if the user has not selected a record}
procedure TfrmAdmin.HideComponents;
begin
  edtNameAdmin.Visible := False;
  edtSurnameAdmin.Visible := False;
  edtIDNumberAdmin.Visible := False;
  edtEmailAdmin.Visible := False;
  edtCellNumber.Visible := False;
  edtPasswordAdmin.Visible := False;
  redReviewAdmin.Visible := False;
  edtAddAdmin.Visible := False;
  edtEditReviewAdmin.Visible := False;
  chkActivated.Visible := False;
  chkWheelAdm.Visible := False;
  chkVegAdm.Visible := False;

  ShapeNameAdmin.Visible := False;
  ShapeSurnameAdmin.Visible := False;
  ShapeIDAdmin.Visible := False;
  ShapeEmailAdmin.Visible := False;
  ShapeCellAdmin.Visible := False;
  ShapePasswordAdmin.Visible := False;
  ShapeReviewAdmin.Visible := False;
  ShapeAddAdmin.Visible := False;
  ShapeEditReviewAdmin.Visible := False;
  ShapeActivated.Visible := False;
  ShapeBool.Visible := False;

  btnNameAdmin.Visible := False;
  btnSurnameAdmin.Visible := False;
  btnIDAdmin.Visible := False;
  btnEmailAdmin.Visible := False;
  btnCellNoAdmin.Visible := False;
  btnPasswordAdmin.Visible := False;
  btnReviewAdmin.Visible := False;
  btnAddAdmin.Visible := False;
  btnEditReviewAdmin.Visible := False;
  btnActivatedAdm.Visible := False;

  lblNameAdmin.Visible := False;
  lblSurnameAdmin.Visible := False;
  lblIDAdmin.Visible := False;
  lblEmailAdmin.Visible := False;
  lblCellAdmin.Visible := False;
  lblPasswordAdmin.Visible := False;
  lblReviewAdmin.Visible := False;
  lblAddAdmin.Visible := False;
  lblEditReviewAdmin.Visible := False;
end;

{Hides the components for Bookings tabsheet if the user has not selected a record}
procedure TfrmAdmin.HideComponentsBookings;
begin
  cmbClientCodeAdm.Visible := False;
  spnRoomID.Visible := False;
  spnNumNightsAdm.Visible := False;
  edtTotalDue.Visible := False;
  DateTimeStartAdm.Visible := False;
  lblEndDateAdm.Visible := False;
  chkPaid.Visible := False;

  ShapeClientCode.Visible := False;
  ShapeRoomID.Visible := False;
  ShapeNumOfNights.Visible := False;
  ShapeTotalDue.Visible := False;
  ShapeStartDate.Visible := False;
  ShapeEndDate.Visible := False;
  ShapePaid.Visible := False;

  btnClientCode.Visible := False;
  btnRoomID.Visible := False;
  btnNumOfNights.Visible := False;
  btnTotalDue.Visible := False;
  btnStartDate.Visible := False;
  btnPaid.Visible := False;

  lblClientCode.Visible := False;
  lblRoomID.Visible := False;
  lblNumOfNights.Visible := False;
  lblTotalDue.Visible := False;
  lblStartDate.Visible := False;
  lblEndDate.Visible := False;
  lblPaid.Visible := False;

  imgDeleteBooking.Visible := False;
  ShapeDeleteBooking.Visible := False;
end;

{Hides the components for Rooms tabsheet if the user has not selected a record}
procedure TfrmAdmin.HideComponentsRooms;
begin
  redRoomDesc.Visible := False;
  spnFloor.Visible := False;
  edtPricePerNight.Visible := False;
  chkAvailable.Visible := False;

  ShapeRoomDesc.Visible := False;
  ShapeFloor.Visible := False;
  ShapePricePerNight.Visible := False;
  ShapeAvailable.Visible := False;

  btnRoomDesc.Visible := False;
  btnFloor.Visible := False;
  btnPricePerNight.Visible := False;
  btnAvailAdm.Visible := False;

  lblRoomDesc.Visible := False;
  lblFloor.Visible := False;
  lblPricePerNight.Visible := False;
  lblAvailable.Visible := False;
end;

procedure TfrmAdmin.IDAdminClose;
begin
  bIDAdmin := False;
  edtIDNumberAdmin.Width := 290;
  btnIDAdmin.Visible := False;
end;

procedure TfrmAdmin.imgBackClick(Sender: TObject);
var
  iLeave, iSure : ShortInt;
  sE1, sE2, sE3, sE4, sE5 : string;

begin
  if redEditReviewsAdmin.Lines.Count = 5 then
  begin
    iSure := MessageDlg('Are you sure you want to logout?', mtConfirmation, mbYesNo, 0);

    if iSure = mrYes then
    begin
      Self.Hide;
      frmLogin.Show;
    end;
  end

  else
  begin
    iLeave := MessageDlg('You do not have 5 reviews shown. If you leave your reviews shown will be reset. Are you sure you want to leave?', mtConfirmation, mbYesNo, 0);
    PageControl1.Pages[3].Show;

    if iLeave = mrYes then
    begin
      redEditReviewsAdmin.Text := sReviews;

      sE1 := redEditReviewsAdmin.Lines[0];
      sE2 := redEditReviewsAdmin.Lines[1];
      sE3 := redEditReviewsAdmin.Lines[2];
      sE4 := redEditReviewsAdmin.Lines[3];
      sE5 := redEditReviewsAdmin.Lines[4];

      with pat do
      begin
        tblClients.First;

        while not tblClients.Eof do
        begin
            tblClients.Edit;

          if (tblClients['Email'] = sE1) OR (tblClients['Email'] = sE2) OR
             (tblClients['Email'] = sE3) OR (tblClients['Email'] = sE4) OR
             (tblClients['Email'] = sE5) then
          begin
            tblClients['ShowReview'] := True;
          end

          else
          begin
            tblClients['ShowReview'] := False;
          end;

          tblClients.Next;
        end;
      end; //with pat

      Self.Hide;
      frmLogin.Show;
    end //if want to leave

    else
    begin
      PageControl1.TabIndex := 3;
    end;
  end;

end;

procedure TfrmAdmin.imgBackMouseEnter(Sender: TObject);
begin
  ShapeBackStd.Visible := True;
end;

procedure TfrmAdmin.imgBackMouseLeave(Sender: TObject);
begin
  ShapeBackStd.Visible := False;
end;

procedure TfrmAdmin.imgDeleteBookingClick(Sender: TObject);
var
  sBookingID : string;

begin
  sBookingID := pat.tblBookings['BookingID'];
  runSQLBooking('DELETE FROM tblBookings WHERE BookingID = ' + sBookingID);
end;

procedure TfrmAdmin.imgDeleteBookingMouseEnter(Sender: TObject);
begin
  ShapeDeleteBooking.Visible := True;
end;

procedure TfrmAdmin.imgDeleteBookingMouseLeave(Sender: TObject);
begin
  ShapeDeleteBooking.Visible := False;
end;

procedure TfrmAdmin.imgHelpAdminClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'Admin';
  frmHelp.Show;
end;

procedure TfrmAdmin.imgHelpAdminMouseEnter(Sender: TObject);
begin
  ShapeHelpAdmin.Brush.Color := $00864D00;
end;

procedure TfrmAdmin.imgHelpAdminMouseLeave(Sender: TObject);
begin
  ShapeHelpAdmin.Brush.Color := clSilver;
end;

procedure TfrmAdmin.lblBirthdayClick(Sender: TObject);
var
  sMonth, sDay : string;

begin
  if bSearch = False then
  begin
    Search;

    sMonth := '';
    sDay := '';
    bBirthday := True;

    HideComponents;
    lblPickClients.Visible := True;
    lblBirthdaysError.Visible := True;

    sMonth := Copy(DateToStr(Now), 6, 2);
    sDay := Copy(DateToStr(Now), 9, 2);

    {SQL using Mid}
    runSQLClient('SELECT * FROM tblClients WHERE Mid(ID, 3, 2) = "' + sMonth +
                 '"' + 'AND Mid(ID, 5, 2) = "' + sDay + '"');

  end

  else
    MessageDlg('Please click the DBGrid to remove your search first to see whose birthday it is', mtError, [mbOK], 0);
end;

procedure TfrmAdmin.lblBirthdayMouseEnter(Sender: TObject);
begin
  ShapeBirthday.Brush.Color := clHighlight;
end;

procedure TfrmAdmin.lblBirthdayMouseLeave(Sender: TObject);
begin
  ShapeBirthday.Brush.Color := $00864D00;
end;

procedure TfrmAdmin.lblMakePersonalBookingClick(Sender: TObject);
begin
  Self.Hide;
  frmStdUser.Show;
end;

procedure TfrmAdmin.lblMakePersonalBookingMouseEnter(Sender: TObject);
begin
  ShapeMakePersonalBooking.Brush.Color := clHighlight;
end;

procedure TfrmAdmin.lblMakePersonalBookingMouseLeave(Sender: TObject);
begin
  ShapeMakePersonalBooking.Brush.Color := $00864D00;
end;

procedure TfrmAdmin.NameAdminClose;
begin
  bNameAdmin := False;
  edtNameAdmin.Width := 290;
  btnNameAdmin.Visible := False;
end;

procedure TfrmAdmin.NumNightsClose;
begin
  bNumNightsAdm := False;
  spnNumNightsAdm.Width := 290;
  btnNumOfNights.Visible := False;
end;

procedure TfrmAdmin.PaidClose;
begin
  btnPaid.Visible := False;
  ShapePaid.Width := 70;
end;

procedure TfrmAdmin.PasswordAdminClose;
begin
  bPasswordAdmin := False;
  edtPasswordAdmin.Width := 290;
  btnPasswordAdmin.Visible := False;
end;

procedure TfrmAdmin.PricePerNightClose;
begin
  bPricePerNightAdm := False;
  edtPricePerNight.Width := 290;
  btnPricePerNight.Visible := False;
end;

procedure TfrmAdmin.ReadAdmins;
begin
  redAdmins.Lines.Clear;

  with pat do
  begin
    tblClients.First;

    while not tblClients.Eof do
    begin
      if tblClients['Admin'] = True then
      begin
        redAdmins.Lines.Add(tblClients['Email']);
      end;

      tblClients.Next;
    end;
  end;
end;

procedure TfrmAdmin.ReadReviews;
begin
  redEditReviewsAdmin.Lines.Clear;

  with pat do
  begin
    tblClients.First;

    while not tblClients.Eof do
    begin
      if tblClients['ShowReview'] = True then
      begin
        redEditReviewsAdmin.Lines.Add(tblClients['Email']);
      end;

      tblClients.Next;
    end;
  end;
end;

procedure TfrmAdmin.redReviewAdminChange(Sender: TObject);
begin
  if redReviewAdmin.Text <> pat.tblClients['Review'] then
  begin
    bReviewAdmin := True;
    redReviewAdmin.Height := 130;
    btnReviewAdmin.Visible := True;

    frmStdUser.Review(redReviewAdmin.Text);

    lblReviewErrorAdmin.Caption := sReviewE;
    redReviewAdmin.Font.Color := StringToColor(sReviewC);
  end

  else
  begin
    bReviewAdmin := False;
    redReviewAdmin.Height := 158;
    btnReviewAdmin.Visible := False;

    lblReviewErrorAdmin.Caption := '';
    redReviewAdmin.Font.Color := $00864D00;
  end;
end;

procedure TfrmAdmin.redReviewAdminClick(Sender: TObject);
begin
  HideButton;
end;

procedure TfrmAdmin.redRoomDescChange(Sender: TObject);
begin
  if redRoomDesc.Text <> pat.tblRooms['RoomDescrip'] then
  begin
    if Length(redRoomDesc.Text) > 255 then
    begin
      bRoomDescAdm := False;
      redRoomDesc.Height := 158;
      btnRoomDesc.Visible := False;
      lblRoomDescE.Caption := 'Max characters: 255';
    end

    else
    begin
      bRoomDescAdm := True;
      redRoomDesc.Height := 130;
      btnRoomDesc.Visible := True;
      lblRoomDescE.Caption := '';
    end;
  end  //if <>

  else
  begin
    RoomDescAdmClose;
  end;
end;

procedure TfrmAdmin.redRoomDescClick(Sender: TObject);
begin
  HideButtonRooms;
end;

procedure TfrmAdmin.ReviewAdminClose;
begin
  bReviewAdmin := False;
  redReviewAdmin.Height := 158;
  btnReviewAdmin.Visible := False;
end;

procedure TfrmAdmin.rgpAddRemoveClick(Sender: TObject);
begin
  case rgpAddRemove.ItemIndex of
  0: btnAddAdmin.Caption := 'Add';
  1: btnAddAdmin.Caption := 'Remove';
  end;

  lblAddAdmin.Visible := True;
  edtAddAdmin.Visible := True;
  ShapeAddAdmin.Visible := True;

  edtAddAdmin.SetFocus;
end;

procedure TfrmAdmin.rgpBookingsSortByClick(Sender: TObject);
begin
  HideComponentsBookings;

  lblPickBooking.Visible := True;
  lblBooking.Visible := True;

  case rgpBookingsSortBy.ItemIndex of
  0: runSQLBooking('SELECT * FROM tblBookings ORDER BY ClientCode');
  1: runSQLBooking('SELECT * FROM tblBookings ORDER BY RoomID');
  2: runSQLBooking('SELECT * FROM tblBookings ORDER BY NumOfNights');
  3: runSQLBooking('SELECT * FROM tblBookings ORDER BY TotalDue');
  4: runSQLBooking('SELECT * FROM tblBookings ORDER BY StartDate');
  5: runSQLBooking('SELECT * FROM tblBookings ORDER BY EndDate');
  6: runSQLBooking('SELECT * FROM tblBookings');
  end;

  bBookings := True;
end;

procedure TfrmAdmin.rgpReviewsClick(Sender: TObject);
begin
  case rgpReviews.ItemIndex of
  0: btnEditReviewAdmin.Caption := 'Add';
  1: btnEditReviewAdmin.Caption := 'Remove';
  end;

  lblEditReviewAdmin.Visible := True;
  edtEditReviewAdmin.Visible := True;
  ShapeEditReviewAdmin.Visible := True;

  edtEditReviewAdmin.SetFocus;
end;

procedure TfrmAdmin.rgpSortClick(Sender: TObject);
begin
  HideComponentsRooms;

  lblPickRooms.Visible := True;
  lblRoom.Visible := True;

  case rgpSort.ItemIndex of
  0: runSQLRooms('SELECT * FROM tblRooms ORDER BY PricePerNight DESC');
  1: runSQLRooms('SELECT * FROM tblRooms ORDER BY PricePerNight ASC');
  2: runSQLRooms('SELECT * FROM tblRooms ORDER BY Available');
  3: runSQLRooms('SELECT * FROM tblRooms ORDER BY RoomID');
  end;

  bRooms := True;
end;

procedure TfrmAdmin.RoomDescAdmClose;
begin
  bRoomDescAdm := False;
  redRoomDesc.Height := 158;
  btnRoomDesc.Visible := False;
end;

procedure TfrmAdmin.RoomIDClose;
begin
  bRoomIDAdm := False;
  spnRoomID.Width := 290;
  btnRoomID.Visible := False;
end;

procedure TfrmAdmin.runSQLBooking(sSQL: string);
begin
  pat.qryBookings.Close;
  pat.qryBookings.SQL.Clear;
  pat.qryBookings.SQL.Add(sSQL);

  if UpperCase(copy(sSQL, 1, 6)) = 'SELECT' then
  begin
    pat.qryBookings.Open;
    pat.dscBookings.DataSet := pat.qryBookings;
  end

  else
  begin
    pat.qryBookings.ExecSQL;
  end;

  pat.tblBookings.Close;
  pat.tblBookings.Open;
  DBGridBookings.Refresh;
end;

procedure TfrmAdmin.runSQLClient(sSQL: string);
begin
  pat.qryClients.Close;
  pat.qryClients.SQL.Clear;
  pat.qryClients.SQL.Add(sSQL);

  if UpperCase(copy(sSQL, 1, 6)) = 'SELECT' then
  begin
    pat.qryClients.Open;
    pat.dscClients.DataSet := pat.qryClients;
  end

  else
  begin
    pat.qryClients.ExecSQL;
    pat.tblClients.Close;
    pat.tblClients.Open;
  end;
                        
  DBGridClients.Refresh;
end;

procedure TfrmAdmin.runSQLRooms(sSQL: string);
begin
  pat.qryRooms.Close;
  pat.qryRooms.SQL.Clear;
  pat.qryRooms.SQL.Add(sSQL);

  if UpperCase(copy(sSQL, 1, 6)) = 'SELECT' then
  begin
    pat.qryRooms.Open;
    pat.dscRooms.DataSet := pat.qryRooms;
  end

  else
  begin
    pat.qryRooms.ExecSQL;
  end;

  pat.tblRooms.Close;
  pat.tblRooms.Open;
  DBGridRooms.Refresh;
end;

procedure TfrmAdmin.Search;
begin
  ShapeSearch.Visible := not ShapeSearch.Visible;
  edtSearch.Visible := not edtSearch.Visible;
  imgSearch.Visible := not imgSearch.Visible;
end;

procedure TfrmAdmin.setStats;
var
  iR1, iR2, iR3, iR4, iR5, iR6, iR7, iR8 : Integer;

begin
  chtRoomStats.Series[0].Clear;
  chtRoomStats.Title.Caption := 'Graph Showing the Amount of Times a Room has' +
                                ' been Booked';
  chtRoomStats.Title.Font.Color := clWhite;
  chtRoomStats.Title.Font.Size := 15;
  chtRoomStats.LeftAxis.Title.Caption := 'Number of Bookings';
  chtRoomStats.BottomAxis.Title.Caption := 'Room Number';

  iR1 := 0;
  iR2 := 0;
  iR3 := 0;
  iR4 := 0;
  iR5 := 0;
  iR6 := 0;
  iR7 := 0;
  iR8 := 0;

  with pat do
  begin
    tblBookings.First;

    while not tblBookings.Eof do
    begin

      case tblBookings['RoomID'] of
      1: Inc(iR1);
      2: Inc(iR2);
      3: Inc(iR3);
      4: Inc(iR4);
      5: Inc(iR5);
      6: Inc(iR6);
      7: Inc(iR7);
      8: Inc(iR8);
      end;

      tblBookings.Next;
    end;
  end;

  chtRoomStats.Series[0].Add(iR1, 'Room 1', clRed);
  chtRoomStats.Series[0].Add(iR2, 'Room 2', clBlue);
  chtRoomStats.Series[0].Add(iR3, 'Room 3', clGreen);
  chtRoomStats.Series[0].Add(iR4, 'Room 4', clYellow);
  chtRoomStats.Series[0].Add(iR5, 'Room 5', clPurple);
  chtRoomStats.Series[0].Add(iR6, 'Room 6', clBlack);
  chtRoomStats.Series[0].Add(iR7, 'Room 7', clSilver);
  chtRoomStats.Series[0].Add(iR8, 'Room 8', clWhite);
end;

{Procedures for tblClients, tblRooms & tblBookings that shows the components to
 edit when the user clicks the DBGrid}
procedure TfrmAdmin.ShowComponents;
begin
  edtNameAdmin.Visible := True;
  edtSurnameAdmin.Visible := True;
  edtIDNumberAdmin.Visible := True;
  edtEmailAdmin.Visible := True;
  edtCellNumber.Visible := True;
  edtPasswordAdmin.Visible := True;
  redReviewAdmin.Visible := True;
  chkActivated.Visible := True;
  chkWheelAdm.Visible := True;
  chkVegAdm.Visible := True;

  ShapeNameAdmin.Visible := True;
  ShapeSurnameAdmin.Visible := True;
  ShapeIDAdmin.Visible := True;
  ShapeEmailAdmin.Visible := True;
  ShapeCellAdmin.Visible := True;
  ShapePasswordAdmin.Visible := True;
  ShapeReviewAdmin.Visible := True;
  ShapeActivated.Visible := True;
  ShapeBool.Visible := True;

  lblNameAdmin.Visible := True;
  lblSurnameAdmin.Visible := True;
  lblIDAdmin.Visible := True;
  lblEmailAdmin.Visible := True;
  lblCellAdmin.Visible := True;
  lblPasswordAdmin.Visible := True;
  lblReviewAdmin.Visible := True;
end;

procedure TfrmAdmin.ShowComponentsBookings;
begin
  cmbClientCodeAdm.Visible := True;
  spnRoomID.Visible := True;
  spnNumNightsAdm.Visible := True;
  edtTotalDue.Visible := True;
  DateTimeStartAdm.Visible := True;
  lblEndDateAdm.Visible := True;
  chkPaid.Visible := True;

  ShapeClientCode.Visible := True;
  ShapeRoomID.Visible := True;
  ShapeNumOfNights.Visible := True;
  ShapeTotalDue.Visible := True;
  ShapeStartDate.Visible := True;
  ShapeEndDate.Visible := True;
  ShapePaid.Visible := True;

  lblClientCode.Visible := True;
  lblRoomID.Visible := True;
  lblNumOfNights.Visible := True;
  lblTotalDue.Visible := True;
  lblStartDate.Visible := True;
  lblEndDate.Visible := True;
  lblPaid.Visible := True;

  imgDeleteBooking.Visible := True;
end;

procedure TfrmAdmin.ShowComponentsRooms;
begin
  redRoomDesc.Visible := True;
  spnFloor.Visible := True;
  edtPricePerNight.Visible := True;
  chkAvailable.Visible := True;

  ShapeRoomDesc.Visible := True;
  ShapeFloor.Visible := True;
  ShapePricePerNight.Visible := True;
  ShapeAvailable.Visible := True;

  lblRoomDesc.Visible := True;
  lblFloor.Visible := True;
  lblPricePerNight.Visible := True;
  lblAvailable.Visible := True;
end;

procedure TfrmAdmin.spnNumNightsAdmChange(Sender: TObject);
begin
  if spnNumNightsAdm.Value <> pat.tblBookings['NumOfNights'] then
  begin
    bNumNightsAdm := True;
    spnNumNightsAdm.Width := 210;
    btnNumOfNights.Visible := True;

    AvailAdm;
  end  //if <>

  else
  begin
    NumNightsClose;
  end;
end;

procedure TfrmAdmin.spnNumNightsAdmClick(Sender: TObject);
begin
  bNumNightsClick := True;
  HideButtonBookings;
end;

procedure TfrmAdmin.spnClientCodeAdmClick(Sender: TObject);
begin
  HideButtonBookings;
end;

procedure TfrmAdmin.spnFloorChange(Sender: TObject);
begin
  if spnFloor.Value <> pat.tblRooms['Floor'] then
  begin
    bFloorAdm := True;
    spnFloor.Width := 210;
    btnFloor.Visible := True;
  end  //if <>

  else
  begin
    FloorAdmClose;
  end;
end;

procedure TfrmAdmin.spnFloorClick(Sender: TObject);
begin
  HideButtonRooms;
end;

procedure TfrmAdmin.spnRoomIDChange(Sender: TObject);
begin
  if spnRoomID.Value <> pat.tblBookings['RoomID'] then
  begin
    bRoomIDAdm := True;
    spnRoomID.Width := 210;
    btnRoomID.Visible := True;

    AvailAdm;
  end  //if <>

  else
  begin
    RoomIDClose;
  end;
end;

procedure TfrmAdmin.spnRoomIDClick(Sender: TObject);
begin
  bRoomIDClick := True;
  HideButtonBookings;
end;

procedure TfrmAdmin.StartDateClose;
begin
  bStartDateAdm := False;
  DateTimeStartAdm.Width := 290;
  btnStartDate.Visible := False;
end;

procedure TfrmAdmin.SurnameAdminClose;
begin
  bSurnameAdmin := False;
  edtSurnameAdmin.Width := 290;
  btnSurnameAdmin.Visible := False;
end;

procedure TfrmAdmin.TotalDueClose;
begin
  bTotalDueAdm := False;
  edtTotalDue.Width := 290;
  btnTotalDue.Visible := False;
end;

end.
