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
```
# 3. PUT

## ¿Para qué sirve?

El método HTTP **PUT** se utiliza principalmente para **actualizar un recurso existente** en su totalidad en un servidor. También puede usarse para **crear un nuevo recurso** en una URI (Uniform Resource Identifier) específica si este aún no existe.

Una característica fundamental de PUT es que es **idempotente**. Esto significa que no importa cuántas veces se envíe la misma solicitud PUT, el resultado en el servidor será exactamente el mismo que si se hubiera enviado una sola vez. El recurso final tendrá exactamente los datos proporcionados en la solicitud, sobrescribiendo cualquier dato anterior.

---

## ¿Cómo se usa?

Para utilizar correctamente el método PUT, se deben seguir estas convenciones RESTful:

1. **URI específica**: La solicitud debe dirigirse a la dirección exacta del recurso que se desea modificar (por ejemplo, añadiendo el identificador único al final de la URL: `/posts/1`).
2. **Cuerpo de la solicitud (Body)**: Se debe enviar la representación **completa** del recurso actualizado. A diferencia de `PATCH` (que solo envía los campos cambiados), `PUT` reemplaza todo el recurso.
3. **Cabeceras (Headers)**: Es imprescindible incluir la cabecera `Content-Type` para indicar el formato de los datos que se están enviando (comúnmente `application/json`).

---

## Ejemplo Real

A continuación se muestra un ejemplo utilizando la API pública de pruebas [JSONPlaceholder](https://jsonplaceholder.typicode.com/). 

```javascript
const url = "https://jsonplaceholder.typicode.com/posts/1";

const datosActualizados = {
  id: 1,
  title: "Título actualizado con PUT",
  body: "Este es el nuevo cuerpo completo del post reemplazado.",
  userId: 1
};

fetch(url, {
  method: "PUT",
  headers: {
    "Content-Type": "application/json; charset=utf-8"
  },
  body: JSON.stringify(datosActualizados)
})
  .then(response => response.json())
  .then(data => {
    console.log("Recurso actualizado con éxito:", data);
  })
  .catch(error => {
    console.error("Error al actualizar el recurso:", error);
  });
  ```
