unit ContactDetails_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, ShellAPI, jpeg;

type
  TfrmContactDetails = class(TForm)
    imgFacebookC: TImage;
    imgInstagramC: TImage;
    imgContact: TImage;
    imgWhatsappC: TImage;
    imgYoutubeC: TImage;
    lblContactUsC: TLabel;
    lblEmailC: TLabel;
    lblPhoneC: TLabel;
    lblText1C: TLabel;
    lblText2C: TLabel;
    ShapeFacebookC: TShape;
    ShapeInstagramC: TShape;
    ShapeWhatsAppC: TShape;
    ShapeYouTubeC: TShape;
    ShapeBackC: TShape;
    imgBackC: TImage;
    procedure imgWhatsappCMouseEnter(Sender: TObject);
    procedure imgWhatsappCMouseLeave(Sender: TObject);
    procedure imgFacebookCMouseEnter(Sender: TObject);
    procedure imgFacebookCMouseLeave(Sender: TObject);
    procedure imgInstagramCMouseEnter(Sender: TObject);
    procedure imgInstagramCMouseLeave(Sender: TObject);
    procedure imgYoutubeCMouseEnter(Sender: TObject);
    procedure imgYoutubeCMouseLeave(Sender: TObject);
    procedure imgWhatsappCClick(Sender: TObject);
    procedure imgFacebookCClick(Sender: TObject);
    procedure imgInstagramCClick(Sender: TObject);
    procedure imgYoutubeCClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBackCClick(Sender: TObject);
    procedure imgBackCMouseEnter(Sender: TObject);
    procedure imgBackCMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContactDetails: TfrmContactDetails;

  iForm :  ShortInt;

implementation

uses
  StandardUser_U, ViewHistory_U, SleepnSnore_U, Login_U;

{$R *.dfm}

procedure TfrmContactDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmContactDetails.imgBackCClick(Sender: TObject);
begin
  case iForm of
  0: begin
       Self.Hide;
       frmStdUser.Show;
     end;

  1: begin
       Self.Hide;
       frmHistory.Show;
     end;

  3 : begin
        Self.Hide;
        frmSleepnSnore.Show;
      end;

  4 : begin
        Self.Hide;
        frmLogin.Show;
      end;
  end;
end;

procedure TfrmContactDetails.imgBackCMouseEnter(Sender: TObject);
begin
  ShapeBackC.Visible := True;
end;

procedure TfrmContactDetails.imgBackCMouseLeave(Sender: TObject);
begin
  ShapeBackC.Visible := False;
end;

procedure TfrmContactDetails.imgFacebookCClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://facebook.com'), nil, nil, SW_NORMAL);
end;

procedure TfrmContactDetails.imgFacebookCMouseEnter(Sender: TObject);
begin
  ShapeFacebookC.Visible := True;
end;

procedure TfrmContactDetails.imgFacebookCMouseLeave(Sender: TObject);
begin
  ShapeFacebookC.Visible := False;
end;

procedure TfrmContactDetails.imgInstagramCClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://www.instagram.com'), nil, nil, SW_NORMAL);
end;

procedure TfrmContactDetails.imgInstagramCMouseEnter(Sender: TObject);
begin
  ShapeInstagramC.Visible := True;
end;

procedure TfrmContactDetails.imgInstagramCMouseLeave(Sender: TObject);
begin
  ShapeInstagramC.Visible := False;
end;

procedure TfrmContactDetails.imgWhatsappCClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://wa.me/27820903311'), nil, nil, SW_NORMAL);
end;

procedure TfrmContactDetails.imgWhatsappCMouseEnter(Sender: TObject);
begin
  ShapeWhatsAppC.Visible := True;
end;

procedure TfrmContactDetails.imgWhatsappCMouseLeave(Sender: TObject);
begin
  ShapeWhatsAppC.Visible := False;
end;

procedure TfrmContactDetails.imgYoutubeCClick(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', PChar('https://www.youtube.com/watch?v=xvFZjo5PgG0'), nil, nil, SW_NORMAL);
end;

procedure TfrmContactDetails.imgYoutubeCMouseEnter(Sender: TObject);
begin
  ShapeYouTubeC.Visible := True;
end;

procedure TfrmContactDetails.imgYoutubeCMouseLeave(Sender: TObject);
begin
  ShapeYouTubeC.Visible := False;
end;

end.
