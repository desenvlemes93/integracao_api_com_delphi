unit uProduto;

interface

uses
   System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TProduto = class
  private
    FDesconto: Double;
    FEstoque: Double;
    FId: Integer;
    FNome: string;
    FPreco: Double;
  published
   constructor Create(const AId : Int64; ANome: string; ADesconto, AEstoque, APreco: Double );
    property Desconto: Double read FDesconto write FDesconto;
    property Estoque: Double read FEstoque write FEstoque;
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Preco: Double read FPreco write FPreco;
end;
  
implementation

{ TProduto }

constructor TProduto.Create(const AId: Int64; ANome: string; ADesconto,
  AEstoque, APreco: Double);
begin
  FId := AId;
  FNome := ANome;
  FDesconto := ADesconto;
  FEstoque := AEstoque;
  FPreco := APreco;
  end;

end.
