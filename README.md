# HANDS-ON [SEGFY]
## Informações gerais

A seguinte API é responsável por realizar a busca de veículos no site Napista utilizando a Gem Mechanize!

Desenvolvido por [Juliano Rohde](https://github.com/julianorohde).

## Requisitos

* Ruby 3.2.2 e Rails 7.1.2;
* Clonar o repositório: https://github.com/julianorohde/hands-on-segfy;
* Criar o banco de dados de testes (`rails db:create`), caso queira rodar os testes desenvolvidos utilizando RSpec.

## Como utilizar o Crawler
1. Entre no rails console utilizando o comando `rails c`.
2. Para iniciarmos o Crawler, precisamos chamar ele: `Crawler.search_cars(city: insira a cidade, state: insira o Estado)`.

   O Crawler foi desenvolvido para ser utilizado e buscar qualquer cidade e estado, exemplo:

       Crawler.search_cars(city: 'Francisco Beltrão', state: 'PR')

   O retorno previsto é um array de objetos, que deverá mostrar o `modelo do carro`, `marca`, `ano`, `valor` e o `local_path da imagem`. Adicionalmente aparecerá a `cidade` e o `estado` do veículo, a fim de confirmar se a cidade informada na chamada do Crawler está correta:

      ```
      [{:modelo=>"308 Active 1.6 Flex 16v 5p Mec.",
        :marca=>"Peugeot",
        :ano=>2014,
        :valor=>43500,
        :cidade=>"Francisco Beltrão",
        :estado=>"Paraná",
        :local_path=>"https://napista.com.br/static/photos/8a29a910-767d-448f-a5be-56da928d44dd_ac485c7d-0d74-4e1e-809a-216536a93136"},
       {:modelo=>"Voyage 1.6 Msi Flex 8v 4p",
        :marca=>"Volkswagen",
        :ano=>2022,
        :valor=>63500,
        :cidade=>"Francisco Beltrão",
        :estado=>"Paraná",
        :local_path=>"https://napista.com.br/static/photos/eb9322b7-d8ac-4f39-bf01-9271a44cf05e_8e836e36-91c1-4ddc-a390-b719cc433b0d"}]
      ```

## Como rodar os testes RSpec
1. Criar o banco de dados de testes utilizando o comando `rails db:create`.
2. Rodar `rspec` no terminal, o resultado deve ser:

   ```
   Finished in 3.64 seconds (files took 1.38 seconds to load)
   5 examples, 0 failures
   ```
### 