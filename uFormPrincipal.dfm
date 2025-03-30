object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro Produto'
  ClientHeight = 510
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 67
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 8
    Top = 119
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 201
    Top = 119
    Width = 42
    Height = 15
    Caption = 'Estoque'
  end
  object Label4: TLabel
    Left = 249
    Top = 119
    Width = 30
    Height = 15
    Caption = 'Pre'#231'o'
  end
  object Label5: TLabel
    Left = 297
    Top = 119
    Width = 50
    Height = 15
    Caption = 'Desconto'
  end
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
  end
  object edtId: TEdit
    Left = 8
    Top = 88
    Width = 65
    Height = 25
    Enabled = False
    TabOrder = 2
  end
  object edtNome: TEdit
    Left = 8
    Top = 140
    Width = 187
    Height = 25
    TabOrder = 3
  end
  object edtEstoque: TEdit
    Left = 201
    Top = 140
    Width = 42
    Height = 25
    TabOrder = 4
    Text = '0'
  end
  object edtPreco: TEdit
    Left = 249
    Top = 140
    Width = 42
    Height = 25
    TabOrder = 5
    Text = '0'
  end
  object edtDesconto: TEdit
    Left = 297
    Top = 140
    Width = 42
    Height = 23
    TabOrder = 6
    Text = '0'
    StyleName = 'edtDesconto'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 192
    Width = 769
    Height = 265
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object cdsProduto: TClientDataSet
    PersistDataPacket.Data = {
      6D0000009619E0BD0100000018000000050000000000030000006D0002496404
      00010000000000044E6F6D650100490000000100055749445448020002005000
      074573746F717565080004000000000005707265636F08000400000000000864
      6573636F6E746F08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 32
    object cdsProdutoId: TIntegerField
      FieldName = 'Id'
    end
    object cdsProdutoNome: TStringField
      FieldName = 'Nome'
      Size = 80
    end
    object cdsProdutoEstoque: TFloatField
      FieldName = 'Estoque'
    end
    object cdsProdutopreco: TFloatField
      FieldName = 'preco'
    end
    object cdsProdutodesconto: TFloatField
      FieldName = 'desconto'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsProduto
    Left = 568
    Top = 96
  end
end
