unit dm;

interface

uses
  SysUtils, Classes, ADODB, DB, clsValidation;

type
  Tpat = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conBooking: TADOConnection;                     // Public DB Connection Components
    tblBookings, tblClients, tblRooms: TADOTable;
    dscBookings, dscClients, dscRooms: TDataSource;
    qryBookings, qryClients, qryRooms: TADOQuery;

    // Public Object for validation
    objValidate : TValidate;

  end;

var
  pat: Tpat;

implementation

{$R *.dfm}

procedure Tpat.DataModuleCreate(Sender: TObject);
begin

  // Create ADOConnection dynamically (Dynamic Instantiation)
  conBooking := TADOConnection.Create(pat);

  // Create ADOTables / DataSources dynamically (Dynamic Instantiation)
  tblBookings := TADOTable.Create(pat);
  dscBookings := TDataSource.Create(pat);
  qryBookings := TADOQuery.Create(pat);

  tblClients := TADOTable.Create(pat);
  dscClients := TDataSource.Create(pat);
  qryClients := TADOQuery.Create(pat);

  tblRooms := TADOTable.Create(pat);
  dscRooms := TDataSource.Create(pat);
  qryRooms := TADOQuery.Create(pat);

  // Connect to Backend DB

  conBooking.Close;
  conBooking.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
    + ExtractFilePath(ParamStr(0))
    + 'AccomBookingDB.mdb' + ';Persist Security Info=False';
  conBooking.LoginPrompt := False;
  conBooking.Open;

  // Assign ADOTables to respective tables in backend db

  tblBookings.Connection := conBooking;
  tblBookings.TableName := 'tblBookings';
  dscBookings.DataSet := tblBookings;
  qryBookings.Connection := conBooking;

  tblClients.Connection := conBooking;
  tblClients.TableName := 'tblClients';
  dscClients.DataSet := tblClients;
  qryClients.Connection := conBooking;

  tblRooms.Connection := conBooking;
  tblRooms.TableName := 'tblRooms';
  dscRooms.DataSet := tblRooms;
  qryRooms.Connection := conBooking;

  // Open tables for access in the frontend
  tblBookings.Open;
  tblClients.Open;
  tblRooms.Open;

  // Instantiate public Validation object
  objValidate := TValidate.Create;

end;

end.
