unit uRepositoryProduto;

interface
 uses REST.Types, Vcl.Dialogs, REST.Client, Data.Bind.Components,  Data.Bind.ObjectScope, IdHTTP, IdSSL, IdSSLOpenSSL, System.SysUtils, System.JSON, System.Generics.Collections,uProduto,System.Classes;

 type
 TRepositoryProduto = class
 public
 function buscarTodos() : TList<TProduto>;
 procedure SalvarProduto(produto : TProduto);


 end;
implementation


{ TRepositoryProduto }

function TRepositoryProduto.buscarTodos: TList<TProduto>;
var
  HttpClient: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  Response: string;
  JsonArray: TJSONArray;
  JsonObject: TJSONObject;
  I: Integer;
  produtos : TList<TProduto>;
begin
 HttpClient := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  produtos := TList<TProduto>.Create;
  try
    // Configurando o cliente HTTP para suportar HTTPS
    HttpClient.IOHandler := SSLHandler;


    try
      // Enviar requisição GET para o endpoint
      Response := HttpClient.Get('http://192.168.56.1:8080/api/produtos');

      // Exibir a resposta como texto


      // Supondo que a resposta seja um array JSON
      JsonArray := TJSONArray.ParseJSONValue(Response) as TJSONArray;
      if Assigned(JsonArray) then
      begin
        try
          // Iterando sobre os objetos do array JSON
          for I := 0 to JsonArray.Count - 1 do
          begin
            JsonObject := JsonArray.Items[I] as TJSONObject;

            // Acessando os campos de cada objeto
           produtos.add(TProduto.Create(JsonObject.GetValue<Integer>('id'),JsonObject.GetValue<String>('nome'),JsonObject.GetValue<Double>('desconto'),JsonObject.GetValue<Double>('estoque'),JsonObject.GetValue<Double>('preco')));
          end;

        Result := produtos;
        finally
          JsonArray.Free;
        end;
      end;
    except
      on E: Exception do

    end;

  finally
    // Libere os objetos criados
    HttpClient.Free;
    SSLHandler.Free;
  end;

end;

procedure TRepositoryProduto.SalvarProduto(produto : TProduto);
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
  RestResponse: TRESTResponse;
  JsonObject: TJSONObject;
begin
  // Criar instâncias do TRESTClient, TRESTRequest e TRESTResponse
  RestClient := TRESTClient.Create('http://192.168.56.1:8080/api/produtos');
  RestRequest := TRESTRequest.Create(nil);
  RestResponse := TRESTResponse.Create(nil);

  try
    // Associar o RestRequest com o RestClient e RestResponse
    RestRequest.Client := RestClient;
    RestRequest.Response := RestResponse;

    // Definir o método como POST
    RestRequest.Method := rmPOST;

    // Criando o JSON com os dados do Produto
    JsonObject := TJSONObject.Create;
    try
      JsonObject.AddPair('id', produto.Id);
      JsonObject.AddPair('nome', produto.Nome);
      JsonObject.AddPair('estoque', produto.Estoque);
      JsonObject.AddPair('preco', produto.Preco);

      // Adicionar o JSON como corpo da requisição
      RestRequest.Body.Add(JsonObject.ToString, TRESTContentType.ctAPPLICATION_JSON);

      // Executar a requisição
      RestRequest.Execute;
    finally

    end;
  finally

  end;

end;

end.
