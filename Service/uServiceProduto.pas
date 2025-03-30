unit uServiceProduto;

interface
uses System.Generics.Collections,uProduto, uRepositoryProduto;

 type
 TServiceProduto = class
 public
 class function buscarTodos() : TList<TProduto>;
 class  procedure SalvarProduto(produto : TProduto);

 end;



implementation

{ TServiceProduto }

class function TServiceProduto.buscarTodos: TList<TProduto>;
var
 uRepositoryProduto : TRepositoryProduto;
begin
  try
    uRepositoryProduto := TRepositoryProduto.Create;

   Result :=  uRepositoryProduto.buscarTodos;

  finally
  uRepositoryProduto.Free;

  end;
end;

class procedure TServiceProduto.SalvarProduto(produto: TProduto);
var
 uRepositoryProduto : TRepositoryProduto;
begin
  try
    uRepositoryProduto := TRepositoryProduto.Create;

    uRepositoryProduto.SalvarProduto(produto);

  finally
  uRepositoryProduto.Free;

  end;

end;

end.
