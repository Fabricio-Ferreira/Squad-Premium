<h1 align="center"> Squad Premium </h1>

![logodasquadpremium](https://user-images.githubusercontent.com/13634186/232494109-b952c616-4bfc-4253-9b24-f98c60b757b9.png)

<h2> Descrição do projeto </h2>
O app é um gerenciador de tarefas que podem ter dois status, PENDENTE e CONCLUÍDA. Ele apresenta uma lista de tarefa, onde você pode inserir, deletar e editar uma tarefa.

Foi feito um sistema de sessões com login e senha, onde cada usuário pode acessar somentes suas tarefas.

Também foi adicionado testes na camada de UseCases, para rodar os testes, execute os seguintes comandos:
 - bash ./create_test_all_test.sh
 - flutter test "test/test_all_test.dart" "test/test_all_widgets_test.dart"
 - rm -f "test/test_all_test.dart"
 - rm -f "test/test_all_widgets_test.dart"

