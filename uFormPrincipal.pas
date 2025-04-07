unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Datasnap.DBClient,System.Generics.Collections,uProduto,uServiceProduto;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtId: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtEstoque: TEdit;
    Label3: TLabel;
    edtPreco: TEdit;
    Label4: TLabel;
    edtDesconto: TEdit;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    cdsProduto: TClientDataSet;
    cdsProdutoId: TIntegerField;
    cdsProdutoNome: TStringField;
    cdsProdutoEstoque: TFloatField;
    cdsProdutopreco: TFloatField;
    cdsProdutodesconto: TFloatField;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    procedure BuscarTodosProdutos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.BuscarTodosProdutos;
var
  serviceProduto : TServiceProduto;
  listaProduto: TList<TProduto>;
  i: integer;

begin
  serviceProduto := TServiceProduto.Create;
  listaProduto := TList<TProduto>.Create;
  try
  listaProduto :=   serviceProduto.buscarTodos();

   for i := 0 to  listaProduto.Count - 1  do
   begin
    cdsProduto.Append;
    cdsProdutoId.AsInteger := listaProduto.Items[i].Id;
    cdsProdutoNome.AsString := listaProduto.Items[i].Nome;
    cdsProdutoEstoque.AsFloat := listaProduto.Items[i].Estoque;
    cdsProdutopreco.AsFloat := listaProduto.Items[i].Preco;
    cdsProdutodesconto.AsFloat := listaProduto.Items[i].Desconto;
    cdsProduto.Post;
   end;

  finally
    serviceProduto.Free;

  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
 serviceProduto : TServiceProduto;
 produto: TProduto;
begin
 try
   if StrToIntDef(edtId.Text,0) = 0  then
   begin
     produto := TProduto.Create(0,'',0,0,0);
     serviceProduto := TServiceProduto.Create;
     produto.Id :=  StrToIntDef(edtId.Text,0);
     produto.Nome := edtNome.Text;
     produto.Preco := StrToFloat(edtPreco.Text);
     produto.Estoque := StrToFloat(edtEstoque.Text);
     produto.Desconto := StrToFloat(edtDesconto.Text);

     serviceProduto.SalvarProduto(produto);
     cdsProduto.EmptyDataSet;
    BuscarTodosProdutos
   end;
 finally
 serviceProduto.Free;

 end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  cdsProduto.EmptyDataSet;
  BuscarTodosProdutos;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
 if not DBGrid1.DataSource.DataSet.IsEmpty then
 begin
   edtId.Text := DBGrid1.DataSource.DataSet.FieldByName('id').AsString;
   edtNome.Text := DBGrid1.DataSource.DataSet.FieldByName('nome').AsString;
   edtEstoque.Text  :=  DBGrid1.DataSource.DataSet.FieldByName('estoque').AsString;
   edtPreco.Text :=  DBGrid1.DataSource.DataSet.FieldByName('preco').AsString;
   edtDesconto.Text := DBGrid1.DataSource.DataSet.FieldByName('desconto').AsString;
 end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  BuscarTodosProdutos;
end;

end.
