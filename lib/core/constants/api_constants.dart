class ApiConstants {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  static const String todos = "/todos"; // GET
  static const String todo = "/todos/{id}"; // GET
  static const String createTodo = "/todos"; // POST
  static const String updateTodo = "/todos/{id}"; // PUT
  static const String deleteTodo = "/todos/{id}"; // DELETE
}
