{% docs int_orders_enriched %}
Modelo intermedio de pedidos enriquecidos. Toma `stg_orders` como base y añade atributos derivados orientados a negocio, como descripciones de estado y categorización de prioridad, para simplificar el consumo en la capa business.
{% enddocs %}

{% docs int_lineitem_enriched %}
Modelo intermedio de líneas de pedido enriquecidas. Parte de `stg_lineitem` y calcula métricas operativas y monetarias derivadas, como importes con descuento, cargo total y tiempos logísticos, para alimentar la tabla de hechos.
{% enddocs %}
