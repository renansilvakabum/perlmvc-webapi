## Manager WebAPI

<br>

# Documentação

## Dirétorio Inicial

### Startup.cgi
> Este serve como ponto de entrada para todas as requisições na WebAPI, nele é possível interceptar as requisições através de Middlewares, e aplicar regras negócios que possam servir para uma ou mais rotas.Também é realizado o Autoload das bibliotecas padrões do projeto e da Aplicação a ser executada.

<br>

### Routes.cgi
> Nele é possível registrar todas as rotas da WebAPI. <br>
> Para registar uma rota, deve ser informado o Verbo HTTP, URI de acesso, Módulo, Versão da Aplicação, Nome da Aplicação e restrição de acesso.

## app/

### Modules
> Cada módulo representa uma área de depertamento da aplicação

### Versions
> Cada versão representa um conjunto de aplicações, que compartilham os mesmos dominios e repositórios.

### Applications
> Uma aplicação deve representar uma feature/webservice do sistema.

### Domains
> Domínios representam todas as DTO's e Models utilizados em uma Application ou Repository

### Repositories
> O repositório abstrai a camada de banco de dados na WebAPI. Exemplo: todas as queries executadas no banco de dados, não devem ser executadas dentro da aplicação, para isso deverá ser delegado a uma função do repositório, para então nele executar essa query, a intenção disso é desacoplar as camadas e separar cada responsabilidade na aplicação.


## lib/

