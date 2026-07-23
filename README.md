# 📚 Mi Club de Lectura - Entrenamiento Shiny en R

Mi objetivo de este repo es poder hacer una aplicación shiny desde cero, con apoyo de IA, pero yo entendiendo todo el código detrás. Para eso, se me ocurrió hacerla para la temática de libros, para llevar un registro de lo que leo y motivarme a leer más.

Entonces, acá se desarrolla una app hecha con **Shiny** para llevar el registro de los libros que voy leyendo: título, autor, fechas, calificación y mis reseñas. Cada libro que agrego se guarda automáticamente en un Excel (`libros.xlsx`), y se recarga solo cada vez que abro la app.

Mi idea es complementarlo con el estudio del libro Mastering Shiny (Hadleyn Wickham): <https://mastering-shiny.org/>

## 🚀 Cómo correrla

``` r
# Instalar dependencias (solo la primera vez)
install.packages(c("shiny", "tidyverse", "readxl", "writexl"))

# Correr la app
shiny::runApp("app.R")
```

Al abrirla vas a ver un formulario para agregar libros y una tabla con todo lo que ya cargaste. Todo se guarda solo, no hace falta tocar nada más.

------------------------------------------------------------------------

## 📖 Mis reseñas

### El coronel no tiene quien le escriba

<table>

<tr>

<td width="220" valign="top">

<img src="figuras/el_coronel_no_tiene_quien_le_escriba.jpeg" alt="Portada de El coronel no tiene quien le escriba" width="200"/>

</td>

<td valign="top">

**Autor:** Gabriel García Márquez **Leído:** 17 jul 2026 → 22 jul 2026 **Calificación:** ⭐⭐⭐☆☆ (3/5)

> Es un libro corto, no es que lo haya encontrado malo, pero tampoco me gustó. Creo que me faltó que pasaran más cosas. La verdad sí transmite emociones: la miseria, el dolor y el malestar de la pareja protagonista (el coronel y su esposa) por la pobreza extrema que viven.
>
> Tienen un gallo de pelea que es su última esperanza, pues intentan vender su reloj o cuadro y nadie los compra. Sin embargo, nunca venden el gallo; el coronel no escucha a su esposa para venderlo, y se entiende que el gallo competirá en 45 días, pero nunca relatan la pelea y no se sabe si gana o no.
>
> En fin, es simplemente un relato que te transmite cómo vive una familia extremadamente pobre que además perdió un hijo. Hay un contexto político que si quizás estuviese más al tanto lo hubiese disfrutado más; entiendo que el coronel participaba de un partido político, pero su lado perdió, y actualmente había toque de queda. Mencionan al coronel A. Buendía.

------------------------------------------------------------------------

<p align="center">

<i>Proyecto personal hecho para practicar 🌱</i>

</p>
