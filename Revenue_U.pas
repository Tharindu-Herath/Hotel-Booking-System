unit Revenue_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, pngimage, ExtCtrls, jpeg;

type
  TfrmRevenue = class(TForm)
    lblRoomRev: TLabel;
    dbgRev: TDBGrid;
    imgStatsBack: TImage;
    ShapeBackRev: TShape;
    imgBackRev: TImage;
    rgpRev: TRadioGroup;
    edtAmount: TEdit;
    btnAmount: TButton;
    lblAmount: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBackRevMouseEnter(Sender: TObject);
    procedure imgBackRevMouseLeave(Sender: TObject);
    procedure imgBackRevClick(Sender: TObject);
    procedure rgpRevClick(Sender: TObject);
    procedure btnAmountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure runSQLRev(sSQL : string);
    procedure EachRoom;
  end;

var
  frmRevenue: TfrmRevenue;

implementation

uses
  dm, Admin_U;

{$R *.dfm}

{ TfrmRevenue }

procedure TfrmRevenue.btnAmountClick(Sender: TObject);
var
  sSpecific : string;

begin
  sSpecific := edtAmount.Text;

  if Length(sSpecific) > 0 then
    runSQLRev('SELECT RoomID, FORMAT(SUM(TotalDue), "CURRENCY") FROM tblBookings GROUP BY RoomID HAVING SUM(TotalDue) > ' + sSpecific)

  else
    MessageDlg('Please input the amount you want to filter by', mtError, [mbOK], 0);
end;

procedure TfrmRevenue.EachRoom;
begin
  dbgRev.DataSource := pat.dscBookings;
  pat.tblBookings.Open;

  runSQLRev('SELECT RoomID, FORMAT(SUM(TotalDue), "CURRENCY") AS [Total Revenue Earned] FROM tblBookings WHERE Paid = True GROUP BY RoomID')
end;

procedure TfrmRevenue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmRevenue.FormShow(Sender: TObject);
begin
  EachRoom;
  rgpRev.ItemIndex := 0;
  lblAmount.Visible := False;
  edtAmount.Visible := False;
  btnAmount.Visible := False;
end;

procedure TfrmRevenue.imgBackRevClick(Sender: TObject);
begin
  runSQLRev('SELECT * FROM tblBookings');
  Self.Hide;
  frmAdmin.Show;
end;

procedure TfrmRevenue.imgBackRevMouseEnter(Sender: TObject);
begin
  ShapeBackRev.Visible := True;
end;

procedure TfrmRevenue.imgBackRevMouseLeave(Sender: TObject);
begin
  ShapeBackRev.Visible := False;
end;

procedure TfrmRevenue.rgpRevClick(Sender: TObject);
begin
  case rgpRev.ItemIndex of
  0:
    begin
      EachRoom;
      lblAmount.Visible := False;
      edtAmount.Visible := False;
      btnAmount.Visible := False;
    end;

  1:
    begin
      lblAmount.Visible := True;
      edtAmount.Visible := True;
      btnAmount.Visible := True;
    end;
  end;
end;

procedure TfrmRevenue.runSQLRev(sSQL: string);
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
  dbgRev.Refresh;
end;

end.
