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
```
---

## 2. POST

Este documento explica el funcionamiento del método HTTP POST, su propósito, cómo se utiliza y proporciona ejemplos prácticos reales.

---

## ¿Para qué sirve?

El método HTTP **POST** se utiliza para **enviar datos al servidor** con el propósito de crear o actualizar un recurso. 

A diferencia del método `GET` (que solo solicita datos y los envía a través de la URL), `POST` envía la información en el **cuerpo (body)** de la solicitud. Esto lo hace ideal para:
- Crear nuevos registros en una base de datos (ej. registrar un usuario, publicar un artículo).
- Enviar datos sensibles o de gran tamaño que no deben ir expuestos en la URL.
- Subir archivos o formularios complejos.

---

## ¿Cómo se usa?

Para realizar una solicitud POST correctamente, generalmente necesitas definir tres componentes clave:

1. **URL (Endpoint)**: La dirección del servidor a la que se enviarán los datos (ej. `https://api.ejemplo.com/recursos`).
2. **Encabezados (Headers)**: Metadatos que le indican al servidor cómo interpretar los datos. El más común es:
   - `Content-Type: application/json` (indica que el cuerpo de la solicitud está en formato JSON).
3. **Cuerpo (Body / Payload)**: Los datos reales que se están enviando al servidor, normalmente estructurados en JSON, XML o `form-data`.

---

## Ejemplo Real (Fetch API)

A continuación, se muestra cómo utilizar el método POST para crear un nuevo "post" (artículo) utilizando la API pública de pruebas:  
🔗 **`https://jsonplaceholder.typicode.com/posts`**

```javascript
const url = "https://jsonplaceholder.typicode.com/posts";
const datos = {
  title: "Mi nuevo post",
  body: "Este es el contenido de prueba para el método POST.",
  userId: 1
};

fetch(url, {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify(datos)
})
.then(response => response.json())
.then(data => console.log("Respuesta del servidor:", data))
.catch(error => console.error("Error:", error));
````