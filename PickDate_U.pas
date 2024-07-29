unit PickDate_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, jpeg, ExtCtrls, pngimage;

type
  TfrmPickDate = class(TForm)
    lblStart: TLabel;
    DTPStartPick: TDateTimePicker;
    lblNumDays: TLabel;
    spnNumDaysPick: TSpinEdit;
    imgPickDate: TImage;
    imgBackPick: TImage;
    ShapeBackPick: TShape;
    imgLogo: TImage;
    lblPickDateText: TLabel;
    lblPlease: TLabel;
    procedure DTPStartPickChange(Sender: TObject);
    procedure spnNumDaysPickChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBackPickMouseEnter(Sender: TObject);
    procedure imgBackPickMouseLeave(Sender: TObject);
    procedure imgBackPickClick(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartDate;
    procedure NumDays;
  end;

var
  frmPickDate: TfrmPickDate;

  btnContinue: TButton;

  tStartDate, tEndDate: TDateTime;
  bStartDate, bPick : Boolean;

implementation

uses
  SleepnSnore_U, StandardUser_U, Login_U;

{$R *.dfm}

{ TfrmPickDate }

procedure TfrmPickDate.btnContinueClick(Sender: TObject);
begin
  NumDays;
  Self.Hide;
  frmSleepnSnore.Show;
  btnContinue.Destroy;
end;

procedure TfrmPickDate.DTPStartPickChange(Sender: TObject);
begin
  lblPlease.Visible := False;
  bPick := True;
  tStartDate := DTPStartPick.Date;
  StartDate;
end;

procedure TfrmPickDate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPickDate.FormShow(Sender: TObject);
begin
  btnContinue := TButton.Create(frmPickDate);

  with btnContinue do
  begin
    Left := 364;
    Top := 228;
    Height := 25;
    Width := 75;
    Caption := 'Continue';
    Parent := frmPickDate;
    OnClick := btnContinueClick;
  end;

  bStartDate := False;
  bPick := False;

  iNumDays := 1;

  btnContinue.Visible := False;
  DTPStartPick.Date := Now + 1;
  spnNumDaysPick.Value := 1;
  spnNumDaysPick.Visible := False;
  lblPlease.Visible := True;
end;

procedure TfrmPickDate.imgBackPickClick(Sender: TObject);
var
  iMes : ShortInt;

begin
  iMes := MessageDlg('Are you sure you want to quit? All your changes will be lost', mtWarning, mbYesNo, 0);

  if iMes = mrYes then
  begin
    if bLogin = True then
    begin
      Self.Hide;
      frmStdUser.Show;
      btnContinue.Destroy;
    end

    else
    begin
      Self.Hide;
      frmLogin.Show;
      btnContinue.Destroy;
    end;
  end;
end;

procedure TfrmPickDate.imgBackPickMouseEnter(Sender: TObject);
begin
  ShapeBackPick.Visible := True;
end;

procedure TfrmPickDate.imgBackPickMouseLeave(Sender: TObject);
begin
  ShapeBackPick.Visible := False;
end;

procedure TfrmPickDate.NumDays;
begin
  tEndDate := tStartDate + iNumDays;

  if bPick = True then
  begin
    if (bStartDate = True) then
    begin
      btnContinue.Visible := True;
    end;
  end;

  frmSleepnSnore.CheckAvailable;
end;

procedure TfrmPickDate.spnNumDaysPickChange(Sender: TObject);
begin
  bPick := True;
  iNumDays := spnNumDaysPick.Value;
  NumDays;
end;

{User selects their Start Date, which cannot be before the current date, and the
 number of days they staying}
procedure TfrmPickDate.StartDate;
begin
  if (tStartDate < Now) OR (tStartDate = Now - 1) then
  begin
    MessageDlg('Please Select a Day from Today Onwards', mtError, [mbOK], 0);
    DTPStartPick.Date := Now + 1;
    spnNumDaysPick.Visible := False;
    btnContinue.Visible := False;
  end

  else
  begin
    frmSleepnSnore.CheckAvailable;

    if bPick = True then
    begin
      bStartDate := True;
      spnNumDaysPick.Visible := True;

      if (bStartDate = True) then
      begin
        btnContinue.Visible := True;
      end;
    end

  end;

end;

end.
