# =========================================================
# Mi Club de Lectura - App Shiny con guardado automático en Excel
# =========================================================
# Esta app tiene 2 partes, como toda app de Shiny:
#   1. ui     -> define QUÉ SE VE (inputs y outputs)
#   2. server -> define QUÉ HACE (la lógica, la reactividad)
#
# Además, guarda y carga los libros desde un archivo Excel
# llamado "libros.xlsx" que se crea en la misma carpeta del app.
# =========================================================

library(shiny)
library(tidyverse)  # incluye dplyr, tibble, etc.
library(readxl)     # para LEER excel
library(writexl)    # para ESCRIBIR excel

# Nombre del archivo donde se guardan los libros
archivo_excel <- "libros.xlsx"

# ---------------------------------------------------------
# Función chica para cargar los libros ya guardados (si existen)
# ---------------------------------------------------------
cargar_libros <- function() {
  if (file.exists(archivo_excel)) {
    read_excel(archivo_excel)
  } else {
    # Si todavía no existe el archivo, empezamos con una tabla vacía
    tibble(
      Titulo = character(),
      Autor = character(),
      Fecha_inicio = character(),
      Fecha_fin = character(),
      Calificacion = numeric(),
      Notas = character()
    )
  }
}

# ---------------------------------------------------------
# 1. UI: la interfaz (lo que el usuario ve)
# ---------------------------------------------------------
ui <- fluidPage(
  
  titlePanel("📚 Mi Club de Lectura Personal"),
  
  sidebarLayout(
    
    # --- Panel izquierdo: formulario para agregar un libro ---
    sidebarPanel(
      h4("Agregar un libro"),
      
      textInput("titulo", "Título del libro:", placeholder = "Ej: Cien años de soledad"),
      textInput("autor", "Autor:", placeholder = "Ej: Gabriel García Márquez"),
      dateInput("fecha_inicio", "Fecha en que lo inicié:", value = Sys.Date()),
      dateInput("fecha_fin", "Fecha en que lo terminé:", value = Sys.Date()),
      sliderInput("calificacion", "Calificación:", min = 1, max = 5, value = 3),
      textAreaInput("notas", "Notas u opinión:", placeholder = "¿Qué te pareció?", rows = 3),
      
      actionButton("agregar", "➕ Agregar libro", class = "btn-primary"),
      
      br(), br(),
      helpText("Los libros se guardan automáticamente en 'libros.xlsx'.")
    ),
    
    # --- Panel derecho: tabla con todos los libros agregados ---
    mainPanel(
      h4("Mis libros leídos"),
      tableOutput("tabla_libros")
    )
  )
)

# ---------------------------------------------------------
# 2. SERVER: la lógica de la app
# ---------------------------------------------------------
server <- function(input, output, session) {
  
  # reactiveValues guarda datos que pueden cambiar y "recordar"
  # su valor mientras la app está abierta.
  # Al arrancar, cargamos lo que ya había en el Excel (si existe).
  libros <- reactiveValues(
    datos = cargar_libros()
  )
  
  # observeEvent "escucha" cuando el usuario hace click en el botón
  observeEvent(input$agregar, {
    
    # Creamos una fila nueva con lo que el usuario escribió
    nueva_fila <- tibble(
      Titulo = input$titulo,
      Autor = input$autor,
      Fecha_inicio = as.character(input$fecha_inicio),
      Fecha_fin = as.character(input$fecha_),
      Calificacion = input$calificacion,
      Notas = input$notas
    )
    
    # La agregamos a la tabla que ya teníamos (bind_rows = "pegar filas")
    libros$datos <- bind_rows(libros$datos, nueva_fila)
    
    # Guardamos automáticamente en el Excel cada vez que se agrega un libro
    write_xlsx(libros$datos, archivo_excel)
    
    # Limpiamos el formulario para que quede listo para el próximo libro
    updateTextInput(session, "titulo", value = "")
    updateTextInput(session, "autor", value = "")
    updateTextAreaInput(session, "notas", value = "")
  })
  
  # output$tabla_libros se conecta con tableOutput("tabla_libros") en la ui
  output$tabla_libros <- renderTable({
    libros$datos
  })
}

# ---------------------------------------------------------
# Esto arranca la app
# ---------------------------------------------------------
shinyApp(ui = ui, server = server)