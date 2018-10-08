# Taller raster

## Propósito

Comprender algunos aspectos fundamentales del paradigma de rasterización.

## Tareas

Emplee coordenadas baricéntricas para:

1. Rasterizar un triángulo; y,
2. Sombrear su superficie a partir de los colores de sus vértices.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)

Opcionales:

1. Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas; y,
2. Sombrear su superficie mediante su [mapa de profundidad](https://en.wikipedia.org/wiki/Depth_map).

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [frames](https://github.com/VisualComputing/frames/releases).

## Integrantes

Dos, o máximo tres si van a realizar al menos un opcional.

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|Steven Bustos|stevenbustos|

## Discusión

Describa los resultados obtenidos. En el caso de anti-aliasing describir las técnicas exploradas, citando las referencias.

### Resultado
![Resultados](raster_ws/images/result.png)

### Rasterizacion y sombreado de la superficie

![Resultados](raster_ws/images/result1.png)

Primero se obtiene la rasterizacion del triangulo y el coloreado segun los colores de los vertices con la tecnica de shadding de las coordenadas baricentricas.

### Anti-aliasing

![Resultados](raster_ws/images/result2.png)

Por ultimo se aplica la tecnica de [anti-aliasing](https://learnopengl.com/Advanced-OpenGL/Anti-Aliasing).

## Entrega

* Modo de entrega: [Fork](https://help.github.com/articles/fork-a-repo/) la plantilla en las cuentas de los integrantes.
* Plazo: 30/9/18 a las 24h.
