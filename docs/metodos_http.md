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

---

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

---

# 4. PATCH

## ¿Para qué sirve?

El método HTTP **PATCH** se utiliza para realizar **modificaciones parciales** en un recurso existente en un servidor. 

A diferencia del método `PUT` (que reemplaza el recurso completo por uno nuevo), `PATCH` es eficiente y seguro porque solo envía al servidor los campos o datos específicos que necesitan ser actualizados, dejando el resto del recurso intacto. Esto ahorra ancho de banda y reduce la probabilidad de sobrescribir accidentalmente datos que no debían cambiar.

---

## ¿Cómo se usa?

Para usar el método `PATCH`, se debe enviar una solicitud HTTP a la URI (dirección) del recurso específico que se desea modificar. 

Los componentes clave de una solicitud `PATCH` son:
1. **Método HTTP**: `PATCH`
2. **URL**: La dirección del recurso específico (ej. `/posts/1`).
3. **Encabezados (Headers)**: 
   - `Content-Type`: Indica el formato de los datos enviados (comúnmente `application/json`).
4. **Cuerpo de la solicitud (Body)**: Un objeto (generalmente en formato JSON) que contiene **únicamente** los campos que se desean actualizar.

> **Nota**: El servidor debe estar configurado para aceptar y procesar solicitudes `PATCH`. La respuesta exitosa suele ser un código de estado `200 OK` (con el recurso actualizado en el cuerpo) o `204 No Content` (si no devuelve datos).

---

## Ejemplo Real

Usaremos la API pública de pruebas [JSONPlaceholder](https://jsonplaceholder.typicode.com/), específicamente el endpoint de publicaciones (`posts`).

Supongamos que queremos actualizar **solo el título** de la publicación con el ID `1`, sin modificar su `body` ni su `userId`.

### 1. Ejemplo con cURL (Línea de comandos)
```javascript
const url = "https://jsonplaceholder.typicode.com/posts/1";

const datosActualizados = {
  title: "Este es un título actualizado con PATCH"
};

fetch(url, {
  method: "PATCH",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify(datosActualizados)
})
  .then(response => response.json())
  .then(data => {
    console.log("Recurso actualizado:", data);
  })
  .catch(error => {
      console.error("Error al actualizar:", error);
  });
```

---

# 5. DELETE

## ¿Para qué sirve?

El método HTTP **DELETE** se utiliza para solicitar al servidor que **elimine un recurso específico** identificado por una URI (Uniform Resource Identifier). 

En el contexto de las arquitecturas RESTful, es una de las operaciones CRUD básicas (Delete/Borrar) y es fundamental para la gestión del ciclo de vida de los datos, permitiendo a los clientes eliminar registros como usuarios, publicaciones, comentarios o cualquier otra entidad gestionada por la API.

Características clave:
- **Idempotente**: Realizar la misma solicitud DELETE múltiples veces tiene el mismo efecto que realizarla una sola vez. Si el recurso ya fue eliminado, las solicitudes subsiguientes generalmente devolverán un `404 Not Found` o un `200 OK` / `204 No Content` sin causar efectos secundarios adicionales.
- **Seguro**: No se considera un método "seguro" (en términos HTTP, "seguro" significa que no modifica el estado del servidor), ya que su propósito explícito es alterar el estado al borrar datos.

---

## ¿Cómo se usa?

Para usar el método DELETE, se debe enviar una solicitud al endpoint que representa el recurso, **incluyendo el identificador único del recurso en la URL**. 

### Reglas y mejores prácticas:
1. **URL**: El identificador del recurso debe ir en la ruta (ej. `/posts/1`).
2. **Cuerpo de la solicitud (Body)**: Aunque la especificación HTTP no prohíbe enviar un cuerpo en una solicitud DELETE, **no es una práctica recomendada**. La mayoría de los servidores y proxies lo ignoran o lo rechazan. Toda la información necesaria para identificar el recurso debe estar en la URL o en encabezados (headers) de autenticación.
3. **Autenticación**: Casi siempre requerirá tokens de acceso (ej. `Authorization: Bearer <token>`) para garantizar que el usuario tenga permisos para eliminar el recurso.
4. **Respuestas típicas del servidor**:
   - `200 OK`: El recurso fue eliminado y la respuesta incluye un mensaje o representación del estado.
   - `202 Accepted`: La solicitud de eliminación ha sido aceptada, pero el proceso aún no se ha completado (común en procesos en segundo plano).
   - `204 No Content`: El recurso fue eliminado con éxito y no hay contenido adicional que devolver en la respuesta (la más común y recomendada).
   - `404 Not Found`: El recurso que se intenta eliminar no existe.
   - `403 Forbidden`: El cliente no tiene permisos para eliminar este recurso.

---

## Ejemplo Real

Utilizaremos la API pública de pruebas **[JSONPlaceholder](https://jsonplaceholder.typicode.com/)**, que simula una base de datos de publicaciones (posts). 

> **Nota**: JSONPlaceholder simula la eliminación. Devolverá una respuesta de éxito, pero el recurso no se eliminará realmente de su base de datos compartida, lo que lo hace perfecto para pruebas seguras.

### 1. Usando cURL (Línea de comandos)
```javascript
const postId = 1;
const url = `https://jsonplaceholder.typicode.com/posts/${postId}`;

fetch(url, {
  method: 'DELETE',
  headers: {
    'Content-Type': 'application/json',
    // 'Authorization': 'Bearer TU_TOKEN_AQUI' // Descomentar si la API requiere autenticación
  }
})
.then(response => {
  if (response.ok) {
    console.log(`Recurso eliminado exitosamente. Estado: ${response.status}`);
  } else {
    console.error(`Error al eliminar. Estado: ${response.status}`);
  }
})
.catch(error => console.error('Error de red:', error));
```