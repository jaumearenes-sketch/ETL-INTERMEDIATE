{% docs stg_orders %}
Staging model de pedidos a nivel de orden. Estandariza la tabla `ORDERS` de TPCH, renombra columnas a snake_case y deja una estructura estable para consumo aguas abajo.
{% enddocs %}

{% docs stg_lineitem %}
Staging model de líneas de pedido a nivel de línea. Sirve como base transaccional detallada para cálculos de importes, descuentos, impuestos y métricas derivadas.
{% enddocs %}

{% docs stg_customer %}
Staging model de clientes. Normaliza la tabla `CUSTOMER` de TPCH y expone una versión limpia para dimensiones y joins con pedidos.
{% enddocs %}

{% docs stg_supplier %}
Staging model de proveedores. Estandariza la tabla `SUPPLIER` y preserva las claves necesarias para relaciones con nación y piezas-proveedor.
{% enddocs %}

{% docs stg_part %}
Staging model de piezas. Expone el catálogo base de productos con nombres de columna consistentes para uso en capas posteriores.
{% enddocs %}

{% docs stg_partsupp %}
Staging model de relación pieza-proveedor. Representa la intersección entre partes y proveedores, incluyendo disponibilidad y coste de suministro.
{% enddocs %}

{% docs stg_nation %}
Staging model de naciones. Normaliza la tabla `NATION` y mantiene la relación con región para análisis geográficos.
{% enddocs %}

{% docs stg_region %}
Staging model de regiones. Define el nivel geográfico más alto disponible en TPCH para agregaciones territoriales.
{% enddocs %}

{% docs customer_tracking %}
Vista de estado vigente de clientes construida desde `customer_snapshot`. Mantiene únicamente el registro actual de cada cliente usando la semántica SCD2 del snapshot (`dbt_valid_to is null`).
{% enddocs %}

{% docs order_tracking %}
Tabla de estado vigente de pedidos construida desde `orders_snapshot`. Mantiene únicamente el registro actual de cada pedido usando la semántica SCD2 del snapshot (`dbt_valid_to is null`).
{% enddocs %}
