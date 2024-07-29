unit ViewHistory_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, StdCtrls, Grids, DBGrids;

type
  TfrmHistory = class(TForm)
    DBGridViewHistory: TDBGrid;
    imgBackHistory: TImage;
    ShapeBackHist: TShape;
    lblViewHistory: TLabel;
    imgLogo: TImage;
    lblDeleteStd: TLabel;
    ShapeLine: TShape;
    imgHistBackground: TImage;
    imgNext: TImage;
    imgHelpHistory: TImage;
    ShapeHelpHistory: TShape;
    ShapeNext: TShape;
    procedure FormShow(Sender: TObject);
    procedure imgBackHistoryMouseEnter(Sender: TObject);
    procedure imgBackHistoryMouseLeave(Sender: TObject);
    procedure imgBackHistoryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgNextClick(Sender: TObject);
    procedure imgNextMouseEnter(Sender: TObject);
    procedure imgNextMouseLeave(Sender: TObject);
    procedure imgHelpHistoryMouseEnter(Sender: TObject);
    procedure imgHelpHistoryMouseLeave(Sender: TObject);
    procedure imgHelpHistoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getClientCode;
    procedure checkBooking;
    procedure runSQL(sSQL: string);
  end;

var
  frmHistory: TfrmHistory;
  sCode : ShortString;
  bExist : Boolean;

implementation

uses
  dm, StandardUser_U, ContactDetails_U, Help_U;

{$R *.dfm}

procedure TfrmHistory.checkBooking;
begin
  with pat do
  begin
    tblBookings.First;

    while not tblBookings.Eof do
    begin
      if tblBookings['ClientCode'] = sCode then
      begin
        bExist := True;
      end;

      tblBookings.Next;
    end;
  end;
end;

procedure TfrmHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmHistory.FormShow(Sender: TObject);
begin
  DBGridViewHistory.DataSource := pat.dscRooms;
  pat.tblRooms.Open;

  {SQL using 2 tables}
  runSQL('SELECT  BookingID, tblRooms.RoomID, NumOfNights, TotalDue, StartDate, ' +
         'EndDate, Floor, PricePerNight FROM tblBookings, tblRooms WHERE' +
         '(tblBookings.RoomID = tblRooms.RoomID) AND ' +
         '(tblBookings.ClientCode = ' + sCode + ') ORDER BY BookingID');

end;

procedure TfrmHistory.getClientCode;
var
   sSearch : string;

begin
  sSearch := frmStdUser.edtEmailStd.Text;

  pat.qryBookings.Close;
  pat.qryBookings.SQL.Clear;
  pat.qryBookings.SQL.Add('SELECT * FROM tblClients WHERE Email = "' + sSearch + '"');
  pat.qryBookings.Open;

  sCode := IntToStr(pat.qryBookings['ClientCode']);
end;

procedure TfrmHistory.imgBackHistoryClick(Sender: TObject);
begin
  Self.Hide;
  frmStdUser.Show;
end;

procedure TfrmHistory.imgBackHistoryMouseEnter(Sender: TObject);
begin
  ShapeBackHist.Visible := True;
end;

procedure TfrmHistory.imgBackHistoryMouseLeave(Sender: TObject);
begin
  ShapeBackHist.Visible := False;
end;

procedure TfrmHistory.imgHelpHistoryClick(Sender: TObject);
begin
  Self.Enabled := False;
  sHelpForm := 'History';
  frmHelp.Show;
end;

procedure TfrmHistory.imgHelpHistoryMouseEnter(Sender: TObject);
begin
  ShapeHelpHistory.Brush.Color := $00864D00;
end;

procedure TfrmHistory.imgHelpHistoryMouseLeave(Sender: TObject);
begin
  ShapeHelpHistory.Brush.Color := clSilver;
end;

procedure TfrmHistory.imgNextClick(Sender: TObject);
begin
  Self.Hide;
  iForm := 1;
  frmContactDetails.Show;
end;

procedure TfrmHistory.imgNextMouseEnter(Sender: TObject);
begin
  ShapeNext.Visible := True;
end;

procedure TfrmHistory.imgNextMouseLeave(Sender: TObject);
begin
  ShapeNext.Visible := False;
end;

procedure TfrmHistory.runSQL(sSQL: string);
begin
  with pat do
  begin
    qryBookings.Close;
    qryRooms.Close;

    qryBookings.SQL.Clear;
    qryRooms.SQL.Clear;

    qryBookings.SQL.Add(sSQL);
    qryRooms.SQL.Add(sSQL);


    if UpperCase(copy(sSQL, 1, 6)) = 'SELECT' then
    begin
      qryBookings.Open;
      qryRooms.Open;

      dscBookings.DataSet := qryBookings;
      dscRooms.DataSet := qryRooms;
    end

    else
    begin
      qryBookings.ExecSQL;
      qryRooms.ExecSQL;
    end;

    tblBookings.Close;
    tblRooms.Close;

    tblBookings.Open;
    tblRooms.Open;

    DBGridViewHistory.Refresh;
  end;
end;

end.
