

MinutasApp

Aplicación iOS desarrollada en Swift para gestionar minutas y órdenes del día.  
Se ha desarrollado como proyecto final de la materia MTW y está pensada como una app sencilla pero estructurada con buenas prácticas (MVVM, vistas reutilizables, consumo de API, etc.).


Objetivo general

Permitir:

 -Autenticarse con un login básico (datos maquetados).
 -Consultar minutas y órdenes del día desde un archivo JSON local.
 -Crear nuevas minutas desde la app.
 -Visualizar el detalle de cada minuta (fecha, hora, orden del día, asistentes y acuerdos).
 -Consumir una API pública externa y mostrar datos en una pestaña dedicada.

 Funcionalidades principales

1. Pantalla de login

 Vista: LoginView
 
 Credenciales maquetadas:
    Usuario: demo
    Contraseña: 1234
    
 Al iniciar sesión correctamente se muestra la UI principal (tabs). 

2. Listado de minutas

 -Vista: MinutasView
-Carga de minutas desde un archivo local "minutas.json" incluido en el bundle.
-Implementado con patrón MVVM:
  -MinutasViewModel se encarga de:
    -Leer y decodificar el JSON.
    -Administrar el estado de carga (idle, loading, success, error).
-En la lista se muestra:
  -Título de la minuta.
  -Fecha como subtítulo (estilo iOS).

3. Detalle de minuta

-Vista: MinutaDetailView
-Muestra:
  -Título
  -Fecha
  -Hora
  -Orden del día (lista de puntos)
  -Asistentes
  -Acuerdos (si existen)
-Usa el componente reutilizable `SectionTitleView` para los encabezados:
  -“Orden del día”
  -“Asistentes”
  -“Acuerdos”

4. Creación de nuevas minutas

-Vista: NuevaMinutaView
-Permite capturar:
  -Fecha
  -Hora
  -Asistentes (separados por coma)
  -Puntos del orden del día (uno por línea)
  -Acuerdos (uno por línea)
-Usa el componente reutilizable LabeledTextField (con @Binding) para:
  -Fecha
  -Hora
  -Asistentes
-Al guardar:
  -Se construye una instancia de Minuta.
  -Se agrega a la lista a través de MinutasViewModel.agregar(minuta:).

5. Navegación y logout

-Archivo principal: MinutasAppApp
-Gestión del estado de login con @State:
  -Si isLoggedIn == false → LoginView
  -Si isLoggedIn == true → MainTabView
-MainTabView contiene:
  -Tab 1: MinutasView (lista + detalle + nueva minuta + cerrar sesión).
  -Tab 2: ResumenView (contenido maquetado).
  -Tab 3: RemoteUsersView (API externa).
-El botón “Cerrar sesión” desde MinutasView propaga el onLogout hasta MinutasAppApp, que cambia isLoggedIn a false.

6. Consumo de API pública externa

-Modelo: RemoteUser (conforma a Identifiable y Codable).
-ViewModel: RemoteUsersViewModel
  -Llama a `https://jsonplaceholder.typicode.com/users`.
  -Maneja estados:
    -idle
    -loading
    -success
    -error(String)
-Vista: RemoteUsersView
  -Muestra:
    -Indicador de carga (ProgressView) mientras se consultan los datos.
    -Mensaje de error + botón “Reintentar” en caso de fallo.
    -Una lista de usuarios con nombre, username y correo al cargar correctamente.


Arquitectura

-SwiftUI para la interfaz de usuario.
-Patrón MVVM:
  -Vistas “delgadas” (MinutasView, RemoteUsersView) que solo se encargan de la presentación.
  -ViewModels (MinutasViewModel, RemoteUsersViewModel) que contienen la lógica de negocio y el manejo de estados.
-Componentes reutilizables:
  -LabeledTextField: campo de texto con etiqueta, reutilizable en formularios (@Binding).
  -SectionTitleView: encabezado para secciones (Orden del día, Asistentes, Acuerdos…).


Variables de configuración (API_BASE_URL)

-Archivo de configuración: ConfigDebug.xcconfig
-Variable definida:
  ```text
  SLASH = /
  API_BASE_URL = https:$(SLASH)/api.ejemplo.com




