program SleepnSnore_P;

uses
  Forms,
  SleepnSnore_U in 'SleepnSnore_U.pas' {frmSleepnSnore},
  dm in 'dm.pas' {pat: TDataModule},
  Admin_U in 'Admin_U.pas' {frmAdmin},
  StandardUser_U in 'StandardUser_U.pas' {frmStdUser},
  CreateAccount_U in 'CreateAccount_U.pas' {frmRegister},
  Help_U in 'Help_U.pas' {frmHelp},
  clsValidation in 'clsValidation.pas',
  Login_U in 'Login_U.pas' {frmLogin},
  Booking_U in 'Booking_U.pas' {frmBooking},
  PickDate_U in 'PickDate_U.pas' {frmPickDate},
  ViewHistory_U in 'ViewHistory_U.pas' {frmHistory},
  ContactDetails_U in 'ContactDetails_U.pas' {frmContactDetails},
  Revenue_U in 'Revenue_U.pas' {frmRevenue};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSleepnSnore, frmSleepnSnore);
  Application.CreateForm(Tpat, pat);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmStdUser, frmStdUser);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmBooking, frmBooking);
  Application.CreateForm(TfrmPickDate, frmPickDate);
  Application.CreateForm(TfrmHistory, frmHistory);
  Application.CreateForm(TfrmContactDetails, frmContactDetails);
  Application.CreateForm(TfrmRevenue, frmRevenue);
  Application.Run;
end.
