object frmEULA: TfrmEULA
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Terms & Conditions'
  ClientHeight = 661
  ClientWidth = 534
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEULA: TLabel
    Left = 30
    Top = 6
    Width = 474
    Height = 49
    Caption = 'End-User License Agreement'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -40
    Font.Name = 'Calibri'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lblLastEdited: TLabel
    Left = 30
    Top = 61
    Width = 114
    Height = 24
    Caption = 'lblLastEdited'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object redEULA: TRichEdit
    Left = 30
    Top = 91
    Width = 474
    Height = 539
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
end
