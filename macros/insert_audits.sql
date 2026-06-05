{% macro insert_audits(action_name) -%}

  insert into TPCH_DWH.PUBLIC.DBT_AUDITS (audit_type, created_at)
  values (
    '{{ action_name }}',
    cast(convert_timezone('Europe/Madrid', current_timestamp()) as timestamp_ntz)
  );

  commit;

{%- endmacro %}
