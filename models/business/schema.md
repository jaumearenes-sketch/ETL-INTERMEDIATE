{% docs fact_orders %}
Tabla de hechos a nivel de línea de pedido. Consolida métricas de importe, descuento, impuestos, estados logísticos y claves hacia las dimensiones conformadas del modelo de negocio.
{% enddocs %}

{% docs dim_customer %}
Dimensión de cliente con atributos descriptivos y contexto geográfico. Sirve como punto de análisis para segmentación y reporting comercial.
{% enddocs %}

{% docs dim_supplier %}
Dimensión de proveedor con atributos descriptivos y contexto geográfico para análisis de abastecimiento y rendimiento por proveedor.
{% enddocs %}

{% docs dim_part %}
Dimensión de producto o pieza. Expone atributos descriptivos del catálogo para análisis de ventas, mix de producto y supply chain.
{% enddocs %}

{% docs dim_date %}
Dimensión de fechas usada para análisis temporal consistente en pedidos, envíos, compromisos y recepciones.
{% enddocs %}
