# Métodos HTTP: Guía Práctica con JSONPlaceholder

Este documento explica los 5 métodos HTTP principales (GET, POST, PUT, PATCH, DELETE), detallando su propósito, cómo se utilizan y un ejemplo práctico real utilizando la API pública [JSONPlaceholder](https://jsonplaceholder.typicode.com/) (`https://jsonplaceholder.typicode.com/posts`). Los ejemplos están escritos usando la API `fetch` de JavaScript, que es equivalente a lo que se configuraría en Postman o Thunder Client.

---

## 1. GET

### ¿Para qué sirve?
El método `GET` se utiliza para **solicitar o recuperar datos** de un servidor. Es una operación segura y de solo lectura, lo que significa que no debe modificar el estado de los recursos en el servidor.

### ¿Cómo se usa?
Se envía una petición a la URL del recurso deseado. No debe llevar un cuerpo (body) en la petición, aunque puede incluir parámetros de consulta (query strings) en la URL para filtrar o paginar resultados.

### Ejemplo real (Fetch API)
```javascript
fetch('https://jsonplaceholder.typicode.com/posts/1')
  .then(response => response.json())
  .then(data => console.log(data));